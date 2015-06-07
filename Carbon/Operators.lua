--[[
	Carbon for Lua
	#class Operators

	#description {
		Provides functional forms of operators. Useful for having a common base.

		**DEPRECATED** in 1.1: Use fat-arrow lambdas or your own functions instead.
	}
]]

local Carbon, self = ...
local Operators = {}

local Graphene = Carbon:GetGraphene()
local lua52 = Graphene.Support.lua52

--[[#method 2 {
	class public Operators.Add(@any a, @any b)
		required a: The first value to add.
		required b: The second value to add.

	Adds two objects together. `a + b`
}]]
function Operators.Add(a, b)
	return a + b
end

--[[#method 2 {
	class public Operators.AddN(...)
		required ...: Values to add.

	Adds any number of objects together. `a + b + c + d + ...`
}]]
function Operators.AddN(...)
	local result = 0

	for i = 1, select("#", ...) do
		result = result + select(i, ...)
	end

	return result
end

--[[#method 2.01 {
	class public Operators.Subtract(@any a, @any b)
		required a: The value to subtract from.
		required b: The value to subtract.

	Subtracts an object from another. `a - b`
}]]
function Operators.Subtract(a, b)
	return a - b
end

--[[#method 2.01 {
	class public Operators.SubtractN(...)
		required ...: The values to use in a subtraction expression.

	Subtracts a series of objects from eachother. `a - b - c - d - ...`
}]]
function Operators.SubtractN(...)
	local result = select(1, ...)

	for i = 2, select("#", ...) do
		result = result - select(i, ...)
	end

	return result
end

--[[#method 2.02 {
	class public Operators.Multiply(@any a, @any b)
		required a: The first value to multiply.
		required b: The second value to multiply.

	Multiplies two objects together. `a * b`
}]]
function Operators.Multiply(a, b)
	return a * b
end

--[[#method 2.02 {
	class public Operators.MultiplyN(...)
		required ...: The values to multiply together.

	Multiples a series of objects together. `a * b * c * d * ...`
}]]
function Operators.MultiplyN(...)
	local result = 1

	for i = 1, select("#", ...) do
		result = result * select(i, ...)
	end

	return result
end

--[[#method 2.03 {
	class public Operators.Divide(@any a, @any b)
		required a: The dividend.
		required b: The divisor.

	Performs division between two objects. `a / b`
}]]
function Operators.Divide(a, b)
	return a / b
end

--[[#method 2.03 {
	class public Operators.DivideN(...)
		required ...: A list of objects to use in a chain division.

	Divides a series of objects from the left. `a / b / c / d / ...`
}]]
function Operators.DivideN(...)
	local result = select(1, ...)

	for i = 2, select("#", ...) do
		result = result / select(i, ...)
	end

	return result
end

--[[#method 2.04 {
	class public Operators.Power(@any a, @any b)
		required a: The base.
		required b: The exponent.

	Performs exponentiation with two numbers. `a ^ b`
}]]
function Operators.Power(a, b)
	return a ^ b
end

--[[#method 2.04 {
	class public Operators.PowerN(...)
		required ...: The values to use in a chained exponentiation expression.

	Raises values to powers given by a list in a left-associative way. `((((a ^ b) ^ c) ^ d) ^ ...)`
}]]
function Operators.PowerN(...)
	local result = select(1, ...)

	for i = 2, select("#", ...) do
		result = result ^ select(i, ...)
	end

	return result
end

--[[#method 2.05 {
	class public Operators.Concat(@any a, @any b)
		required a: The first value to concat.
		required b: The second value to concat.

	Performs concatenation with two objects. `a .. b`
}]]
function Operators.Concat(a, b)
	return tostring(a) .. tostring(b)
end

--[[#method 2.05 {
	class public Operators.ConcatN(...)
		required ...: The values to concat.

	Performs concatenation with a list of objects. `a .. b .. c .. d .. ...`
}]]
function Operators.ConcatN(...)
	local result = tostring(select(1, ...))

	for i = 2, select("#", ...) do
		result = result .. tostring(select(i, ...))
	end

	return result
end

--[[#method 1 {
	class public @number Operators.Sign(@number n)
		required n: The number to check the sign of.

	Returns the sign of a number as a signed number.

	Positive numbers result in `1`

	Negative numbers result in `-1`

	Zero results in `0`
}]]
Operators.Sign = function(n)
	return (n > 0) and 1 or (n < 0) and -1 or 0
end

-- Documentation here is only given for the 5.2 equivalents of these methods.

if (lua52) then
	--[[#method 3 {
		class public @bool Operators.Equal(@any a, @any b)
			required a: The first value.
			required b: The second value.

		Returns whether two values are equal. Uses the `__eq` metamethod.
	}]]
	function Operators.Equal(a, b)
		return a == b
	end

	--[[#method 3 {
		class public @bool Operators.NotEqual(@any a, @any b)
			required a: The first value.
			required b: the second value.

		Returns whether two values are not equal. Uses the `__eq` metamethod.
	}]]
	function Operators.NotEqual(a, b)
		return a ~= b
	end

	--[[#method 3 {
		class public @bool Operators.LessThan(@any a, @any b)
			required a: The first value.
			required b: The second value.

		Returns whether a is less than b. Uses the `__lt` metamethod.
	}]]
	function Operators.LessThan(a, b)
		return a < b
	end

	--[[#method 3 {
		class public @bool Operators.GreaterThan(@any a, @any b)
			required a: The first value.
			required b: The second value.

		Returns whether a is greater than b. Uses the `__le` metamethod if available, otherwise uses `__lt` and `__eq`.
	}]]
	function Operators.GreaterThan(a, b)
		return a > b
	end

	--[[#method 3 {
		class public @bool Operators.LessThanEqualTo(@any a, @any b)
			required a: The first value.
			required b: The second value.

		Returns whether a is less than or equal to b. Uses the `__le` metamethod if available, otherwise uses `__lt` and `__eq`.
	}]]
	function Operators.LessThanEqualTo(a, b)
		return a <= b
	end

	--[[#method 3 {
		class public @bool Operators.GreaterThanEqualTo(@any a, @any b)
			required a: The first value.
			required b: The second value.

		Returns whether a is greater than or equal to b. Uses the `__lt` and `__eq` metamethods.
	}]]
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

return Carbon.Deprecated(Operators)