--[[
	Carbon for Lua
	#class Pointers.WeakPointer

	#description {
		Stores a reference to an object without affecting its garbage collection.
		Provides an implicit copy barrier.
	}
]]

local Carbon = (...)
local Dictionary = Carbon.Collections.Dictionary

local WeakPointer = {}

--[[#method 1 {
	class public @WeakPointer WeakPointer:New(@any? value)
		optional value: The value to initialize the pointer with.

	Creates a new @WeakPointer.
}]]
function WeakPointer:New(value)
	local instance = newproxy(true)
	local container = setmetatable({value}, {__mode = "v"})

	getmetatable(instance).__value = container
	getmetatable(instance).__index = self

	return instance
end

--[[#method 2 {
	object public @WeakPointer WeakPointer:Copy()

	Copies the WeakPointer, but not the data it points to.
}]]
function WeakPointer:Copy()
	return self:New(getmetatable(self).__value)
end

--[[#method {
	object public @any? WeakPointer:Get()

	Returns the value currently pointed to by the @WeakPointer.
	Use `WeakPointer:Available()` first to make sure the data is still valid.
}]]
function WeakPointer:Get()
	return getmetatable(self).__value[1]
end

--[[#method {
	object public @void WeakPointer:Set(@any? value)
		optional value: The value to initialize the pointer with.

	Sets a new value for the @WeakPointer.
}]]
function WeakPointer:Set(value)
	getmetatable(self).__value[1] = value
end

--[[#method {
	object public @bool WeakPointer:Available()

	Returns whether the data the WeakPointer is pointing to is still valid for access.
	If this returns false, the data was probably garbage collected.
}]]
function WeakPointer:Available()
	return (getmetatable(self).__value[1] ~= nil)
end

return WeakPointer