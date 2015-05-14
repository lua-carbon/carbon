--[[
	Carbon for Lua
	Test: Carbon.Collections.List
]]

local Carbon = (...)
local List = Carbon.Collections.List

local Test = {}

Carbon.Testing:TestFor(Carbon.Collections.List, Test)

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
	local a = {1, 2, 3}
	local complex = {{}, newproxy(true)}

	test:Assert(
		list_congruent(List.Clear(a), {}),
		"List:Clear failed to clear!"
	)

	test:Assert(
		list_congruent(List.ShallowCopy(a), a),
		"List:ShallowCopy failed to keep simple congruence!"
	)

	test:Assert(
		list_congruent(List.ShallowCopy(complex), complex),
		"List:ShallowCopy falied to keep complex congruence!"
	)

	test:Assert(
		list_congruent(List.DeepCopy(a), a),
		"List:DeepCopy failed to keep simple congruence!"
	)

	-- Tables should be copied, userdata can't without a copy method.
	local complex_copy = List.DeepCopy(complex)
	test:Assert(
		complex[1] ~= complex_copy[1] and complex[2] == complex_copy[2],
		"List:DeepCopy failed to handle complex case!"
	)
end

return Test