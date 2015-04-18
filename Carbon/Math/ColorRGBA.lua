--[[
	Carbon for Lua
	#class Math.ColorRGBA
	#inherits Math.Color, Math.Vector<4>

	#description {
		Provides an RGB color class with alpha.

		The loose form of a @ColorRGBA, `@loose<@ColorRGBA>` is of the form `(r, g, b, a)`.
	}
]]

local Carbon = (...)

local Color = Carbon.Math.Color
local Vector4 = Carbon.Math.Vector4

local ColorRGBA = Carbon.OOP:Class(Vector4)
	:Inherits(Color)

return ColorRGBA