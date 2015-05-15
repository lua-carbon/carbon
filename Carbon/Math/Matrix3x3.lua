--[[
	Carbon for Lua
	#class Math.Matrix3x3
	#inherits Math.Matrix

	#description {
		A 3x3 row-major matrix.
	}

	#alias Quaternion Math.Quaternion
]]

local Carbon = (...)

local Quaternion = Carbon.Math.Quaternion
local Matrix3x3, except = Carbon.Math.Matrix:Generate(3, 3)

if (not Matrix3x3) then
	if (except.Is[Carbon.Exceptions.CodeGenerationException]) then
		print(except.GeneratedCode)
	end
	
	Carbon.Error(except)
end

-- Reference:
-- http://www.euclideanspace.com/maths/geometry/rotations/conversions/matrixToQuaternion/
--[[#method {
	object public @loose<@Quaternion> Matrix3x3:ToLooseQuaternion()

	Converts the @Matrix3x3 into a loose-form @Quaternion.
}]]
function Matrix3x3:ToLooseQuaternion()
	local m11, m12, m13 = self:GetRow(1)
	local m21, m22, m23 = self:GetRow(2)
	local m31, m32, m33 = self:GetRow(3)

	local trace = m11 + m22 + m33 + 1

	if (trace > 0) then
		local S = 0.5 / math.sqrt(trace)
		local W = 0.25 / S

		return
			(m32 - m23) * S,
			(m13 - m31) * S,
			(m21 - m12) * S,
			W
	else
		local tr = m11 + m22 + m33

		if (tr > 0) then
			local S = math.sqrt(tr + 1) * 2 -- S = 4*qw
			return
				(m32 - m23) / S,
				(m13 - m31) / S,
				(m21 - m12) / S,
				0.25 * S
		elseif (m11 > m22 and m11 > m33) then
			local S = math.sqrt(1 + m11 - m22 - m33) * 2 -- S = 4*qx
			return
				0.25 * S,
				(m12 + m21) / S,
				(m13 + m31) / S,
				(m32 - m23) / S
		elseif (m22 > m33) then
			local S = math.sqrt(1 + m22 - m11 - m33) * 2 -- S = 4*qy
			return
				(m12 + m21) / S,
				0.25 * S,
				(m23 + m32) / S,
				(m13 - m31) / S
		else
			local S = math.sqrt(1 + m33 - m11 - m22) * 2 -- S = 4*qz
			return
				(m13 + m31) / S,
				(m23 + m32) / S,
				0.25 * S,
				(m21 - m12) / S
		end
	end
end

--[[#method {
	object public @Quaternion Matrix3x3:ToQuaternion([@Quaternion out])
		optional out: Where to put the resulting data.

	Converts the @Matrix3x3 into a @Quaternion.
}]]
function Matrix3x3:ToQuaternion(out)
	if (out) then
		out:Init(self:ToLooseQuaternion())
	else
		return Quaternion:New(self:ToLooseQuaternion())
	end
end

--[[#method {
	object public @Matrix3x3 Matrix3x3:Orthonormalize([@Matrix3x3 out])
		optional out: Where to put the resulting data, a new matrix if not given.

	Orthonormalizes the rotation matrix, optionally outputting data into an existing @Matrix3x3.
}]]
function Matrix3x3:Orthonormalize(out)
	out = out or self.class:New()

	local m11, m12, m13 = self:GetRow(1)
	local m21, m22, m23 = self:GetRow(2)
	local m31, m32, m33 = self:GetRow(3)

	-- Compute q1

	local length = math.sqrt(m11^2 + m12^2 + m13^2)

	m11 = m11 / length
	m12 = m12 / length
	m13 = m13 / length

	-- Compute q2
	local dot_0 =
		m11 * m21 +
		m12 * m22 +
		m13 * m23

	m21 = m21 - dot_0 * m11
	m22 = m22 - dot_0 * m12
	m23 = m23 - dot_0 * m13

	length = math.sqrt(m21^2 + m22^2 + m23^2)

	m21 = m21 / length
	m22 = m22 / length
	m23 = m23 / length

	-- Compute q3
	local dot_1 =
		m21 * m31 +
		m22 * m32 +
		m23 * m33

	dot_0 =
		m11 * m31 +
		m12 * m32 +
		m13 * m33

	m31 = m31 - dot_0 * m11 + dot_1 * m21
	m32 = m32 - dot_0 * m12 + dot_1 * m22
	m33 = m33 - dot_0 * m13 + dot_1 * m23

	length = math.sqrt(m31^2 + m32^2 + m33^2)

	m31 = m31 / length
	m32 = m32 / length
	m33 = m33 / length

	return out:InitFromLoose(3, 3,
		m11, m12, m13,
		m21, m22, m23,
		m31, m32, m33
	)
end

--[[#method {
	object public self Matrix3x3:Orthonormalize!()
	-alias: object public self Matrix3x3:OrthonormalizeInPlace()

	Orthonormalizes the matrix in-place.
}]]
function Matrix3x3:OrthonormalizeInPlace()
	return self:Orthonormalize(self)
end

return Matrix3x3