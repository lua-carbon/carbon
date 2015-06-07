--[[
	Carbon for Lua
	#class Serializable
	#inherits OOP.Object

	#description {
		**Deprecated in Carbon 1.2.0**: this class will be removed in Carbon 2.0.

		**Abstract**

		Provides an interface to serialize and deserialize data.

		All methods provided by this class that are not overridden throw a @NotImplementedException.
	}
]]

local Carbon, self = ...
local OOP = Carbon.OOP

local Serializable = OOP:Class()
	:Attributes {
		Abstract = true
	}

--[[#method {
	object public string Serializable:Serialize()

	Serializes the object into a string representation.
}]]
function Serializable:Serialize()
	return nil, Carbon.Exceptions.NotImplementedException("Serialize")
end

--[[#method {
	class public @Serializable out Serializable.Deserialize(@string source, @Serializable out)
		required source: A string containing a serialized representation of an instance of this class.
		optional out: Where to place the resulting data.

	Deserializes the given source string and places it into the given @Serializable `out` object, if given, or a new instance of the class.
}]]
function Serializable:Deserialize(source, out)
	return nil, Carbon.Exceptions.NotImplementedException("Deserialize")
end

--[[#method {
	object public self Serializable:Deserialize!(@string source)
	alias: object public self Serializable:DeserializeInPlace(@string source)
		required source: A string containing a serialized representation of an instance of this class.

	Deserializes a previously serialized instance of this class.
	Places the data into the class this method is called on.

	Can be called with self:Deserialize!(source) in Carbide Lua.
}]]
function Serializable:DeserializeInPlace(source)
	return self.class:Deserialize(source, self)
end

Carbon.Metadata:RegisterMethods(Serializable, self)

return Carbon.Deprecated(Serializable)