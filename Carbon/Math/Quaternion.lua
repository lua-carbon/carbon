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
local Vector3 = Carbon.Math.Vector3
local Vector4 = Carbon.Math.Vector4

local sin, cos = math.sin, math.cos
local asin, acos = math.asin, math.acos
local sqrt = math.sqrt
local abs = math.abs

local Quaternion = OOP:Class(Vector4)

--[[#method 1 {
	$constructor_init_pair(FromAngles Quaternion(@Vector3 angles))
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
	$constructor_init_pair(FromLooseAngles Quaternion(@number x, @number y, @number z))
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

--[[#method {
	object public @loose<@Quaternion> Quaternion:LooseConjugate()

	Returns the conjugate of the quaternion in loose form.
}]]
function Quaternion:LooseConjugate()
	return -self[1], -self[2], -self[3], self[4]
end

--[[#method {
	object public @Quaternion Quaternion:Conjugate([@Quaternion out])
		optional out: Where to put the resulting data.

	Returns the conjugate of the @Quaternion, `(-i, -j, -k, w)`.
}]]
function Quaternion:Conjugate(out)
	if (out) then
		out:Init(self:LooseConjugate())
	else
		self.class:New(self:LooseConjugate())
	end
end

--[[#method {
	object public @Quaternion Quaternion:Conjugate!()
	-alias: object public @Quaternion Quaternion:ConjugateInPlace()

	Conjugates the @Quaternion in-place.
}]]
function Quaternion:ConjugateInPlace()
	return self:Conjugate(self)
end

--[[#method {
	class public @loose<@Quaternion> Quaternion:LooseMultiplyLooseLoose(@loose<@Quaternion> a, @loose<@Quaternion> b)
		required a: The left operand on the multiply.
		required b: The right operand on the multiply.

	Multiplies two loose quaternions together and returns the result in loose form.
}]]
function Quaternion:LooseMultiplyLooseLoose(x1, y1, z1, w1, x2, y2, z2, w2)
	return
		w1*x2 + x1*w2 + y1*z2 - z1*y2,
		w1*y2 - x1*z2 + y1*w2 + z1*x2,
		w1*z2 + x1*y2 - y1*x2 + z1*w2,
		w1*w2 - x1*x2 - y1*y2 - z1*z2
end

--[[#method {
	object public @loose<@Quaternion> @Quaternion:LooseMultiplyLoose(@loose<@Quaternion> quaternion)
		required quaternion: The quaternion to multiply with.

	Multiplies the quaternion with a loose @Quaternion, yielding a @loose<@Quaternion>.
}]]
function Quaternion:LooseMultiplyLoose(x2, y2, z2, w2)
	local x1, y1, z1, w1 = self:GetComponents()

	return self:LooseMultiplyLooseLoose(x1, y1, z1, w1, x2, y2, z2, w2)
end

--[[#method {
	object public @Quaternion Quaternion:MultiplyLoose(@loose<@Quaternion> quaternion, [@Quaternion out])
		required quaternion: The loose quaternion to multiply with.
		optional out: Where to put the resulting data.

	Multiplies the quaternion with a loose @Quaternion.
}]]
function Quaternion:MultiplyLoose(x2, y2, z2, w2, out)
	return self.class:PlacementNew(out, self:LooseMultiplyLoose(x2, y2, z2, w2))
end

--[[#method {
	object public @Quaternion Quaternion:MultiplyLoose!(@loose<@Quaternion> quaternion)
		required quaternion: The loose quaternion to multiply with.

	Multiplies this quaternion with another loose @Quaternion in-place.
}]]
function Quaternion:MultiplyLooseInPlace(x2, y2, z2, w2)
	return self:MultiplyLoose(x2, y2, z2, w2, self)
end

--[[#method {
	object public @Quaternion Quaternion:Multiply(@Quaternion other, [@Quaternion out])
		required other: The quaternion to multiply with.
		optional out: Where to put the resulting data.

	Multiplies the quaternion with another @Quaternion.
}]]
function Quaternion:Multiply(other, out)
	local x2, y2, z2, w2 = other:GetComponents()
	return self.class:PlacementNew(out, self:LooseMultiplyLoose(x2, y2, z2, w2))
end

--[[#method {
	object public self Quaternion:Multiply!(@Quaternion other)
	-alias: object public self Quaternion:MultiplyInPlace(@Quaternion other)
		required other: The quaternion to multiply with.

	Multiplies the quaternion with another @Quaternion and puts the result in the first @Quaternion.
}]]
function Quaternion:MultiplyInPlace(other)
	return self:Multiply(other, self)
end

--[[#method {
	object public self @Quaternion:Slerp(@Quaternion other, @number t, [@Quaternion out])
		required other: The @Quaternion to slerp with.
		required t: A number, normally on [0, 1], that determines the mixing ratio of the quaternions.
		optional out: Where to put the resulting slerped @Quaternion.

	Performs a @Quaternion slerp (spherical interpolation).
}]]
function Quaternion:Slerp(other, t, out)
	local cos_half_theta = self:DotProduct(other)
	if (abs(cos_half_theta) >= 1) then
		return self.class:PlacementNew(out, self[1], self[2], self[3], self[4])
	end

	local half_theta = acos(cos_half_theta)
	local sin_half_theta = sqrt(1 - cos_half_theta^2)

	if (abs(sin_half_theta) < 1e-4) then
		return self.class:PlacementNew(out,
			self[1] * 0.5 + other[1] * 0.5,
			self[2] * 0.5 + other[2] * 0.5,
			self[3] * 0.5 + other[3] * 0.5,
			self[4] * 0.5 + other[4] * 0.5
		)
	end

	local r_a = sin((1 - t) * half_theta) / sin_half_theta
	local r_b = sin(t * half_theta) / sin_half_theta

	return self.class:PlacementNew(out,
		self[1] * r_a + other[1] * r_b,
		self[2] * r_a + other[2] * r_b,
		self[3] * r_a + other[3] * r_b,
		self[4] * r_a + other[4] * r_b
	)
end

--[[#method {
	object public self Quaternion:Slerp!(@Quaternion other, @number t)
	-alias: object public self @Quaternion:SlerpInPlace(@Quaternion other, @number t)
		required other: The @Quaternion to slerp with.
		required t: A number, normally on [0, 1], that determines the mixing ratio of the quaternions.

	Performs a @Quaternion slerp (spherical interpolation) in place.
}]]
function Quaternion:SlerpInPlace(other, t, out)
	return self:Slerp(other, t, self)
end

--[[#method {
	object public self Quaternion:TransformVector(@Vector3 vec, [@Vector3 out])
		required vec: The vector to rotate.
		optional out: Where to put the resulting data.

	Transforms a vector by rotating it.
}]]
function Quaternion:TransformVector(vec, out)
	local x, y, z, w = self:LooseMultiplyLoose(vec[1], vec[2], vec[3], 0)
	x, y, z = self.class:LooseMultiplyLooseLoose(
		x, y, z, w,
		self:LooseConjugate()
	)

	if (out) then
		out:Init(x, y, z)
	else
		return Vector3(x, y, z)
	end
end

return Quaternion