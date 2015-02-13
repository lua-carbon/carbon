-- Make sure Carbon is in our path
-- Only these examples need to do this
if (not __CARBON_IN_PATH) then
	__CARBON_IN_PATH = true
	package.path = package.path .. ";../?/init.lua"
end

--[[
	Carbon: Advanced OOP: Attributes

	There's more to Carbon's OOP than just inheritance and instantiating.
	Classes have the notion of "attributes", which are values determining extra internal behavior with the class.

	The current included attributes are:
	- SparseInstances: Save data by not storing class data in instances unless it changes.
	- InstanceIndirection: Wraps class instances in a userdata access layer. Allows for the __gc metamethod on Lua 5.1 and LuaJIT.
	- InstancedMetatable: Whether a new metatable should be given to each object or whether the same one should be kept class-wide.
	- PooledInstantiation: Whether instances should come from a pool filled with collected objects.
		- PoolSize: The maximum size of the instance pool, defaults to 20
]]

local Carbon = require("Carbon")

-- Sparse instanced class
local Sparse = Carbon.OOP:Class()
	:Attributes {
		SparseInstances = true
	}
	:Members {
		Hello = {}
	}

-- Instance two of these classes and check their member "Hello"
local a = Sparse:New()
local b = Sparse:New()

-- This is true: welcome to sparse instances
print("a.Hello == b.Hello?", a.Hello == b.Hello)


-- Instance indirection class
-- You don't need this if you're on Lua 5.2+, since this is primarily for __gc.
local Indirected = Carbon.OOP:Class()
	:Attributes {
		InstanceIndirection = true
	}
	:Metatable {
		__gc = function(self)
			print("Indirected instance collected!")
		end
	}

-- We create a scope to force more consistent garbage collection
do
	local instance = Indirected:New()
end

-- instance goes out of scope and can be collected, so we force it
collectgarbage()
-- We then receive a printed message saying that the instance was indeed collected.


-- InstancedMetatable attribute class
-- Normally, every instance of a class shares a common metatable.
-- InstancedMetatable lets you change that
local FreshMeta = Carbon.OOP:Class()
	:Attributes {
		InstancedMetatable = true
	}

-- Create a pair of instances
local a = FreshMeta:New()
local b = FreshMeta:New()

-- Set a value in the first class
getmetatable(a).have = "meat"

-- This is nil, thanks to InstancedMetatable.
-- Without InstancedMetatable, this would be "meat"
print("b has this value for metatable.have:", getmetatable(b).have)


-- Pooled instantiation
-- Use the PooledInstantiation attribute to save on allocations. This can help remediate GC slowdowns.
-- Objects must be explicitly destroyed to be added to the pool unless in Lua 5.2+ or using InstancedIndirection.
-- This might be good for objects with potentially short lifetimes, like math objects.
-- Use the PoolSize attribute to tweak the maximum size of the instance pool. Make this a power of 2 for optimal results.
local Pooled = Carbon.OOP:Class()
	:Attributes {
		PooledInstantiation = true,
		PoolSize = 4,
		InstanceIndirection = true
	}

do
	-- Fill up the instance pool and some.
	for i = 1, 10 do
		-- We add an attribute that will stick with the instance.
		-- This way, we'll know whether a new instance is from the pool or not.
		local p = Pooled:New()
		p.WAS_POOLED = true
	end

	-- No instances have been destroyed up to this point, hopefully.
	-- Destroy all of them by collecting garbage.
	collectgarbage()

	-- Create instances
	-- The first 4 should report that they were pooled, while the 5th will report that it was not pooled.
	for i = 1, 5 do
		local p = Pooled:New()
		print("Instance " .. i .. " was pooled?", p.WAS_POOLED)
	end
end