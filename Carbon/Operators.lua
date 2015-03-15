--[[
	Carbon for Lua
	#class Operators

	#description {
		Provides functional forms of operators.
	}
]]

local Carbon, self = ...
local Operators = {}

local Graphene = Carbon:GetGraphene()
local lua52 = Graphene.Support.lua52

function Operators.Add(a, b)
	return a + b
end

function Operators.AddN(...)
	local result = 0

	for i = 1, select("#", ...) do
		result = result + select(i, ...)
	end

	return result
end

function Operators.Subtract(a, b)
	return a - b
end

function Operators.SubtractN(...)
	local result = select(1, ...)

	for i = 2, select("#", ...) do
		result = result - select(i, ...)
	end

	return result
end

function Operators.Multiply(a, b)
	return a * b
end

function Operators.MultiplyN(...)
	local result = 1

	for i = 1, select("#", ...) do
		result = result * select(i, ...)
	end

	return result
end

function Operators.Divide(a, b)
	return a / b
end

function Operators.DivideN(...)
	local result = select(1, ...)

	for i = 2, select("#", ...) do
		result = result / select(i, ...)
	end

	return result
end

function Operators.Power(a, b)
	return a ^ b
end

function Operators.PowerN(...)
	local result = select(1, ...)

	for i = 2, select("#", ...) do
		result = result ^ select(i, ...)
	end

	return result
end

function Operators.Concat(a, b)
	return tostring(a) .. tostring(b)
end

function Operators.ConcatN(...)
	local result = tostring(select(1, ...))

	for i = 2, select("#", ...) do
		result = result .. tostring(select(i, ...))
	end

	return result
end

Operators.Sign = function(n)
	return (n > 0) and 1 or (n < 0) and -1 or 0
end

if (lua52) then
	function Operators.Equal(a, b)
		return a == b
	end

	function Operators.NotEqual(a, b)
		return a ~= b
	end

	function Operators.LessThan(a, b)
		return a < b
	end

	function Operators.GreaterThan(a, b)
		return a > b
	end

	function Operators.LessThanEqualTo(a, b)
		return a <= b
	end

	function Operators.GreaterThanEqualTo(a, b)
		return a >= b
	end
else
	function Operators.NotEqual(a, b)
		return not Operators.Equal(a, b)
	end

	function Operators.Equal(a, b)
		local ma, mb = getmetatable(a), getmetatable(b)
		local op = (ma and ma.__eq) or (mb and mb.__eq)

		if (op) then
			return (a == b) or op(a, b)
		else
			return (a == b)
		end
	end

	function Operators.LessThan(a, b)
		local ma, mb = getmetatable(a), getmetatable(b)
		local op = (ma and ma.__lt) or (mb and mb.__lt)

		if (op) then
			return op(a, b)
		else
			return (a < b)
		end
	end

	function Operators.GreaterThan(a, b)
		local ma, mb = getmetatable(a), getmetatable(b)
		local op = (ma and ma.__le) or (mb and mb.__le)

		if (op) then
			return not op(a, b)
		else
			return (a > b)
		end
	end

	function Operators.LessThanEqualTo(a, b)
		local ma, mb = getmetatable(a), getmetatable(b)
		local op = (ma and ma.__le) or (mb and mb.__le)

		if (op) then
			return op(a, b)
		else
			return (a <= b)
		end
	end

	function Operators.GreaterThanEqualTo(a, b)
		local ma, mb = getmetatable(a), getmetatable(b)
		local op = (ma and ma.__lt) or (mb and mb.__lt)

		if (op) then
			return not op(a, b)
		else
			return (a > b)
		end
	end
end

Carbon.Metadata:RegisterMethods(Operators, self)

return Operators