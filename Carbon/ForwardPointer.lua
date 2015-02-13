--[[
	Carbon for Lua
	Forward Pointer

	Wraps primitives and forwards operators.
	Use Carbon.Number for comparisons to ensure compatibility.

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
local Dictionary = Carbon.Collections.Dictionary

local constructor_name = Carbon.Config.OOP:_require("ConstructorName")
local set_name = Carbon.Config.Pointers:_require("SetName")

local indexable = {
	["table"] = true,
	["userdata"] = true,
	["string"] = true
}

local meta = {
	__add = function(a, b)
		return (tonumber(a) or a.__value) + (tonumber(b) or b.__value)
	end,
	__sub = function(a, b)
		return (tonumber(a) or a.__value) - (tonumber(b) or b.__value)
	end,
	__div = function(a, b)
		return (tonumber(a) or a.__value) / (tonumber(b) or b.__value)
	end,
	__mul = function(a, b)
		return (tonumber(a) or a.__value) * (tonumber(b) or b.__value)
	end,
	__mod = function(a, b)
		return (tonumber(a) or a.__value) % (tonumber(b) or b.__value)
	end,
	__pow = function(a, b)
		return (tonumber(a) or a.__value) ^ (tonumber(b) or b.__value)
	end,
	__concat = function(a, b)
		return tostring(a) .. tostring(b)
	end,
	__eq = function(a, b)
		return (indexable[type(a)] and a.__value or a) == (indexable[type(b)] and b.__value or b)
	end,
	__lt = function(a, b)
		return (indexable[type(a)] and a.__value or a) < (indexable[type(b)] and b.__value or b)
	end,
	__le = function(a, b)
		return (indexable[type(a)] and a.__value or a) <= (indexable[type(b)] and b.__value or b)
	end,
	__unm = function(self)
		return -self.__value
	end,
	__tostring = function(self)
		return tostring(self.__value)
	end,
	__index = function(self, key)
		local real = rawget(self, "__value")

		if (real == nil) then
			error("Object does not exist!", 2)
		end

		return real[key]
	end,
	__newindex = function(self, key, value)
		self.__value[key] = value
	end,
	__call = function(self, ...)
		return self.__value(...)
	end,
	__pairs = function(self)
		return pairs(self.__value)
	end,
	__ipairs = function(self)
		return ipairs(self.__value)
	end
}

local ForwardPointer = {}

ForwardPointer[constructor_name] = function(self, value)
	local instance = Dictionary.DeepCopy(self)
	instance.__value = value

	setmetatable(instance, meta)

	return instance
end

ForwardPointer[set_name] = function(self, value)
	self.__value = value
end

return ForwardPointer