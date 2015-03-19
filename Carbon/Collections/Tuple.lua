--[[
	Carbon for Lua
	#class Collections.Tuple
	#inherits OOP.Object

	#description {
		A disposable List object for quick vararg transformations.
	}
]]

local Carbon = (...)
local OOP = Carbon.OOP

local unpack = unpack or table.unpack

local Tuple = OOP:Class()
	:Attributes {
		PooledInstantiation = true,
		PoolSize = 16,
		ExplicitInitialization = true,
		SparseInstances = true
	}

--[[#method 1 {
	public @Tuple Tuple:New(...)
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
	public ... Tuple:Unpack()

	Unpacks and destroys the Tuple, returning all its values.
}]]
function Tuple:Unpack()
	return self:Destroy(unpack(self))
end

--[[#method {
	public ... Tuple:Destroy(...)
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

return Tuple