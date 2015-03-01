--[[
	Carbon for Lua
	Test: Carbon.CopyBarrier
]]

local Carbon = (...)
local Dictionary = Carbon.Collections.Dictionary
local CopyBarrier = Carbon.CopyBarrier

local Test = {}

Carbon.Testing:TestFor(CopyBarrier, Test)

function Test:Run(test)
	Carbon.Testing:Requires(Dictionary)

	local block = {
		a = {},
		b = CopyBarrier:New({})
	}

	local copy = Dictionary.DeepCopy(block)

	test:Assert(
		block.b == copy.b,
		"CopyBarrier was copied during Dictionary.DeepCopy!"
	)
end

return Test