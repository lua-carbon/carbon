-- Make sure Carbon is in our path
-- Only these examples need to do this
if (not __CARBON_IN_PATH) then
	__CARBON_IN_PATH = true
	package.path = package.path .. ";../?/init.lua"
end

--[[
	Carbon: Singleton

	Carbon exposes singleton objects through OOP:StaticClass.
	They are of type OOP.StaticObject and cannot be instantiated or copied directly.
]]

local Carbon = require("Carbon")
local OOP = Carbon.OOP

-- Create a "service" class.
-- We don't create instances of it, but we use what it provides.
-- We do this instead of a plain table solely to get inheritance.
local ServiceA = OOP:StaticClass()

-- Some sort of utility or service method
function ServiceA:Add(a, b)
	return a + b
end

-- Create a string representation of two values
-- We'll override this below in ServiceB
function ServiceA:Report(a, b)
	return ("From A: (%g, %g)"):format(a, b)
end

-- Create a new service inheriting from ServiceA
local ServiceB = OOP:StaticClass()
	:Inherits(ServiceA)

-- Change the Report method slightly
function ServiceB:Report(a, b)
	return ("From B: [%g, %g]!"):format(a, b)
end

-- Using our services:

-- Methods from ServiceA are in both our singletons
print(ServiceA:Add(5, 5)) --> 10
print(ServiceB:Add(5, 5)) --> 10

-- Methods we overrided in ServiceB are changed there:
print(ServiceA:Report(1, 2)) --> From A: (1, 2)
print(ServiceB:Report(1, 2)) --> From B: [1, 2]!

-- Copying a service
-- While we can't directly copy a service, we can inherit from it in a new service
local ServiceB_Copy = OOP:StaticClass()
	:Inherits(ServiceB)

print(ServiceB_Copy:Report(1, 2)) --> From B: [1, 2]!