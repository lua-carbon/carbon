--[[
	Carbon for Lua
	3x3 FastMatrix
]]

local Carbon = (...)

local Matrix3x3, except = Carbon.Math.FastMatrix:Generate(3, 3)

if (not Matrix3x3) then
	if (except.Is[Carbon.Exceptions.CodeGenerationException]) then
		print(except.GeneratedCode)
	end
	
	Carbon.Error(except)
end

function Matrix3x3:OrthonormalizeInPlace()
	return self:Orthonormalize(self)
end

function Matrix3x3:Orthonormalize(out)
	local m11 = self:Get(1, 1)
	local m12 = self:Get(1, 2)
	local m13 = self:Get(1, 3)
	local m21 = self:Get(2, 1)
	local m22 = self:Get(2, 2)
	local m23 = self:Get(2, 3)
	local m31 = self:Get(3, 1)
	local m32 = self:Get(3, 2)
	local m33 = self:Get(3, 3)

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

	if (out) then
		return self.class:PlacementNew(out,
			m11, m12, m13,
			m21, m22, m23,
			m31, m32, m33
		)
	else
		return self.class:New(
			m11, m12, m13,
			m21, m22, m23,
			m31, m32, m33
		)
	end
end

return Matrix3x3