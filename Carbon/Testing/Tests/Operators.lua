--[[
	Carbon for Lua
	Test: Carbon.Operators
]]

local Carbon = (...)
local Operators = Carbon.Operators

local Test = {}

function Test:Run(test)
	if (Operators.Add(5, 2) ~= 7) then
		test:Fail("Simple addition failed!")
	end

	if (Operators.Add(5, 2) ~= Operators.Add(2, 5)) then
		test:Fail("Addition was not communative!")
	end

	if (Operators.Subtract(5, 2) ~= 3) then
		test:Fail("Simple subtraction failed!")
	end
end

return Test