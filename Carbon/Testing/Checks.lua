--[[
	Carbon for Lua
	Test Checks

	A library that provides a few potentially useful checks.
]]

local Carbon = (...)

local Checks = Carbon:GetGraphene():MakeImportable({})
local Directory

local a = 11
local b = 17
local c = 23

function Checks.IsCommutative(f)
	return f(a, b) == f(b, a)
end

function Checks.IsAssociative(f)
	return f(f(a, b), c) == f(a, f(b, c))
end

function Checks.Augment(test)
	test.AssertCommutative = Checks.AssertCommutative
	test.AssertAssociative = Checks.AssertAssociative
end

function Checks.AssertCommutative(test, f, name)
	name = name or debug.getinfo(f).name

	return test:Assert(
		Checks.IsCommutative(f),
		("%s was not commutative!"):format(name)
	)
end

function Checks.AssertAssociative(test, f, name)
	name = name or debug.getinfo(f).name

	return test:Assert(
		Checks.IsAssociative(f),
		("%s was not associative!"):format(name)
	)
end

return Checks