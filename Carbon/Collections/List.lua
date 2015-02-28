--[[
	Carbon for Lua
	List Utilities
]]

local Carbon, self = ...
local List = {}

List.__object_metatable = {
	__index = List
}

--[[
	List List:New(table data)
		data: The data of the dictionary

	Turns the given object into a List.
	Allows method-style syntax.
]]
function List:New(object)
	return setmetatable(object or {}, self.__object_metatable)
end

--[[
	void List.Clear(List self)
		self: The list to clear.

	Clears a list of all list values.
]]
function List.Clear(self)
	for i = 1, #self do
		self[i] = nil
	end
end

--[[
	table List.ShallowCopy(List self, [List to])
		self: The list to source data from
		to: The list to copy into; an empty table if not given.

	Shallow copies data from one table into another and returns the result.
]]
function List.ShallowCopy(self, to)
	to = to or List:New({})

	for key, value in ipairs(self) do
		table.insert(to, value)
	end

	return to
end

Carbon.Metadata:RegisterMethods(List, self)

return List