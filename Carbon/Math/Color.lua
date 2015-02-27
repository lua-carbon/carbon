--[[
	Carbon for Lua
	Color Class

	Provides an abstract color class.
]]

local Carbon = (...)

local Color = Carbon.OOP:Class()
	:Attributes {
		Abstract = true
	}

return Color