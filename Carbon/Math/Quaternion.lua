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

local sin, cos = math.sin, math.cos

function Quaternion:NewFromAngles(angles, out)
	return self:PlacementNew(out, self:NewLooseFromLooseAngles(angles[1], angles[2], angles[3]))
end

function Quaternion:NewLooseFromAngles(angles)
	return self:NewLooseFromLooseAngles(angles[1], angles[2], angles[3])
end

function Quaternion:NewFromLooseAngles(x, y, z, out)
	return self:PlacementNew(out, self:NewLooseFromLooseAngles(x, y, z))
end

function Quaternion:NewLooseFromLooseAngles(x, y, z)
	local c1 = cos(x / 2)
	local c2 = cos(y / 2)
	local c3 = cos(z / 2)
	local s1 = sin(x / 2)
	local s2 = sin(y / 2)
	local s3 = sin(z / 2)

	return
		(s1 * s2 * c3) + (c1 * c2 * s3),
		(s1 * c2 * c3) + (c1 * s2 * s3),
		(c1 * s2 * c3) - (s1 * c2 * s3),
		(c1 * c2 * c3) - (s1 * s2 * s3)
end

return Quaternion