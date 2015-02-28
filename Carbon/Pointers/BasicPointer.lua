--[[
	Carbon for Lua
	Basic Pointer

	Wraps an object to pass it by-reference.
	Creates an implicit copy barrier
]]

local Carbon = (...)

local BasicPointer = {}

function BasicPointer:New(value)
	local instance = newproxy(true)
	getmetatable(instance).__index = self
	getmetatable(instance).__value = value

	return instance
end

function BasicPointer:Get()
	return getmetatable(self).__value
end

function BasicPointer:Set(value)
	getmetatable(self).__value = value
end

return BasicPointer