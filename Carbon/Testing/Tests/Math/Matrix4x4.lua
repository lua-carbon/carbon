--[[
	Carbon for Lua
	Test: Carbon.Math.Matrix4x4
]]

local Carbon = (...)
local Dictionary = Carbon.Collections.Dictionary
local Matrix4x4 = Carbon.Math.Matrix4x4

local Test = {}

Carbon.Testing:TestFor(Matrix4x4, Test)

function Test:Run(test)
	Carbon.Testing:Requires(Carbon.Math.Matrix3x3)

	local a = Matrix4x4:New(
		1, 2, 3, 4,
		5, 6, 7, 8,
		9, 10, 11, 12,
		13, 14, 15, 16
	)

	-- Test constructor
	local passed = true
	for i = 1, 16 do
		if (a[i] ~= i) then
			passed = false
			test:Fail("Element " .. i .. " in Matrix didn't initialize correctly!")
			break
		end
	end

	if (passed) then
		test:Pass()
	end

	-- Test Get
	passed = true
	local nextone = 1
	for i = 1, 4 do
		for j = 1, 4 do
			if (a:Get(i, j) ~= nextone) then
				passed = false
				test:Fail(("Element at (%d, %d) was not gotten correctly!"):format(i, j))
				break
			end
			nextone = nextone + 1
		end

		if (not passed) then
			break
		end
	end

	if (passed) then
		test:Pass()
	end

	-- Test Set
	passed = true
	local aa = a:Copy()
	local nextone = 17
	for i = 1, 4 do
		for j = 1, 4 do
			aa:Set(i, j, nextone)
			if (aa:Get(i, j) ~= nextone) then
				passed = false
				test:Fail(("Element at (%d, %d) failed to be set correctly!"):format(i, j))
				break
			end
			nextone = nextone + 1
		end

		if (not passed) then
			break
		end
	end

	if (passed) then
		test:Pass()
	end
end

return Test