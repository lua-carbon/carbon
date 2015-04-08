--[[
	Carbon for Lua
	#class Metadata

	#description {
		Provides an interface to the Graphene Metadata API in a more friendly way.
		Metadata is normally handled at the Graphene level because it allows modules to register themselves automatically.
	}
]]

local Carbon = (...)
local Graphene = Carbon:GetGraphene()

local Metadata = {}

--[[#method 1 {
	class public @any? Metadata:Get(@any object, [@any field])
		required object: The object to look up metadata for.
		optional field: A field, if specified, to query the object for.

	Requests metadata about the given object.

	If the field argument is given, that key is returned from the object if the object exists.
}]]
function Metadata:Get(object, field)
	return Graphene.Metadata:Get(object, field)
end

--[[#method 1 {
	class public @void Metadata:Set(@any object, [@any metadata])
		required object: The object to set metadata for.
		optional metadata: The metadata to set for the object, specify nil to remove the object's metadata.

	Associates the given object with a piece of metadata.
}]]
function Metadata:Set(object, metadata)
	Graphene.Metadata:Set(object, metadata)
end

--[[#method {
	class public @void Metadata:Enable()

	Enables metadata storage.
}]]
function Metadata:Enable()
	Graphene.Metadata.Enabled = true
end

--[[#method {
	class public @void Metadata:Disable()

	Disables metadata storage.
}]]
function Metadata:Disable()
	Graphene.Metadata.Enabled = false
end

--[[#method {
	class public @void Metadata:RegisterMethods(@table object, @table metadata)
		required object: An object that contains methods to register.
		required metadata: The metadata object associated with this object.

	Automatically registers all the methods of a given object with the registry.
}]]
function Metadata:RegisterMethods(object, metadata)
	for key, value in pairs(object) do
		if (type(value) == "function") then
			Graphene.Metadata:Set(value, {
				Name = metadata.Path .. "." .. key
			})
		end
	end
end

return Metadata