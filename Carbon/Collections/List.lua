--[[
	Carbon for Lua
	List Utilities
]]

local Carbon = (...)
local List = {}

--[[
	void List.Clear(List list)
		list: The list to clear.

	Clears a list of all list values.
]]
function List.Clear(list)
	for key, value in ipairs(list) do
		list[key] = nil
	end
end

--[[
	table List.ShallowCopy(List from, [List to])
		from: The list to source data from
		to: The list to copy into; an empty table if not given.

	Shallow copies data from one table into another and returns the result.
]]
function List.ShallowCopy(from, to)
	to = to or {}

	for key, value in ipairs(from) do
		table.insert(to, value)
	end

	return to
end

return List