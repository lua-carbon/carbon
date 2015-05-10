--[[
	Carbon for Lua
	Test: Carbon.OOP
]]

local Carbon = (...)
local OOP = Carbon.OOP

local Test = {}

Carbon.Testing:TestFor(OOP, Test)

function Test:Run(test)
	test:Assert(
		OOP.Class and OOP.StaticClass,
		"OOP failed to contain basic usage methods!"
	)

	local A = OOP:Class()
		:Members {
			Hello = "World"
		}

	test:Assert(
		A.Inherits and A.Attributes and A.Metatable and A.Members,
		"Class A failed to have basic creation methods!"
	)

	test:Assert(
		A.Init and A.New and A.PlacementNew and A.Is,
		"Class A failed to have basic usage methods!"
	)

	test:Assert(
		A.Hello == "World",
		"Class A failed to have property!"
	)

	local Ai = A:New()

	test:Assert(
		Ai.Init and Ai.Copy and Ai.Is,
		"Instance A failed to have basic usage methods!"
	)

	test:Assert(
		Ai.Is[OOP.Object] and Ai.Is[A],
		"Instance A failed to have proper Is!"
	)

	test:Assert(
		Ai.Hello == "World",
		"Instance A failed to have correct property!"
	)

	local B = OOP:Class()
		:Inherits(A)
		:Members {
			Hello = "Earth"
		}

	local Bi = B:New()

	test:Assert(
		Bi.Is[OOP.Object] and Bi.Is[A] and Bi.Is[B],
		"Instance B failed to have proper Is!"
	)

	-- Test multiple inheritance
	local C = OOP:Class()
		:Inherits(A, B)

	local Ci = C:New()

	test:Assert(
		Ci.Is[OOP.Object] and Ci.Is[A] and Ci.Is[B] and Ci.Is[C],
		"Instance C (MI) failed to have property Is!"
	)

	-- Property inheritance is first-come-first-serve
	test:Assert(
		Ci.Hello == "World",
		"Instance C failed to take on defined property inheriance!"
	)
end

return Test