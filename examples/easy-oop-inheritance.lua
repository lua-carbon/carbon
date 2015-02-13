-- Make sure Carbon is in our path
-- Only these examples need to do this
if (not __CARBON_IN_PATH) then
	__CARBON_IN_PATH = true
	package.path = package.path .. ";../?/init.lua"
end

--[[
	Carbon: Simple OOP

	Carbon's OOP implementation provides multiple inheritance.
	Member values are first-come-first-serve, so the earlier in the chain a value is specified the more likely it is to stick.
]]

local Carbon = require("Carbon")
local OOP = Carbon.OOP

-- Create a generic animal class: this is basically an Interface, in C# terms
local Animal = OOP:Class()

-- A generic animal says "Animal", I swear
function Animal:Speak()
	print("The animal speaks!")
end

-- Create a class for something furry
local Furry = OOP:Class()

function Furry:Pet()
	print("The furry animal is pet.")
end

-- A cat!
local Cat = OOP:Class()
	:Inherits(Animal, Furry)

function Cat:Purr()
	print("The cat purrs.")
end

-- A dog!
local Dog = OOP:Class()
	:Inherits(Animal, Furry)

-- Dogs don't talk!
function Dog:Speak()
	print("The dog barks!")
end

-- Create with animals and mess with them:
local fido = Dog:New()
local mittens = Cat:New()

fido:Speak() --> "The dog barks!"
mittens:Speak() --> "The animal speaks!"

mittens:Pet() --> "The furry animal is pet."

mittens:Purr() --> "The cat purrs."

-- We can do formal type checking on these if we need to:

-- Mittens can speak, but he's still a cat!
if (mittens.Is[Cat]) then
	print("Mittens is a cat!")
else
	print("Mittens is NOT a cat!")
end

-- Fido is not a cat by any means, but he is furry.
if (fido.Is[Cat]) then
	print("Fido is a cat?")
else
	print("Fido is definitely not a cat.")
end

-- All (non-singleton) objects inherit from OOP.Object!
-- Mittens is an object!
if (mittens.Is[OOP.Object]) then
	print("Mittens is an object.")
else
	print("Mittens will not be objectified!")
end