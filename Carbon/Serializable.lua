--[[
	Carbon for Lua
	Serializable
]]

local Carbon, self = ...
local OOP = Carbon.OOP

local Serializable = OOP:Class()
	:Attributes {
		Abstract = true
	}

function Serializable:Serialize()
	return nil, Carbon.Exceptions.NotImplementedException("Serialize")
end

function Serializable:DeserializeInPlace(source)
	return self:Deserialize(source, self)
end

function Serializable:Deserialize(source, out)
	return nil, Carbon.Exceptions.NotImplementedException("Deserialize")
end

Carbon.Metadata:RegisterMethods(Serializable, self)

return Serializable