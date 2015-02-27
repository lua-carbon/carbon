--[[
	Carbon for Lua
	Weak Pointer

	Stores a reference to an object without affecting its garbage collection.
	Basically a ForwardPointer.
]]

local Carbon = (...)
local Dictionary = Carbon.Collections.Dictionary

local indexable = {
	["table"] = true,
	["userdata"] = true,
	["string"] = true
}

local meta = {
	__mode = "v",
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
			error("Object has been collected!", 2)
		end

		return real[key]
	end,
	__newindex = function(self, key, value)
		rawset(self.__value, key, value)
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

local WeakPointer = {}

function WeakPointer:New(value)
	local instance = Dictionary.DeepCopy(self)
	instance.__value = value

	setmetatable(instance, meta)

	return instance
end

function WeakPointer:Set(value)
	self.__value = value
end

function WeakPointer:Available()
	return (rawget(self, "__value") ~= nil)
end

return WeakPointer