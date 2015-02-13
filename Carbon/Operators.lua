--[[
	Carbon for Lua
	Operators

	Copyright (c) 2014 Lucien Greathouse (LPGhatguy)

	This software is provided 'as-is', without any express or implied warranty.
	In no event will the authors be held liable for any damages arising from the
	use of this software.

	Permission is granted to anyone to use this software for any purpose, including
	commercial applications, and to alter it and redistribute it freely, subject to
	the following restrictions:

	1. The origin of this software must not be misrepresented; you must not claim
	that you wrote the original software. If you use this software in a product, an
	acknowledgment in the product documentation would be appreciated but is not required.

	2. Altered source versions must be plainly marked as such, and must not be misrepresented
	as being the original software.

	3. This notice may not be removed or altered from any source distribution.
]]

local Carbon = (...)
local Operators = {}

local lua52 = not not table.unpack

function Operators.Add(...)
	local result = 0

	for i = 1, select("#", ...) do
		result = result + select(i, ...)
	end

	return result
end

function Operators.Subtract(...)
	local result = select(1, ...)

	for i = 2, select("#", ...) do
		result = result - select(i, ...)
	end

	return result
end

function Operators.Multiply(...)
	local result = 1

	for i = 1, select("#", ...) do
		result = result * select(i, ...)
	end

	return result
end

function Operators.Divide(...)
	local result = select(1, ...)

	for i = 2, select("#", ...) do
		result = result / select(i, ...)
	end

	return result
end

function Operators.Power(...)
	local result = select(1, ...)

	for i = 2, select("#", ...) do
		result = result ^ select(i, ...)
	end

	return result
end

function Operators.Concat(...)
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

return Operators