-- Make sure Carbon is in our path
-- Only these examples need to do this
if (not __CARBON_IN_PATH) then
	__CARBON_IN_PATH = true
	package.path = package.path .. ";../?/init.lua"
end

--[[
	Carbon: Simple Vector2 Class

	This demonstrates how to create a simple Vector2 class in Carbon.
	Also see easy-oop for more OOP concepts
]]

local Carbon = require("Carbon")

-- Create a new class and give it some members
local Vector2 = Carbon.OOP:Class()
	:Members {
		0, 0
	}

-- Initializer for the object
-- Called when we create the object
function Vector2:_init(x, y)
	self[1] = x or 0
	self[2] = y or 0
end

-- Add two vectors!
-- We create a new vector to hold the result.
function Vector2:Add(other)
	return Vector2:New(self[1] + other[1], self[2] + other[2])
end

-- String representation of the object
-- Also the object's __tostring
function Vector2:ToString()
	return ("(%g, %g)"):format(self[1], self[2])
end

-- Assign some metatables to our methods above
Vector2:Metatable {
	__tostring = Vector2.ToString,
	__add = Vector2.Add
}


-- Using the Vector2:

-- Create two different vectors
local one = Vector2:New(1, 1)
local two = Vector2:New(2, 2)

-- Our vectors are turned into strings and displayed
print("one is", one)
print("two is", two)

-- We can also explicitly call a method to turn it into a string
print("one: " .. tostring(one)) -- Lua-style
print("one: " .. one:ToString()) -- Carbon-style

-- This result is exactly as you'd expect: (3, 3)
local three = one + two
print("three is", three)