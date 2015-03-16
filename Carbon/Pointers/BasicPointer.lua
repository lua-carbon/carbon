--[[
	Carbon for Lua
	#class Pointers.BasicPointer

	#description {
		Wraps an object to pass it by-reference.
		Creates an implicit copy barrier.
	}
]]

local Carbon = (...)

local BasicPointer = {}

--[[#method 1 {
	public @BasicPointer BasicPointer:New(@any? value)
		optional value: The value the pointer should point at.

	Creates a new BasicPointer, pointing at any sort of object.
}]]
function BasicPointer:New(value)
	local instance = newproxy(true)
	getmetatable(instance).__index = self
	getmetatable(instance).__value = value

	return instance
end

--[[#method {
	public @any? BasicPointer:Get()

	Returns the value currently pointed at by the BasicPointer.
}]]
function BasicPointer:Get()
	return getmetatable(self).__value
end

--[[#method {
	public @void BasicPointer:Set(@any? value)

	Sets a new value to be pointed at by this BasicPointer.
}]]
function BasicPointer:Set(value)
	getmetatable(self).__value = value
end

return BasicPointer