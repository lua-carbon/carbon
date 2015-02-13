--[[
	Carbon for Lua
	Dictionary

	Copyright (c) 2014 Lucien Greathouse (LPGhatguy)

	This software is provided 'as-is', without any express or implied warranty.
	In no event will the authors be held liable for any damages arising from the
	use of this software.

	Permission is granted to anyone to use this software for any purpose, including
	commercial applications, and to alter it and redistribute it freely, subject to
	the following restrictions:

	1. The origin of this software must not be misrepresented; you must not claim
	that you wrote the original software. If you use this software in a product, an
	acknowledgment in the product documentation would be appreciated but is not required.

	2. Altered source versions must be plainly marked as such, and must not be misrepresented
	as being the original software.

	3. This notice may not be removed or altered from any source distribution.
]]

local Carbon = (...)
local Dictionary = {}

--[[
	table Dictionary.ShallowCopy(table from, [table to])
		from: The table to source data from
		to: The table to copy into; an empty table if not given.

	Shallow copies data from one table into another and returns the result.
]]
function Dictionary.ShallowCopy(from, to)
	to = to or {}

	for key, value in pairs(from) do
		to[key] = value
	end

	return to
end

--[[
	table Dictionary.DeepCopy(table from, [table to, table map])
		from: The table to source data from.
		to: The table to copy into; an empty table if not given.
		map: A map projecting original values into copied values. Used internally.

	Performs a self-reference fixing deep copy from one table into another.
	Handles self-references properly.
]]
function Dictionary.DeepCopy(from, to, map)
	to = to or {}
	map = map or {
		[from] = to
	}

	for key, value in pairs(from) do
		if (type(value) == "table") then
			if (not map[value]) then
				map[value] = {}
				Dictionary.DeepCopy(value, map[value], map)
			end

			to[key] = map[value]
		else
			to[key] = value
		end
	end

	return to
end

--[[
	table Dictionary.DeepCopyExceptTypes(table from, table? to, set except, [table map])
		from: The table to source data from.
		to: The table to copy into; an empty table if nil.
		except: A set (dictionary) of type names to ignore.
		map: A map projecting original values into copied values. Used internally.

	Performs a self-reference fixing deep copy from one table into another.
	Handles self-references properly.
]]
function Dictionary.DeepCopyExceptTypes(from, to, except, map)
	to = to or {}
	map = map or {
		[from] = to
	}

	for key, value in pairs(from) do
		if (not except[type(value)]) then
			if (type(value) == "table") then
				if (not map[value]) then
					map[value] = {}
					Dictionary.DeepCopy(value, map[value], except, map)
				end

				to[key] = map[value]
			else
				to[key] = value
			end
		end
	end

	return to
end

--[[
	table Dictionary.ShallowMerge(table from, table to)
		from: The table to source data from.
		to: The table to output into.

	Performs a merge into a table without overwriting existing keys.
]]
function Dictionary.ShallowMerge(from, to)
	for key, value in pairs(from) do
		if (to[key] == nil) then
			to[key] = value
		end
	end

	return to
end

--[[
	table Dictionary.DeepCopyMerge(table from, table to)
		from: The table to source data from.
		to: The table to put data into.

	Performs a merge into the table, performing a deep copy on all table members.
]]
function Dictionary.DeepCopyMerge(from, to)
	for key, value in pairs(from) do
		if (to[key] == nil) then
			if (type(value) == "table") then
				to[key] = Dictionary.DeepCopy(value)
			else
				to[key] = value
			end
		end
	end

	return to
end

return Dictionary