--[[
	Carbon for Lua
	#class CopyBarrier
	#inherits OOP.Object

	#description {
		Prevents copying of the data it points to.
		Forwards indexes and newindexes to target.
	}
]]

local Carbon = (...)
local Dictionary = Carbon.Collections.Dictionary

local CopyBarrier = {}

--[[#method 1 {
	class public @CopyBarrier CopyBarrier:New(@any? value)
		required value: The value to point at.

	Creates a new @CopyBarrier pointing at the given value.
}]]
function CopyBarrier:New(value)
	local instance = newproxy(true)
	local body = Dictionary.DeepCopy(self)

	getmetatable(instance).__index = body
	getmetatable(instance).__newindex = body
	getmetatable(instance).__value = value

	setmetatable(body, {
		__index = value,
		__newindex = value
	})

	return instance
end

--[[#method {
	object public self CopyBarrier:Copy()

	A stub that simply returns itself to prevent copying methods from copying this.
}]]
function CopyBarrier:Copy()
	return self
end

--[[#method {
	object public @any? CopyBarrier:Get()

	Returns the value pointed to by the @CopyBarrier.
}]]
function CopyBarrier:Get()
	return getmetatable(self).__value
end

--[[#method {
	object public @void CopyBarrier:Set(@any? value)
		required value: The new value for the @CopyBarrier.

	Sets a new value for the @CopyBarrier.
}]]
function CopyBarrier:Set(value)
	local meta = getmetatable(getmetatable(self).__index)

	getmetatable(self).__value = value
	meta.__index = value
	meta.__newindex = value
end

return CopyBarrier