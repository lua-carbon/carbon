--[[
	Carbon for Lua
	Test: Carbon.Math.Matrix3x3
]]

local Carbon = (...)
local Dictionary = Carbon.Collections.Dictionary
local Matrix3x3 = Carbon.Math.Matrix3x3

local Test = {}

Carbon.Testing:TestFor(Matrix3x3, Test)

local sqrt = math.sqrt

local function approxeq(a, b, E)
	return math.abs(a - b) < (E or 1e-6)
end

-- Compare the 3x3 part of any matrix.
local function matrixapproxeq(a, b, E)
	for i = 1, 3 do
		for j = 1, 3 do
			local x, y = a:Get(i, j), b:Get(i, j)
			if (not x or not y) then
				return false
			end

			if (not approxeq(x, y)) then
				return false
			end
		end
	end

	return true
end

function Test:Run(test)
	local a = Matrix3x3:New(
		1, 2, 3,
		4, 5, 6,
		-7, -8, -9
	)

	local b = Matrix3x3:New(
		9, 8, 7,
		6, 5, 4,
		3, 2, 1
	)

	local ab_correct = Matrix3x3:New(
		30, 24, 18,
		84, 69, 54,
		-138, -114, -90
	)

	-- Equivalent matrix in loose 3x3 form
	local aa = Matrix3x3:NewFromLoose(3, 3,
		1, 2, 3,
		4, 5, 6,
		-7, -8, -9
	)

	if (matrixapproxeq(a, aa)) then
		test:Pass()
	else
		test:Fail("NewFromLoose failed!")
	end

	-- Test transposition:
	local correct_a_trans = Matrix3x3:New(
		1, 4, -7,
		2, 5, -8,
		3, 6, -9
	)

	local a_trans = a:Transpose()

	if (matrixapproxeq(a_trans, correct_a_trans)) then
		test:Pass()
	else
		test:Fail("Matrix transposition failed!")
	end

	-- WolframAlpha says the bottom row is not linearly-independent and is thus (0, 0, 0)
	-- We don't really care I don't think, but I should research this more.
	local correct_ortho_a = Matrix3x3:New(
		1 / sqrt(14), sqrt(2 / 7), 3 / sqrt(14),
		4 / sqrt(21), 1 / sqrt(21), -2 / sqrt(21),
		-4 / sqrt(21), -1 / sqrt(21), 2 / sqrt(21)
	)

	local ortho_a = a:Orthonormalize()

	if (matrixapproxeq(ortho_a, correct_ortho_a)) then
		test:Pass()
	else
		test:Fail("Failed to orthogonalize matrix!")
	end

	-- Test GetRow
	local x1, y1, z1 = a:GetRow(1)
	local x2, y2, z2 = a:GetRow(2)
	local x3, y3, z3 = a:GetRow(3)

	if (x1 == 1 and y1 == 2 and z1 == 3 and
		x2 == 4 and y2 == 5 and z2 == 6 and
		x3 == -7 and y3 == -8 and z3 == -9) then
		test:Pass()
	else
		test:Fail("GetRow failed!")
	end

	-- Test SetRow
	local aa = a:Copy()
	aa:SetRow(1, 3, 2, 1)
	aa:SetRow(2, 6, 5, 4)
	aa:SetRow(3, -9, -8, -7)

	local x1, y1, z1 = aa:GetRow(1)
	local x2, y2, z2 = aa:GetRow(2)
	local x3, y3, z3 = aa:GetRow(3)

	if (x1 == 3 and y1 == 2 and z1 == 1 and
		x2 == 6 and y2 == 5 and z2 == 4 and
		x3 == -9 and y3 == -8 and z3 == -7) then
		test:Pass()
	else
		test:Fail("SetRow failed!")
	end

	-- Test GetColumn
	local x1, x2, x3 = a:GetColumn(1)
	local y1, y2, y3 = a:GetColumn(2)
	local z1, z2, z3 = a:GetColumn(3)

	if (x1 == 1 and y1 == 2 and z1 == 3 and
		x2 == 4 and y2 == 5 and z2 == 6 and
		x3 == -7 and y3 == -8 and z3 == -9) then
		test:Pass()
	else
		test:Fail("GetColumn failed!")
	end

	-- Test SetColumn
	local aa = a:Copy()
	aa:SetColumn(1, -7, 4, 1)
	aa:SetColumn(2, -8, 5, 2)
	aa:SetColumn(3, -9, 6, 3)

	local x1, x2, x3 = aa:GetColumn(1)
	local y1, y2, y3 = aa:GetColumn(2)
	local z1, z2, z3 = aa:GetColumn(3)

	if (x1 == -7 and y1 == -8 and z1 == -9 and
		x2 == 4 and y2 == 5 and z2 == 6 and
		x3 == 1 and y3 == 2 and z3 == 3) then
		test:Pass()
	else
		test:Fail("SetColumn failed!")
	end

	-- Test Multiplication
	local ab = a:MultiplyMatrix(b)
	if (matrixapproxeq(ab, ab_correct)) then
		test:Pass()
	else
		test:Fail("Matrix multiplication failed!")
	end

	-- Test loose multiplication
	local ab = a:MultiplyLooseMatrix(b:ToLoose())
	if (matrixapproxeq(ab, ab_correct)) then
		test:Pass()
	else
		test:Fail("Loose matrix multiplication failed!")
	end
end

return Test