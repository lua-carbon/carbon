--[[
	Carbon for Lua
	#class Promise

	#description {
		Implements a model for asynchronous tasks via promises.

		A type of `Promise<T>` is a Promise that returns the given type, `T`.
	}
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

--[[#method 1 {
	$typical_constructor(Promise())

	Creates or initializes a @Promise.
}]]
function Promise:Init(handler)
	if (handler) then
		handler(self)
	end
end

--[[#method {
	object public T Promise<T>:Await()

	Yields until the promise has a result to give.

	Can only be called from an asynchronous method.
}]]
function Promise:Await()
	local running = coroutine.running()
	self:Then(function(...)
		coroutine.resume(running, ...)
	end)

	return coroutine.yield(self)
end

--[[#method {
	object public @Promise Promise:All(...)
		required ...: A list of promises to wait for.

	Returns a promise that resolves when all of the given promises resolve.
}]]
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

--[[#method {
	object public @Promise Promise:Any(...)
		required ...: A list of promises to wait for.

	Returns a promise that resolves when any one of the given promises resolves.
}]]
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

--[[#method 2 {
	object public @void Promise:Resolve(...)
		required ...: A list of parameters to be passed as the result.

	Resolves the promise, passing along a set of results.

	Counts the promise as a success.
}]]
function Promise:Resolve(...)
	self.__success = true
	self.__result = {...}

	local handler = table.remove(self.__success_chain, 1)

	while (handler) do
		self.__result = {handler(unpack(self.__result))}

		handler = table.remove(self.__success_chain, 1)
	end
end

--[[#method 2 {
	object public @void Promise:Reject(...)
		required ...: A list of parameters to be passed as the result.

	Rejects the promise, passing along a set of results.

	Counts the promise as a failure.
}]]
function Promise:Reject(...)
	self.__success = false
	self.__result = {...}

	local handler = table.remove(self.__fail_chain, 1)

	while (handler) do
		self.__result = {handler(unpack(self.__result))}

		handler = table.remove(self.__success_chain, 1)
	end
end

--[[#method 2 {
	object public self Promise:Then([@function success, @function fail])
		optional success: The function to call if this promise succeeds.
		optional fail: The function to call if this promise fails.

	Registers an action to occur after this promise resolves.
}]]
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

--[[#method 2 {
	object public self Promise:Catch([@function fail])
		optional fail: The function to call if this promise fails.

	Syntactical sugar for `promise:Then(nil, fail)`.
}]]
function Promise:Catch(fail)
	return self:Then(nil, fail)
end

return Promise