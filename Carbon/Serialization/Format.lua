--[[
	Carbon for Lua
	#class Serialization.Format
	#inherits OOP.Object

	#description {
		**Static**

		A class describing a way to serialize data.
	}
]]

local Carbon = (...)
local OOP = Carbon.OOP
local NotImplementedException = Carbon.Exceptions.NotImplementedException

local Format = OOP:StaticClass()

function Format:Serialize(object)
	return false, NotImplementedException("Serialize")
end

function Format:Deserialize(source)
	return false, NotImplementedException("Deserialize")
end

function Format:CanDeserialize(source)
	return false, NotImplementedException("CanDeserialize")
end

return Format