--[[
	Carbon for Lua
	#class Math.Quaternion
	#inherits Math.Vector<4>

	#description {
		Provides a quaternion object for representing rotations.
	}
]]

local Carbon = (...)
local OOP = Carbon.OOP
local Vector4 = Carbon.Math.Vector4

local Quaternion = OOP:Class(Vector4)

return Quaternion