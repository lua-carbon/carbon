--[[
	Carbon for Lua
	#class Math.Quaternion
	#inherits Math.Vector<4>

	#description {
		Provides a quaternion object for representing rotations.

		The loose form of a @Quaternion, `@loose<@Quaternion>` is of the form `(x, y, z, w)`
	}

	#alias Vector3 Math.Vector3
]]

local Carbon = (...)
local OOP = Carbon.OOP
local Vector4 = Carbon.Math.Vector4

local Quaternion = OOP:Class(Vector4)

local sin, cos = math.sin, math.cos

--[[#method 1 {
	class public @Quaternion Quaternion:NewFromAngles(@Vector3 angles)
	-alias: object public @Quaternion Quaternion:InitFromAngles(@Vector3 angles)
		required angles: A @Vector3 containing the angles to convert.

	Converts a @Vector3 containing Euler angles into a @Quaternion.
}]]
function Quaternion:NewFromAngles(angles)
	return self:New(self:NewLooseFromLooseAngles(angles[1], angles[2], angles[3]))
end

function Quaternion:InitFromAngles(angles)
	return self:Init(self:NewLooseFromLooseAngles(angles[1], angles[2], angles[3]))
end

--[[#method 1 {
	class public @loose<@Quaternion> Quaternion:NewLooseFromAngles(@Vector3 angles)
		required angles: A @Vector3 containing the angles to convert.

	Converts a @Vector3 containing Euler angles into a loose @Quaternion.
}]]
function Quaternion:NewLooseFromAngles(angles)
	return self:NewLooseFromLooseAngles(angles[1], angles[2], angles[3])
end

--[[#method 1 {
	class public @Quaternion Quaternion:NewFromLooseAngles(@number x, @number y, @number z)
	-alias: object public self Quaternion:InitFromLooseAngles(@number x, @number y, @number z)
		required x: The x component of the angles.
		required y: The y component of the angles.
		required z: The z component of the angles.

	Converts a @loose<@Vector3> containing Euler angles into a @Quaternion.
}]]
function Quaternion:NewFromLooseAngles(x, y, z)
	return self:New(self:NewLooseFromLooseAngles(x, y, z))
end

function Quaternion:InitFromLooseAngles(x, y, z)
	return self:Init(self:NewLooseFromLooseAngles(x, y, z))
end

--[[#method 1 {
	class public @loose<@Quaternion> Quaternion:NewLooseFromLooseAngles(@number x, @number y, @number z)
		required x: The x component of the angles.
		required y: The y component of the angles.
		required z: The z component of the angles.

	Converts a @loose<@Vector3> containing Euler angles into a loose @Quaternion.
}]]
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