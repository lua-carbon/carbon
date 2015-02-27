--[[
	Carbon for Lua
	Promises
]]

local Carbon = (...)
local OOP = Carbon.OOP

local unpack = unpack or table.unpack

local Promise = OOP:Class()
	:Members {
		__chain = {},
		__result = nil,
		__success = nil,
		__success_chain = {},
		__fail_chain = {}
	}

function Promise:_init(handler)
	if (handler) then
		handler(self)
	end
end

function Promise:Await()
	local running = coroutine.running()
	self:Then(function(...)
		coroutine.resume(running, ...)
	end)

	return coroutine.yield(self)
end

function Promise:All(...)
	local promise = Promise:New()
	local count = 0
	local result = {}
	local max = select("#", ...)

	for i = 1, max do
		select(i, ...):Then(function(...)
			result[i] = (...)
			count = count + 1

			if (count == max) then
				promise:Resolve(unpack(result))
			end
		end)
	end

	return promise
end

function Promise:Any(...)
	local promise = Promise:New()
	local done = false

	for i = 1, select("#", ...) do
		select(i, ...):Then(function(...)
			if (not done) then
				done = true

				promise:Resolve((...))
			end
		end)
	end

	return promise
end

function Promise:Resolve(...)
	self.__success = true
	self.__result = {...}

	local handler = table.remove(self.__success_chain, 1)

	while (handler) do
		self.__result = {handler(unpack(self.__result))}

		handler = table.remove(self.__success_chain, 1)
	end
end

function Promise:Reject(...)
	self.__success = false
	self.__result = {...}

	local handler = table.remove(self.__fail_chain, 1)

	while (handler) do
		self.__result = {handler(unpack(self.__result))}

		handler = table.remove(self.__success_chain, 1)
	end
end

function Promise:Then(success, fail)
	if (success) then
		table.insert(self.__success_chain, success)
	end

	if (fail) then
		table.insert(self.__fail_chain, fail)
	end
	
	-- Handle case where promise already resolved
	if (self.__result) then
		local handler

		if (self.__success) then
			handler = table.remove(self.__success_chain, 1)
		else
			handler = table.remove(self.__fail_chain, 1)
		end

		if (handler) then
			self.__result = {handler(unpack(self.__result))}
		end
	end

	return self
end

function Promise:Catch(fail)
	return self:Then(nil, fail)
end

return Promise