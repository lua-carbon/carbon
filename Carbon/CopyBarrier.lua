--[[
	Carbon for Lua
	CopyBarrier

	Prevents copying of the data it points to.
	Forwards indexes and newindexes to target.
]]

local Carbon = (...)

local CopyBarrier = {}

function CopyBarrier:New(value)
	local instance = newproxy(true)
	getmetatable(instance).__index = value
	getmetatable(instance).__newindex = value

	return instance
end

function CopyBarrier:Get()
	return getmetatable(self).__index
end

function CopyBarrier:Set(value)
	getmetatable(self).__index = value
	getmetatable(self).__newindex = value
end

return CopyBarrier