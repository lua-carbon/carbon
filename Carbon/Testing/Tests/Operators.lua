--[[
	Carbon for Lua
	Test: Carbon.Operators
]]

local Carbon = (...)
local Operators = Carbon.Operators

Carbon.Testing.Checks:ImportAll()

local Test = {}

Carbon.Testing:TestFor(Operators, Test)

function Test:Run(test)
	Augment(test)

	test:Assert(
		Operators.Add(5, 2) == 7,
		"Simple addition failed"
	)

	test:AssertCommutative(Operators.Add)
	test:AssertAssociative(Operators.Add)

	test:Assert(
		Operators.Subtract(5, 2) == 3,
		"Simple subtraction failed!"
	)

	test:Assert(
		Operators.Multiply(5, 2) == 10,
		"Simple multiplication failed!"
	)

	test:AssertCommutative(Operators.Multiply)
	test:AssertAssociative(Operators.Multiply)

	test:Assert(
		Operators.Divide(6, 2) == 3,
		"Simple division failed!"
	)

	test:Assert(
		Operators.Power(5, 2) == 25,
		"Simple power failed!"
	)

	test:Assert(
		Operators.Concat(5, 2) == "52",
		"Simple concatenation failed!"
	)

	test:AssertAssociative(Operators.Concat)
end

return Test