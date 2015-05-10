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

	test:Assert(
		A.Inherits and A.Attributes and A.Metatable and A.Members,
		"Class failed to have basic creation methods!"
	)

	test:Assert(
		A.Init and A.New and A.PlacementNew and A.Is,
		"Class failed to have basic usage methods!"
	)

	local Ai = A:New()

	test:Assert(
		Ai.Init and Ai.Copy and Ai.Is,
		"Instance failed to have basic usage methods!"
	)

	test:Assert(
		Ai.Is[A],
		"Instance failed to have proper Is!"
	)
end

return Test