--[[
	Carbon for Lua
	#class Collections.Tuple
	#inherits OOP.Object

	#description {
		A disposable List object for quick vararg transformations.
	}
]]

local Carbon, self = ...
local OOP = Carbon.OOP

local vunpack = unpack
local unpack
if (Carbon.Support.jit and jit.status()) then
	unpack = Carbon.Unpack
else
	unpack = vunpack or table.unpack
end

local Tuple = OOP:Class()
	:Attributes {
		PooledInstantiation = true,
		PoolSize = 16,
		ExplicitInitialization = true,
		SparseInstances = true
	}

--[[#method 1 {
	class public @Tuple Tuple:New(...)
	-alias: object public @void Tuple:Init(...)
		optional ...: The values to initialize the Tuple with.

	Creates a new Tuple.
}]]
function Tuple:Init(...)
	self.Unpack = self.class.Unpack
	self.Destroy = self.class.Destroy
	
	for i = 1, select("#", ...) do
		self[i] = select(i, ...)
	end
end

--[[#method {
	object public ... Tuple:Unpack()

	Unpacks and destroys the Tuple, returning all its values.
}]]
function Tuple:Unpack()
	return self:Destroy(unpack(self))
end

--[[#method {
	object public ... Tuple:Destroy(...)
		optional ...: Data to pipe through this method.

	Destroys the tuple, passing any arguments that it was given as return values.
	This will put the tuple back into the main buffer, usually.
}]]
function Tuple:Destroy(...)
	for i = 1, #self do
		self[i] = nil
	end

	return ...
end

Carbon.Metadata:RegisterMethods(Tuple, self)

return Tuple