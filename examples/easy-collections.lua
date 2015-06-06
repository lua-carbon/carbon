-- Make sure Carbon is in our path
-- Only these examples need to do this
if (not __CARBON_IN_PATH) then
	__CARBON_IN_PATH = true
	package.path = package.path .. ";../?/init.lua"
end

--[[
	Carbon: Simple Utilities

	This file demonstrates how to use the included utilities.
	They're split up into two modules: Dictionary and List.
	Lua doesn't have a dedicated dictionary, but they operate differently, so they have been separated.
]]

local Carbon = require("Carbon")

--[[
	Dictionary:

	Operates on tables with non-sequential or non-numeric keys.
	Also known as hash maps, or more generally associative arrays.

	Lua doesn't have a dedicated dictionary type, but you can use a table like a dictionary.
]]

local Dictionary = Carbon.Collections.Dictionary

print("\nDictionary:")

-- Create a small test dictionary
local my_dict = {
	member = {},
	hello = "world",
	foo = "bar"
}

-- This would cause an issue with some libraries, but not Carbon!
my_dict.self = my_dict

-- Shallow copies don't follow references!
local shallow = Dictionary.ShallowCopy(my_dict)

-- True!
print("shallow.member same?", my_dict.member == shallow.member)

-- A deep copy does follow references.
-- This implementation handles intrareferences intelligently
-- Check Carbon/Dictionary.lua for more details on it.
local deep = Dictionary.DeepCopy(my_dict)

-- False!
print("deep.member same?", my_dict.member == deep.member)

-- We can also perform deep and shallow copies into other tables.
local copied = {
	hello = "mom"
}

-- This is "mom", as you'd expect.
print("copied.hello before copy:", copied.hello)

-- Copy my_dict over the top of copied
Dictionary.DeepCopy(my_dict, copied)

-- This is "world", from my_dict. Existing keys are overwritten.
print("copied.hello after copy:", copied.hello)

-- We can merge instead to prevent key overwrites.
local merged = {
	foo = "zam"
}

-- This is "zam", as we defined.
print("merged.foo before merge:", merged.foo)

-- Merge my_dict into merged without overwriting existing entries.
Dictionary.ShallowMerge(my_dict, merged)

-- This is still "zam", since the merge noticed the key already existed.
print("merged.foo after merge:", merged.foo)


--[[
	List:

	Operates on tables with sequential numeric keys.
	These are also called vectors, dynamic arrays, or sequences in the Lua manual.

	Lua doesn't have a dedicated list type, but you can use a table like one.
]]

local List = Carbon.Collections.List

print("\nList:")

-- Create a simple list
local my_list = {1, 2, 3}

-- This will give us what you expect: 1  2  3
print("my_list:", unpack(my_list))

-- We can copy lists just like dictionaries
-- Note that this is *not* the same as Dictionary.ShallowCopy!
local copy = List.ShallowCopy(my_list)

-- We'll get, as hoped: 1  2  3
print("copy:", unpack(copy))

-- Copying into other tables is where List.ShallowCopy changes:
local copy_into = {"a", "b", "c"}

-- Copy my_list into copy_into
List.ShallowCopy(my_list, copy_into)

-- Result is:  a  b  c  1  2  3
-- The difference here is that List.ShallowCopy appends when copying, which a dictionary cannot do.
print("copy_into:", unpack(copy_into))

-- We can also empty a list entirely:
local clear_me = {1, 2, 3}

-- Result:  1  2  3
print("clear_me before clear:", unpack(clear_me))

-- Empty the list
List.Clear(clear_me)

-- Empty result (no values in clear_me)
print("clear_me after clear:", unpack(clear_me))