--[[
	Carbon for Lua
	Test: Carbon.Collections.Dictionary
]]

local Carbon = (...)
local Dictionary = Carbon.Collections.Dictionary

local Test = {}

Carbon.Testing:TestFor(Carbon.Collections.Dictionary, Test)

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

--[[
	Checks whether two dictionaries are shallow-congruent
]]
local function dict_congruent(a, b)
	for key, value in pairs(a) do
		if (b[key] ~= value) then
			return false
		end
	end

	for key, value in pairs(b) do
		if (a[key] ~= value) then
			return false
		end
	end

	return true
end

--[[
	Generates data for our test cases
]]
local function case_data()
	local a = Dictionary:New({
		one = "1",
		two = "2",
		three = "3"
	})

	local b = Dictionary:New({
		one = {},
		two = newproxy(false)
	})

	b.three = b

	local c = Dictionary:New({
		two = "22",
		three = "333"
	})

	local d = Dictionary:New({
		one = {}
	})

	return a, b, c, d
end

function Test:Run(test)
	local a, b, c, d = case_data()

	-- Test Constructors
	test:Assert(
		a.one and a.two and a.three and b.one and b.two and b.three,
		"Simple dictionary constructor failed!"
	)

	-- Test Keys/Values
	test:Assert(
		unsorted_list_congruent({"one", "two", "three"}, a:Keys()),
		"Dictionary:Keys failed!"
	)

	test:Assert(
		unsorted_list_congruent({"1", "2", "3"}, a:Values()),
		"Dictionary:Values failed!"
	)

	-- Test Deep/Shallow Copy
	test:Assert(
		dict_congruent(a, a:ShallowCopy()),
		"Dictionary:ShallowCopy failed in simple case #1!"
	)

	test:Assert(
		dict_congruent(b, b:ShallowCopy()),
		"Dictionary:ShallowCopy failed in simple case #2!"
	)

	test:Assert(
		dict_congruent(a, a:DeepCopy()),
		"Dictionary:DeepCopy failed in simple case!"
	)

	local b_deepcopy = b:DeepCopy()
	test:Assert(
		b.one ~= b_deepcopy.one,
		"Dictionary:DeepCopy failed to copy member table!"
	)

	test:Assert(
		b.two == b_deepcopy.two,
		"Dictionary:DeepCopy failed to preserve userdata member!"
	)

	test:Assert(
		b_deepcopy == b_deepcopy.three,
		"Dictionary:DeepCopy failed to preserve self-reference!"
	)

	local ac = a:ShallowMerge(c:ShallowCopy())

	test:Assert(
		ac.three == c.three and ac.two == c.two,
		"Dictionary:ShallowMerge failed to preserve existing keys!"
	)

	test:Assert(
		ac.one == a.one,
		"Dictionary:ShallowMerge failed to add new keys!"
	)

	local bd = b:DeepCopyMerge(d:ShallowCopy())

	test:Assert(
		bd.one == d.one,
		"Dictionary:DeepCopyMerge failed to preserve existing keys!"
	)

	test:Assert(
		bd.two == b.two,
		"Dictionary:DeepCopyMerge failed to add new userdata member!"
	)

	test:Assert(
		bd.three ~= b.two,
		"Dictionary:DeepCopyMerge failed to deepcopy member table!"
	)
end

return Test