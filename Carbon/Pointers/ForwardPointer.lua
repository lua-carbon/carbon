--[[
	Carbon for Lua
	Forward Pointer

	Wraps primitives and forwards operators.
	Use Carbon.Number for comparisons to ensure compatibility.
	Data pointed to by a ForwardPointer is copied.
]]

local Carbon = (...)
local Dictionary = Carbon.Collections.Dictionary

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

function ForwardPointer:New(value)
	local instance = Dictionary.DeepCopy(self)
	instance.__value = value

	setmetatable(instance, meta)

	return instance
end

function ForwardPointer:Set(value)
	self.__value = value
end

return ForwardPointer