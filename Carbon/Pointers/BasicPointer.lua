--[[
	Carbon for Lua
	#class Pointers.BasicPointer

	#description {
		Wraps an object to pass it by-reference.
	}
]]

local Carbon = (...)

local BasicPointer = {}

--[[#method 1 {
	class public @BasicPointer BasicPointer:New(@any? value)
		optional value: The value the pointer should point at.

	Creates a new @BasicPointer, pointing at any sort of object.
}]]
function BasicPointer:New(value)
	local instance = newproxy(true)
	getmetatable(instance).__index = self
	getmetatable(instance).__value = value

	return instance
end

--[[#method 2 {
	object public @BasicPointer BasicPointer:Copy()

	Copies the @BasicPointer, but not the value pointed to.
}]]
function BasicPointer:Copy()
	return self.class:New(getmetatable(self).__value)
end

--[[#method {
	object public @any? BasicPointer:Get()

	Returns the value currently pointed at by the BasicPointer.
}]]
function BasicPointer:Get()
	return getmetatable(self).__value
end

--[[#method {
	object public @void BasicPointer:Set(@any? value)

	Sets a new value to be pointed at by this BasicPointer.
}]]
function BasicPointer:Set(value)
	getmetatable(self).__value = value
end

return BasicPointer