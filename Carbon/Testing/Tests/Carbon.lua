--[[
	Carbon for Lua
	Test: Carbon
]]

local Carbon = (...)

local Test = {}

Carbon.Testing:TestFor(Carbon, Test)

function Test:Run(test)
	if (Carbon.Support.lfs or Carbon.Support.love) then
		Carbon:FullyLoad()
	end

	test:Pass()
end

return Test