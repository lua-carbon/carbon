--[[
	Carbon for Lua
	Tuple

	A disposable List object for quick vararg transformations.
]]

local Carbon = (...)
local OOP = Carbon.OOP

local unpack = unpack or table.unpack

local Tuple = OOP:Class()
	:Attributes {
		PooledInstantiation = true,
		PoolSize = 16,
		ExplicitInitialization = true
	}

function Tuple:_init(...)
	self.Unpack = self.class.Unpack
	self.Destroy = self.class.Destroy
	for i = 1, select("#", ...) do
		self[i] = select(i, ...)
	end
end

function Tuple:Unpack()
	return self:Destroy(unpack(self))
end

function Tuple:Destroy(...)
	for i = 1, #self do
		self[i] = nil
	end

	return ...
end

return Tuple