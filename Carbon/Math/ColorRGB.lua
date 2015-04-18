--[[
	Carbon for Lua
	#class Math.ColorRGB
	#inherits Math.Color, Math.Vector<3>

	#description {
		Provides an RGB color class with no alpha.

		The loose form of a @ColorRGB, `@loose<@ColorRGB>` is of the form `(r, g, b)`.
	}
]]

local Carbon = (...)

local Color = Carbon.Math.Color
local Vector3 = Carbon.Math.Vector3

local ColorRGB = Carbon.OOP:Class(Vector3)
	:Inherits(Color)

return ColorRGB