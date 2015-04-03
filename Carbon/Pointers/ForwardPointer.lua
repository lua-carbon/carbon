--[[
	Carbon for Lua
	#class Pointers.ForwardPointer

	#description {
		Wraps primitives and forwards operators.
		Use @Operators for comparisons to ensure compatibility.
		Data pointed to by a ForwardPointer is copied.
	}
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
		return (tonumber(a) or a.___value) + (tonumber(b) or b.___value)
	end,
	__sub = function(a, b)
		return (tonumber(a) or a.___value) - (tonumber(b) or b.___value)
	end,
	__div = function(a, b)
		return (tonumber(a) or a.___value) / (tonumber(b) or b.___value)
	end,
	__mul = function(a, b)
		return (tonumber(a) or a.___value) * (tonumber(b) or b.___value)
	end,
	__mod = function(a, b)
		return (tonumber(a) or a.___value) % (tonumber(b) or b.___value)
	end,
	__pow = function(a, b)
		return (tonumber(a) or a.___value) ^ (tonumber(b) or b.___value)
	end,
	__concat = function(a, b)
		return tostring(a) .. tostring(b)
	end,
	__eq = function(a, b)
		return (indexable[type(a)] and a.___value or a) == (indexable[type(b)] and b.___value or b)
	end,
	__lt = function(a, b)
		return (indexable[type(a)] and a.___value or a) < (indexable[type(b)] and b.___value or b)
	end,
	__le = function(a, b)
		return (indexable[type(a)] and a.___value or a) <= (indexable[type(b)] and b.___value or b)
	end,
	__unm = function(self)
		return -self.___value
	end,
	__tostring = function(self)
		return tostring(self.___value)
	end,
	__index = function(self, key)
		local real = rawget(self, "___value")

		if (real == nil) then
			error("Object does not exist!", 2)
		end

		return real[key]
	end,
	__newindex = function(self, key, value)
		self.___value[key] = value
	end,
	__call = function(self, ...)
		return self.___value(...)
	end,
	__pairs = function(self)
		return pairs(self.___value)
	end,
	__ipairs = function(self)
		return ipairs(self.___value)
	end
}

local ForwardPointer = {}

--[[#method 1 {
	class public @ForwardPointer ForwardPointer:New(@any? value)
		optional value: The value to point this ForwardPointer at.

	Creates a new @ForwardPointer pointing at the given value.
}]]
function ForwardPointer:New(value)
	local instance = Dictionary.DeepCopy(self)
	instance.___value = value

	setmetatable(instance, meta)

	return instance
end

--[[#method 2 {
	object public @ForwardPointer ForwardPointer:Copy()

	Copies the @ForwardPointer object, but not the data pointed to.
}]]
function ForwardPointer:Copy()
	return self.class:New(self.___value)
end

--[[#method {
	object public any? ForwardPointer:Get()

	Returns an unwrapped version of the value pointed to by this pointer.
}]]
function ForwardPointer:Get()
	return self.___value
end

--[[#method {
	object public @void ForwardPointer:New(@any? value)
		optional value: The value to point this ForwardPointer at.

	Points the ForwardPointer at the given value.
}]]
function ForwardPointer:Set(value)
	self.___value = value
end

return ForwardPointer