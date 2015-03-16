--[[
	Carbon for Lua
	#class Math.Color
	#inherits OOP.Object

	#description {
		**Abstract**

		Provides an abstract color class.
	}
]]

local Carbon = (...)

local Color = Carbon.OOP:Class()
	:Attributes {
		Abstract = true
	}

return Color