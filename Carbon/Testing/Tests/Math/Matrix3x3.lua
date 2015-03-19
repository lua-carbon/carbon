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
end

return Test