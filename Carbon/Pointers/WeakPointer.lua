--[[
	Carbon for Lua
	Weak Pointer

	Stores a reference to an object without affecting its garbage collection.
	Provides an implicit copy barrier.
]]

local Carbon = (...)
local Dictionary = Carbon.Collections.Dictionary

local WeakPointer = {}

function WeakPointer:New(value)
	local instance = newproxy(true)
	local container = setmetatable({value}, {__mode = "v"})

	getmetatable(instance).__value = container
	getmetatable(instance).__index = self

	return instance
end

function WeakPointer:Get()
	return getmetatable(self).__value[1]
end

function WeakPointer:Set(value)
	getmetatable(self).__value[1] = value
end

function WeakPointer:Available()
	return (getmetatable(self).__value[1] ~= nil)
end

return WeakPointer