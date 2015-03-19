-- Make sure Carbon is in our path
-- Only these examples need to do this
if (not __CARBON_IN_PATH) then
	__CARBON_IN_PATH = true
	package.path = package.path .. ";../?/init.lua"
end

--[[
	Carbon: Pointers

	Carbon includes a few types of pointers for various purposes.
	They let you pass any object by reference.

	ForwardPointer: Provides a full layer of indirection over an object.
		Allows operators to execute on Lua 5.1 between mismatched types.
		This is the base type of pointer and provides no special features.

	LookupPointer: Provides data binding by looking up a property in another object.
		This is the pointer that should drive any data binding or functional-reactive programming implementations.

	WeakPointer: Provides a single weak reference to an object that won't affect garbage collection.
		Otherwise functionally the same as a ForwardPointer.
]]

local Carbon = require("Carbon")

-- We use this for numeric comparisons; this is a shortcoming of ForwardPointers on Lua 5.1 and LuaJIT.
local Operators = Carbon.Operators

print("\nForwardPointer example")
-- Wrap a primitive
local ptr_five = Carbon.ForwardPointer:New(5)

-- We can do simple arithmetic easily!
print(ptr_five) --> 5
print(ptr_five + 5) --> 10

-- Comparisons require a utility method, sadly.
print("5 = 5?", Operators.Equal(ptr_five, 5))
print("5 > 3?", Operators.GreaterThan(ptr_five, 3))

-- We can change the value of the pointer, as well, which is useful for primitives:
ptr_five:Set("five")

-- Now "five" instead of the number 5
print(ptr_five)

-- We can also wrap classes!
-- Let's create a simple Vector2 class:
local Vector2
Vector2 = Carbon.OOP:Class()
	:Metatable {
		-- We don't handle cases except two vector2 objects
		__add = function(self, other)
			return Vector2:New(self[1] + other[1], self[2] + other[2])
		end,

		__tostring = function(self)
			return ("(%g, %g)"):format(self[1], self[2])
		end
	}
	:Members {
		0, 0
	}

function Vector2:Init(x, y)
	self[1] = x or 0
	self[2] = y or 0
end

-- Create a test instance and a forward pointer to that instance
local vec = Vector2:New(1, 1)
local ptr_vec = Carbon.ForwardPointer:New(vec)

-- Both of these result in (1, 1)
print(vec)
print(ptr_vec)

vec[1] = 5
vec[2] = 6

-- Both of these result in (5, 6)
print(vec)
print(ptr_vec)


print("\nLookupPointer example")
-- Lookup Pointer examples
-- We'll use these to bind to a simple "Person" class
local Person = Carbon.OOP:Class()
	:Members {
		Name = "Unknown"
	}

function Person:Init(name)
	self.Name = name or "Unknown"
end

-- Create an instance and a LookupPointer to access that instance's name
-- We specify a parent object and a "path" of indexes to follow to obtain the value we want
local Bob = Person:New("Bob")
local ptr_BobName = Carbon.LookupPointer:New(Bob, {"Name"})

-- Both of these yield "Bob"
print(Bob.Name)
print(ptr_BobName)

-- Let's change Bob's Name
Bob.Name = "Bobby"

-- We get "Bobby" with both of these, as expected.
print(Bob.Name)
print(ptr_BobName)

-- Let's try it with a Vector2
local vec = Vector2:New(1, 2)
local ptr_vecx = Carbon.LookupPointer:New(vec, {1})

-- Both of these are 1
print(vec[1])
print(ptr_vecx)


print("\nWeakPointer example")

-- Create an upvalue for our pointer
local weak_ptr
do
	local object = {
		Name = "Weak Sauce"
	}

	weak_ptr = Carbon.WeakPointer:New(object)

	-- We now have a pointer that won't affect GC of object.
	-- It is otherwise functionally the same as a ForwardPointer.
	-- Both of these tell us how weak our sauce is.
	print(object.Name)
	print(weak_ptr.Name)

	-- Is our pointer valid at this point? (it is)
	print("Weak pointer valid inside scope?", weak_ptr:Available())
end

collectgarbage()

-- Accessing any properties of weak_ptr would now cause an error
-- because the original object is now gone.
-- Instead, we can ask the pointer whether it's still valid (it isn't)
print("Weak pointer valid outside scope?", weak_ptr:Available())