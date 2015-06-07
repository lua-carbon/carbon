--[[
	Carbon for Lua
	#class Serialization

	#description {
		Provides serialization facilities for Carbon. Relies on @Metadata being enabled.
	}

	#alias Format Serialization.Format
]]

local Carbon = (...)

local Serialization = {}

--[[#method {
	class public @string Serialization.Serialize(@any object, @Format format, [@dictionary? map])
		required object: The object to serialize.
		required format: The @Format to serialize the object into.
		internal map: An internal map used for fixing intrareferences.

	Serializes an object into the specified data format.
}]]
function Serialization.Serialize(object, format, map)
	map = map or {}
end

--[[#method {
	class public @any Serialization.Deserialize(@string source, [@Format format])
		required source: The serialized data in the form of a string.
		optional format: The format to use; autodetected if not specified.

	Deserializes a serialized object.
}]]
function Serialization.Deserialize(source, format)
	-- autodetect format if not specified
end

return Serialization