--[[
	Carbon for Lua
	#class Serialization

	#description {
		Provides serialization facilities for Carbon. Relies on @Metadata being enabled.
	}

	#alias Format Serialization.Format
	#alias NotImplementedException Exceptions.NotImplementedException
]]

local Carbon = (...)
local NotImplementedException = Carbon.Exceptions.NotImplementedException

local Serialization = {}

--[[#method {
	class public @string Serialization.Serialize(@any object, @Format format)
		required object: The object to serialize.
		required format: The @Format to serialize the object into.

	Serializes an object into the specified data format.
}]]
function Serialization.Serialize(object, format)
	return format:Serialize(object)
end

--[[#method {
	class public @any Serialization.Deserialize(@string source, [@Format format])
		required source: The serialized data in the form of a string.
		optional format: The format to use; autodetected if not specified.

	Deserializes a serialized object.

	If no deserializer for the format could be found, returns (false, @NotImplementedException)
}]]
function Serialization.Deserialize(source, format)
	local maybes = {}

	for key, format in pairs(Serialization.Formats) do
		if (format.Is and format.Is[Serialization.Format]) then
			local can = format:CanDeserialize(source)

			if (can == true) then
				return format:Deserialize(source)
			elseif (can == Carbon.Maybe) then
				table.insert(maybes, format)
			end
		end
	end

	for key, format in ipairs(maybes) do
		local result = format:Deserialize(source)

		if (result) then
			return result
		end
	end
	
	return false, NotImplementedException("serializer for this format")
end

return Serialization