--[[
	Carbon for Lua
	Test: Carbon.Collections.Tuple
]]

local Carbon = (...)
local Tuple = Carbon.Collections.Tuple

local Test = {}

Carbon.Testing:TestFor(Carbon.Collections.Tuple, Test)

--[[
	Checks whether two lists are shallowly congruent
]]
local function list_congruent(a, b)
	for key, value in ipairs(a) do
		if (value ~= b[key]) then
			return false
		end
	end

	return true
end

function Test:Run(test)
	local t = Tuple:New(1, 2, 3)

	test:Assert(
		list_congruent({t:Unpack()}, {1, 2, 3}),
		"Tuple repacking failed!"
	)
end

return Test