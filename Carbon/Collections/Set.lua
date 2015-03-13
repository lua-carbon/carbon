--[[
	Carbon for Lua
	Set Utilities
]]

local Carbon, self = ...
local Set = {}

Set.__object_metatable = {
	__index = Set
}

--[[
	Set Set:New(table data)
		data: The data of the dictionary.

	Turns the given object into a Set.
	Allows method-style syntax.
]]
function Set:New(object)
	return setmetatable(object or {}, self.__object_metatable)
end

--[[
	List Set.ToList(table self, [table out])
		self: The set to collect members for.
		out: Where to put the resulting data.

	Collects all members of the set and puts them in a list.
]]
function Set.ToList(self, out)
	out = out or Carbon.List:New({})

	for key, value in pairs(self) do
		if (value) then
			table.insert(out, value)
		end
	end

	return out
end

Carbon.Metadata:RegisterMethods(Set, self)

return Set