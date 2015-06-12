--[[
	Carbon for Lua
	#class Serialization.Formats.SimpleJSON
	#inherits Serialization.Format

	#description {
		A class describing how to serialize data to simple JSON, with no embedded metadata.
	}
]]

local Carbon = (...)
local OOP = Carbon.OOP
local Format = Carbon.Serialization.Format

local SimpleJSON = OOP:Class()
	:Inherits(Format)
	:Members {
		Config = {
			NaN = "NaN",
			Infinity = "Infinity"
		}
	}

function SimpleJSON:__IsSequence(object)
	local meta = getmetatable(object)
	if (meta and meta.__sequence) then
		return true
	elseif (#object == 0) then
		return false
	end

	for key, value in pairs(object) do
		if (type(key) ~= "number") then
			return false
		end
	end

	local last = 0
	for key in ipairs(object) do
		if (key ~= last + 1) then
			return false
		end

		last = key
	end

	return true
end

function SimpleJSON:__UnescapeString(str)
	return (
		str
			:gsub("\\\"", "\"")
			:gsub("\\r", "\r")
			:gsub("\\n", "\n")
			:gsub("\\t", "\t")
			-- todo: unicode sequences
	)
end

function SimpleJSON:__EscapeString(str)
	return "\"" .. (str
			:gsub("\"", "\\\"")
			:gsub("\r", "\\r")
			:gsub("\n", "\\n")
			:gsub("\t", "\\t")
		) .. "\""
end

function SimpleJSON:__Escape(object, map)
	map = map or {}
	local typeof = type(object)

	if (typeof == "table") then
		return self:Serialize(object, map)
	elseif (typeof == "string") then
		return self:__EscapeString(object)
	elseif (typeof == "boolean") then
		return object and "true" or "false"
	elseif (typeof == "number") then
		if (object == math.huge) then
			return self.Config.Infinity
		elseif (object ~= object) then
			return self.Config.NaN
		end

		return object
	elseif (typeof == "nil") then
		return "null"
	elseif (typeof == "userdata" or typeof == "function") then
		return nil
	else
		return self:__Escape(tostring(object))
	end
end


function SimpleJSON:__ParseRoot(parent)
	local first = parent:match("^%s*[%[{]")

	if (first == "{") then
		return self:__ParseObject(parent)
	elseif (first == "[") then
		return self:__ParseList(parent)
	else
		return nil
	end
end

function SimpleJSON:__ParseObject(parent, index)
	local out = {}
	local object = parent:match("%b{}", index)

	local i = 2
	while (true) do
		local start, finish = object:find("%b\"\":", i)

		if (not start) then
			break
		end

		local realkey = object:sub(start + 1, finish - 2)

		i = finish + 1

		local char
		while (true) do
			char = object:sub(i, i)
			if (char == "," or char:match("%s")) then
				i = i + 1
			else
				break
			end
		end

		if (char == "\"") then
			local value = object:match("%b\"\"", i)
			i = i + #value
			out[realkey] = self:__UnescapeString(value:sub(2, -2))
		elseif (char:match("[%d%.%-]")) then
			local value, len = self:__ParseNumber(object, i)
			i = i + len
			out[realkey] = value
		elseif (char == "[") then
			local value, len = self:__ParseList(object, i)
			i = i + len
			out[realkey] = value
		elseif (char == "{") then
			local value, len = self:__ParseObject(object, i)
			i = i + len
			out[realkey] = value
		else
			local value, len = self:__ParseConstant(object, i)

			if (value) then
				i = i + len
				out[realkey] = value
			end
		end
	end

	return out, #object
end

function SimpleJSON:__ParseList(parent, index)
	local out = setmetatable({}, {__sequence = true})
	local list = parent:match("%b[]", index)

	local i = 2
	while i < #list do
		local char = list:sub(i, i)

		if (not char) then
			break
		end

		if (char == "," or char:match("%s")) then
			i = i + 1
		elseif (char == "\"") then
			local value = list:match("%b\"\"", i)
			i = i + #value
			table.insert(out, unescape_string(value:sub(2, -2)))
		elseif (char:match("[%d%.%-]")) then
			local value, len = self:__ParseNumber(list, i)
			i = i + len
			table.insert(out, value)
		elseif (char == "[") then
			local value, len = self:__ParseList(list, i)
			i = i + len
			table.insert(out, value)
		elseif (char == "{") then
			local value, len = self:__ParseObject(list, i)
			i = i + len
			table.insert(out, value)
		else
			local value, len = self:__ParseConstant(list, i)

			if (value) then
				i = i + len
				table.insert(out, value)
			end
		end
	end

	return out, #list
end

function SimpleJSON:__ParseConstant(parent, index)
	local value = parent:match("^%w+", index)

	if (value == "null") then
		return nil, 4
	elseif (value == "true") then
		return true, 4
	elseif (value == "false") then
		return false, 5
	elseif (value:lower() == "nan") then
		return 0/0, 3
	elseif (value:lower() == "infinity") then
		return math.huge, 8
	end
end

function SimpleJSON:__ParseNumber(parent, index)
	local value = parent:match("^[+%-]?%d+%.?%d*[eE]?[+%-]?%d*", index)

	if (value) then
		return tonumber(value), #value
	end
end

function SimpleJSON:Serialize(object, map)
	map = map or {[object] = true}
	local buffer = {}

	if (self:__IsSequence(object)) then
		for key, value in ipairs(object) do
			if (map[value]) then
			else
				local eval = self:__Escape(value, map)

				if (eval) then
					table.insert(buffer, eval)
				end
			end
		end

		return "[" .. table.concat(buffer, ",") .. "]"
	else
		for key, value in pairs(object) do
			if (map[value]) then
			else
				local eval = self:__Escape(value, map)

				if (eval) then
					table.insert(buffer, self:__Escape(tostring(key)) .. ":" .. eval)
				end
			end
		end

		return "{" .. table.concat(buffer, ",") .. "}"
	end
end

function SimpleJSON:Deserialize(source)
	return (self:__ParseRoot(source))
end

function SimpleJSON:CanDeserialize(source)
	return Carbon.Maybe
end

return SimpleJSON