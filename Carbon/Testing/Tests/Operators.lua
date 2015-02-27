--[[
	Carbon for Lua
	Test: Carbon.Operators
]]

local Carbon = (...)
local Operators = Carbon.Operators

local Test = {}

function Test:Run(test)
	Carbon.Testing.Checks.Augment(test)

	test:Assert(
		Operators.Add(5, 2) == 7,
		"Simple addition failed"
	)

	test:AssertCommutative(Operators.Add, "Add")

	test:Assert(
		Operators.Subtract(5, 2) == 3,
		"Simple subtraction failed!"
	)

	test:Assert(
		Operators.Multiply(5, 2) == 10,
		"Simple multiplication failed!"
	)

	test:AssertCommutative(Operators.Multiply, "Multiply")

	test:Assert(
		Operators.Divide(6, 2) == 3,
		"Simple division failed!"
	)
end

return Test