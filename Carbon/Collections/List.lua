--[[
	Carbon for Lua
	#class Collections.List
	#inherits OOP.Object, Serializable
	
	#description {
		Provides utilities for operating on Lists and List-like data.

		The @List type Differs from the primtive @list type by adding methods to it.
		It is possible to use these methods with a plain @list, just call them in a non-object oriented way:
		```lua
		List.Clear(list)
		List.ShallowCopy(list)
		```
	}
]]

local Carbon, self = ...
local List = {}

List.__object_metatable = {
	__index = List
}

List.Is = {
	[List] = true
}

--[[#method 1 {
	class public @List List:New([@list data])
		optional data: The data of the list. Empty if not given.

	Turns the given object into a @List.
	Allows method-style syntax.
}]]
function List:New(object)
	return setmetatable(object or {}, self.__object_metatable)
end

function List:Serialize()
	return nil, Carbon.Exceptions.NotImplementedException("List:Serialize")
end

function List.DeserializeInPlace(source)
	return self.Deserialize(source, self)
end

function List.Deserialize(source, out)
	return nil, Carbon.Exceptions.NotImplementedException("List:Deserialize")
end

--[[#method {
	class public self List.Clear(@List self)
	-alias: object public self List:Clear()
		required self: The list to source data from

	Clears a list of all list values.
}]]
function List.Clear(self)
	for i = 1, #self do
		self[i] = nil
	end

	return self
end

--[[#method {
	class public @list List.ShallowCopy(@list self, [@list to])
		required self: The list to source data from
		optional to: The list to copy into; an empty table if not given.

	Shallow copies data from one table into another and returns the result.
}]]
function List.ShallowCopy(self, to)
	to = to or List:New({})

	for key, value in ipairs(self) do
		table.insert(to, value)
	end

	return to
end

List.Copy = List.ShallowCopy

--[[#method {
	class public @List List.DeepCopy(@list self, [@list to, @dictionary map, function copy_function, ...])
		required self: The list to source data from.
		optional to: The list to copy into; an empty table if not given.
		internal map: A map projecting original values into copied values. Used internally.
		optional copy_function: The function to copy members with: defaults to this method.

	Performs a self-reference fixing deep copy from one list into another.
	Handles self-references properly.
}]]
function List.DeepCopy(self, to, map, copy_function, ...)
	to = to or List:New({})
	copy_function = copy_function or List.DeepCopy
	map = map or {
		[self] = to
	}

	for key, value in ipairs(self) do
		if (type(value) == "table") then
			if (not map[value]) then
				map[value] = {}
				to[key] = copy_function(value, map[value], map, ...)
			end

			to[key] = map[value]
		else
			to[key] = value
		end
	end

	return to
end

Carbon.Metadata:RegisterMethods(List, self)

return List