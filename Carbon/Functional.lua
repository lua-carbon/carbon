--[[
	Carbon for Lua
	#class Functional

	#description {
		Provides an interface for functional programming.

		*This module may be slated for significant changes in the future.*
	}
]]

local Carbon = (...)
local Operators = Carbon.Operators

local Functional = {}

--[[#method {
	class public @tuple Functional.Unpack(@table object)
		required object: The table to unpack.

	Unpacks the table into a tuple. The same as `unpack` and `table.unpack`.

	**DEPRECATED** in 1.1: Use Carbon.Unpack (added in 1.0.1)
}]]
Functional.Unpack = Carbon.Deprecated(unpack or table.unpack, "Functional.Unpack")

--[[#method {
	class public @bool Functional.AllTuple(...)
		required ...: The values to check for truthiness.

	Returns whether all the values in the tuple are truthy.
}]]
function Functional.AllTuple(...)
	for i = 1, select("#", ...) do
		if (not select(i, ...)) then
			return false
		end
	end

	return true
end

--[[#method {
	class public @bool Functional.All(@table objects)
		required objects: The values to check for truthiness.

	Returns whether all the values in the table are truthy.
}]]
function Functional.All(t)
	for key, value in ipairs(t) do
		if (not value) then
			return false
		end
	end

	return true
end

--[[#method {
	class public @bool Functional.AnyTuple(...)
		required ...: The values to check for truthiness.

	Returns whether any one of the values in the tuple is truthy.
}]]
function Functional.AnyTuple(...)
	for i = 1, select("#", ...) do
		if (select(i, ...)) then
			return true
		end
	end

	return false
end

--[[#method {
	class public @bool Functional.Any(@table objects)
		required objects: The values to check for truthiness.

	Returns whether any one of the values in the table is truthy.
}]]
function Functional.Any(t)
	for key, value in ipairs(t) do
		if (value) then
			return true
		end
	end

	return false
end

--[[#method {
	class public @userdata Functional.ViewReverse(@list list)
		required list: The list to create a view for.

	Creates a view that returns all values of the list reversed.
}]]
function Functional.ViewReverse(list)
	local view = newproxy(true)

	getmetatable(view).__index = function(self, key)
		return list[#self - key + 1]
	end

	getmetatable(view).__newindex = function(self, key, value)
		list[#self - key + 1] = value
	end

	return view
end

--[[#method {
	class public @list Functional.Range(number a, number b)
		required a: The number to start at.
		required b: The number to end at.

	Creates a range in the form of a @list.
}]]
function Functional.Range(a, b)
	local out = {}

	for i = a, b, Operators.Sign(b - a) do
		table.insert(out, i)
	end

	return out
end

--[[#method {
	class public T Functional.Reduce(@function T method(T total, T current), @list list)
		required method: The method to use for reduction. Accepts the total and the current value, returns the new total.
		required list: The list of values to reduce over.

	Performs a reduction over the list with the given function.
}]]
function Functional.Reduce(method, list)
	local total = list[1]

	for i = 2, #list do
		total = method(total, list[i])
	end

	return total
end

--[[#method {
	class public @list Functional.Map(@function @any method(@any value), @list list)
		required method: The method to use for mapping. Takes in a value and returns a transformed version of it.
		required list: The list of values to map over.

	Uses a function to perform a mapping of values.

	This method (erroneously) modified the list before 1.1.
}]]
function Functional.Map(method, list)
	local out = {}

	for key, value in ipairs(list) do
		out[key] = method(value)
	end

	return out
end

--[[#method {
	class public @list Functional.Filter(@function @bool method(@any value), @list list)
		required method: The method to use for filtering. Takes in a valid and returns whether it should stay.
		required list: The list of values to filter over.

	Uses a function to filter a list of values.
}]]
function Functional.Filter(method, list)
	local out = {}

	for key, value in ipairs(list) do
		if (method[value]) then
			table.insert(out, value)
		end
	end

	return out
end

return Functional