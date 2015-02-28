--[[
	Carbon for Lua
	Lookup Pointer

	Provides an interface to referencing a data lookup.
	LookupPointers are copied, but the data they point to stays the same.
]]

local Carbon = (...)
local Dictionary = Carbon.Collections.Dictionary

local indexable = {
	["table"] = true,
	["userdata"] = true,
	["string"] = true
}

local function nav(parent, path)
	for i = 1, #path do
		if (not indexable[type(parent)]) then
			return nil
		end

		parent = parent[path[i]]
	end

	return parent
end

local function getvalue(self)
	local parent = rawget(self, "__parent")
	local path = rawget(self, "__path")

	if (parent and path) then
		return nav(parent, path)
	else
		return self
	end
end

local meta = {
	__add = function(a, b)
		return (tonumber(a) or getvalue(a)) + (tonumber(b) or getvalue(b))
	end,
	__sub = function(a, b)
		return (tonumber(a) or getvalue(a)) - (tonumber(b) or getvalue(b))
	end,
	__div = function(a, b)
		return (tonumber(a) or getvalue(a)) / (tonumber(b) or getvalue(b))
	end,
	__mul = function(a, b)
		return (tonumber(a) or getvalue(a)) * (tonumber(b) or getvalue(b))
	end,
	__mod = function(a, b)
		return (tonumber(a) or getvalue(a)) % (tonumber(b) or getvalue(b))
	end,
	__pow = function(a, b)
		return (tonumber(a) or getvalue(a)) ^ (tonumber(b) or getvalue(b))
	end,
	__concat = function(a, b)
		return tostring(a) .. tostring(b)
	end,
	__eq = function(a, b)
		return (indexable[type(a)] and getvalue(a) or a) == (indexable[type(b)] and getvalue(b) or b)
	end,
	__lt = function(a, b)
		return (indexable[type(a)] and getvalue(a) or a) < (indexable[type(b)] and getvalue(b) or b)
	end,
	__le = function(a, b)
		return (indexable[type(a)] and getvalue(a) or a) <= (indexable[type(b)] and getvalue(b) or b)
	end,
	__unm = function(self)
		return -getvalue(self)
	end,
	__tostring = function(self)
		return tostring(getvalue(self))
	end,
	__index = function(self, key)
		return getvalue(self)[key]
	end,
	__newindex = function(self, key, value)
		getvalue(self)[key] = value
	end,
	__call = function(self, ...)
		return getvalue(self)(...)
	end,
	__pairs = function(self)
		return pairs(getvalue(self))
	end,
	__ipairs = function(self)
		return ipairs(getvalue(self))
	end
}

local LookupPointer = {}

function LookupPointer:New(parent, path)
	local instance = Dictionary.DeepCopy(self)
	instance.__parent = parent
	instance.__path = path

	setmetatable(instance, meta)

	return instance
end

function LookupPointer:Set(parent, path)
	self.__parent = parent
	self.__path = path
end

return LookupPointer