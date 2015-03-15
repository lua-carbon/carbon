--[[
	Carbon for Lua
	#class Collections.Set

	#description {
		Provides operations for operating on unordered sets.
	}

	#alias List Collections.List
]]

local Carbon, self = ...
local List = Carbon.Collections.List

local Set = {}

Set.__object_metatable = {
	__index = Set
}

Set.Is = {
	[Set] = true
}

--[[#method {
	Set Set:New(table data)
		data: The data of the dictionary.

	Turns the given object into a Set.
	Allows method-style syntax.
}]]
function Set:New(object)
	return setmetatable(object or {}, self.__object_metatable)
end

function Set:Serialize()
	return nil, Carbon.Exceptions.NotImplementedException("Set:Serialize")
end

function Set.DeserializeInPlace(source)
	return self.Deserialize(source, self)
end

function Set.Deserialize(source, out)
	return nil, Carbon.Exceptions.NotImplementedException("Set:Deserialize")
end

--[[#method {
	@List Set.ToList(table self, [table out])
		self: The set to collect members for.
		out: Where to put the resulting data.

	Collects all members of the set and puts them in a list.
}]]
function Set.ToList(self, out)
	out = out or List:New({})

	for key, value in pairs(self) do
		if (value) then
			table.insert(out, value)
		end
	end

	return out
end

Carbon.Metadata:RegisterMethods(Set, self)

return Set