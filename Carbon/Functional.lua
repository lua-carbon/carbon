--[[
	Carbon for Lua
	OOP-Style Functional Programming Procedures
]]

local Carbon = (...)
local Operators = Carbon.Operators

identity = {
	[Operators.Multiply] = 1,
	[Operators.Divide] = 1,
	[Operators.Power] = 1
}

local Functional = {}

Functional.Unpack = unpack or table.unpack

function Functional.AllTuple(...)
	for i = 1, select("#", ...) do
		if (not select(i, ...)) then
			return false
		end
	end

	return true
end

function Functional.All(t)
	for key, value in ipairs(t) do
		if (not value) then
			return false
		end
	end

	return true
end

function Functional.AnyTuple(...)
	for i = 1, select("#", ...) do
		if (select(i, ...)) then
			return true
		end
	end

	return false
end

function Functional.Any(t)
	for key, value in ipairs(t) do
		if (value) then
			return true
		end
	end

	return false
end

-- Creates a "view", does not reverse list
function Functional.Reverse(list)
	local view = newproxy(true)

	getmetatable(view).__index = function(self, key)
		return list[#self - key + 1]
	end

	getmetatable(view).__newindex = function(self, key, value)
		list[#self - key + 1] = value
	end

	return view
end

function Functional.Range(a, b)
	local out = {}

	for i = a, b, Operators.Sign(b - a) do
		table.insert(out, i)
	end

	return out
end

function Functional.Reduce(method, list)
	local total = list[1]

	for i = 2, #list do
		total = method(total, list[i])
	end

	return total
end

function Functional.Map(method, list)
	for key, value in ipairs(list) do
		list[key] = method(value)
	end

	return list
end

function Functional.Filter(method, list)
	local out = {}

	for key, value in ipairs(list) do
		if (method[value]) then
			table.insert(out, value)
		end
	end

	return out
end

function Functional.Compose(methods)
	return function(...)
		for key, value in ipairs(methods) do
			value(...)
		end
	end
end

return Functional