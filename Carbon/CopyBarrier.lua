--[[
	Carbon for Lua
	CopyBarrier

	Prevents copying of the data it points to.
	Forwards indexes and newindexes to target.
]]

local Carbon = (...)
local Dictionary = Carbon.Collections.Dictionary

local CopyBarrier = {}

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

function CopyBarrier:Copy()
	return self
end

function CopyBarrier:Get()
	return getmetatable(self).__value
end

function CopyBarrier:Set(value)
	local meta = getmetatable(getmetatable(self).__index)

	getmetatable(self).__value = value
	meta.__index = value
	meta.__newindex = value
end

return CopyBarrier