--[[
	Carbon for Lua
	Test: Carbon.Collections.Set
]]

local Carbon = (...)
local Set = Carbon.Collections.Set

local Test = {}

Carbon.Testing:TestFor(Carbon.Collections.Set, Test)

--[[
	Sorts two lists and makes sure that they're shallow-congruent
]]
local function unsorted_list_congruent(a, b)
	table.sort(a)
	table.sort(b)

	for key, value in ipairs(a) do
		if (b[key] ~= value) then
			return false
		end
	end

	return true
end

function Test:Run(test)
	local set = {
		foo = true,
		hello = true,
		bar = false
	}

	local keys = {"foo", "hello"}

	test:Assert(
		unsorted_list_congruent(Set.ToList(set), keys),
		"Set:ToList failed to convert properly!"
	)
end

return Test