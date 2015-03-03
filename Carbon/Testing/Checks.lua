--[[
	Carbon for Lua
	Test Checks

	A library that provides a few potentially useful checks.
]]

local Carbon = (...)

local unpack = unpack or table.unpack

local Sets = Carbon.Testing.Sets

local Graphene = Carbon:GetGraphene()
local Checks = Graphene:MakeImportable {
	__augmented = {}
} :Except {
	__augmented = true
}

--[[
	bool Checks.IsCommutative(function, set, n)

	Returns whether the function is binary commutative:
	f(a, b) = f(b, a)
]]
function Checks.IsCommutative(f, set, n)
	set = set or Sets.Numbers
	n = n or 1

	for i = 1, n do
		if (f(set[i], set[i+1]) ~= f(set[i+1], set[i])) then
			return false
		end
	end

	return true
end

--[[
	bool Checks.IsAssociative(function, set, n)

	Returns whether a function is ternary associative:
	f(f(a, b), c) = f(a, f(b, c))
]]
function Checks.IsAssociative(f, set, n)
	set = set or Sets.Numbers
	n = n or 1

	for i = 1, n do
		if (f(f(set[i], set[i+1]), set[i+2]) ~= f(set[i], f(set[i+1], set[i+2]))) then
			return false
		end
	end

	return true
end

--[[
	bool Checks.IsIndexable(any)

	Returns whether the value can be indexed.
]]
function Checks.IsIndexable(x)
	local t = type(x)

	if (t == "string" or t == "table") then
		return true
	end

	local meta = getmetatable(t)
	if (meta and type(meta.__index) == "function") then
		return true
	end

	return false
end

--[[
	bool Checks.IsCallable(any)

	Returns whether the value can be called by a function.
]]
function Checks.IsCallable(x)
	if (type(x) == "function") then
		return true
	end

	local meta = getmetatable(x)
	if (meta and type(meta.__call) == "function") then
		return true
	end

	return false
end

--[[
	bool, ... Checks.DoesNotThrow(f, ...)

	Returns whether the function, when called with these args, does not throw.
]]
function Checks.DoesNotThrow(f, ...)
	return pcall(f, ...)
end

--[[
	bool, ... Checks.DoesThrow(f, ...)

	Returns whether the function, when called with these args, throws can error
]]
function Checks.DoesThrow(f, ...)
	local result = {pcall(f, ...)}
	local ok = table.remove(result, 1)

	return (not ok), unpack(result)
end

--[[
	void Checks.Augment(TestResult)

	Augments a TestResult object with extra methods.
	Transforms a TestResult into an AugmentedTestResult.
]]
function Checks.Augment(test)
	for key, value in pairs(Checks.__augmented) do
		test[key] = value
	end
end

--[[
	bool Checks.AssertCommutative(TestResult, function, function_name?)
	bool AugmentedTestResult:AssertCommutative(function, function_name?)
	
	Asserts that a method is a commutative with an error message.
]]
function Checks.AssertCommutative(test, f, name)
	name = name or Graphene.Metadata:Get(f, "Name") or "[unknown function]"

	return test:Assert(
		Checks.IsCommutative(f),
		("%s was not commutative!"):format(name)
	)
end
Checks.__augmented.AssertCommutative = Checks.AssertCommutative

--[[
	bool Checks.AssertAssociative(TestResult, function, function_name?)
	bool AugmentedTestResult:AssertAssociative(function, function_name?)
	
	Asserts that a method is a associative with an error message.
]]
function Checks.AssertAssociative(test, f, name)
	name = name or Graphene.Metadata:Get(f, "Name") or "[unknown function]"

	return test:Assert(
		Checks.IsAssociative(f),
		("%s was not associative!"):format(name)
	)
end
Checks.__augmented.AssertAssociative = Checks.AssertAssociative

return Checks