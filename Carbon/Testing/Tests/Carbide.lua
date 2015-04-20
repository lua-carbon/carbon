--[[
	Carbon for Lua
	Test: Carbon.Carbide
]]

local Carbon = (...)
local Dictionary = Carbon.Collections.Dictionary
local Carbide = Carbon.Carbide

local Test = {}

Carbon.Testing:TestFor(Carbide, Test)

-- Describes a carbide feature with a name and list of valid examples
local function feature(test, name, ...)
	for i = 1, select("#", ...) do
		local case = select(i, ...)
		local snippet, result_check

		if (type(case) == "string") then
			snippet = case
		elseif (type(case) == "table") then
			snippet, result_check = case[1], case[2]
		else
			error("Invalid feature definition!")
		end

		local source = Carbide.ParseCore(snippet, compilation_settings)
		local compiled, err = Carbon.LoadString(source, "snippet #" .. i)

		if (not compiled) then
			test:Fail(("Feature %s failed to compile on snippet #%d"):format(name, i))
			test:Message("Input code:\n" .. snippet)
			test:Message("Result code:\n" .. source)

			return
		end

		local success, result = pcall(compiled, Carbon)

		if (not success) then
			test:Fail(("Feature %s threw error in snippet #%d"):format(name, i))
			test:Message("Input code:\n" .. snippet)
			test:Message("Result code:\n" .. source)
			test:Message("Error:\n" .. result)

			return
		end

		if (result ~= result_check) then
			test:Fail(("Feature %s gave a wrong result in snippet #%d: got %s, expected %s"):format(name, i, result, result_check))
			test:Message("Input code:\n" .. snippet)
			test:Message("Result code:\n" .. source)

			return
		end
	end

	test:Pass()
end

function Test:Run(test)
	local compilation_settings = {
		FEATURE_LEVEL = 4
	}

	feature(test, "bang", 
		{[[
			local obj = {
				Value = 5,
				BangInPlace = function(self)
					return self.Value
				end
			}

			return obj:Bang!()
		]], 5},

		{[[
			local obj = {
				BangInPlace = function()
					return 5
				end
			}

			return obj.Bang!()
		]], 5}
	)

	feature(test, "dan")

	feature(test, "increment",
		{[[
			local x = 5
			x++
			return x
		]], 6},

		{[[
			local x = {5}
			x[1]++
			return x[1]
		]], 6}
	)

	feature(test, "mutating",
		{[[
			local x = 5
			x += 5
			return x
		]], 10},

		{[[
			local x = 5
			x -= 5
			return x
		]], 0},

		{[[
			local x = 5
			x *= 5
			return x
		]], 25},

		{[[
			local x = 5
			x /= 5
			return x
		]], 1},

		{[[
			local x = 5
			x ^= 2
			return x
		]], 25}
	)
end

return Test