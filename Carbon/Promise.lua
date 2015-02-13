--[[
	Carbon for Lua
	Promises

	Copyright (c) 2014 Lucien Greathouse (LPGhatguy)

	This software is provided 'as-is', without any express or implied warranty.
	In no event will the authors be held liable for any damages arising from the
	use of this software.

	Permission is granted to anyone to use this software for any purpose, including
	commercial applications, and to alter it and redistribute it freely, subject to
	the following restrictions:

	1. The origin of this software must not be misrepresented; you must not claim
	that you wrote the original software. If you use this software in a product, an
	acknowledgment in the product documentation would be appreciated but is not required.

	2. Altered source versions must be plainly marked as such, and must not be misrepresented
	as being the original software.

	3. This notice may not be removed or altered from any source distribution.
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