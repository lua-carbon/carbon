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
		local dead = false
		local case = select(i, ...)
		local snippet, result_check

		if (type(case) == "string") then
			snippet = case
		elseif (type(case) == "table") then
			snippet, result_check = case[1], case[2]
		else
			error("Invalid feature definition!")
		end

		local source, err = Carbide.ParseCore(snippet, compilation_settings)
		local compiled, err = Carbon.LoadString(source, "snippet #" .. i)

		if (not compiled) then
			test:Fail(("Feature %s failed to compile on snippet #%d"):format(name, i))
			test:Message("Input code:\n" .. snippet)
			test:Message("Result code:\n" .. source)

			dead = true
		end

		local success, result = pcall(compiled, Carbon)

		if (compiled and not success) then
			test:Fail(("Feature %s threw error in snippet #%d"):format(name, i))
			test:Message("Input code:\n" .. snippet)
			test:Message("Result code:\n" .. source)
			test:Message("Error:\n" .. result)

			dead = true
		end

		if (success and result ~= result_check) then
			test:Fail(("Feature %s gave a wrong result in snippet #%d: got %s, expected %s"):format(name, i, result, result_check))
			test:Message("Input code:\n" .. snippet)
			test:Message("Result code:\n" .. source)

			dead = true
		end

		if (not dead) then
			test:Pass()
		end
	end
end

function Test:Run(test)
	local compilation_settings = {
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

	feature(test, "dan",
		{[[
			local vec = {5}
			return vec->x
		]], 5},

		{[[
			local vec = {5}
			return vec->x + vec->r + vec->u + vec->s
		]], 20},

		{[[
			local vec = {5, 10, 15}
			local x, y, z = vec->xyz
			return x + y + z
		]], 30},

		{[[
			local vec = {5, 10, 15}
			local x, y, z = vec->xyz + 5
			return x + y + z
		]], 45},

		{[[
			local vec = {5, 10, 15}
			local vecn = {vec->xyz + 5}
			local x, y, z = vecn->xyz
			return x + y + z
		]], 45},

		{[[
			local vec = {5, 10, 15}
			local vecn = { vec->xyz + 5 }
			local x, y, z = vecn->xyz
			return x + y + z
		]], 45},

		{[[
			local vec = {5, 10}
			setmetatable(vec, {
				__mul = function(self, other)
					return {self[1] * other, self[2] * other}
				end
			})

			local x, y = (vec * 2)->xy
			return x + y
		]], 30}
	)

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