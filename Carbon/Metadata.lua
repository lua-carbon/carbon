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

function Metadata:Get(...)
	return Graphene.Metadata:Get(...)
end

function Metadata:Set(...)
	return Graphene.Metadata:Set(...)
end

function Metadata:Enable()
	Graphene.Metadata.Enabled = true
end

function Metadata:Disable()
	Graphene.Metadata.Enabled = false
end

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