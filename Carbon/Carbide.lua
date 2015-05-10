--[[
	Carbon for Lua
	#class Carbide

	#description {
		Implements a set of Lua language extensions known as Carbide.

		This file is related to the Carbide programmatic API, for details on using Carbide, see [Using Carbide](Using_Carbide).
	}
]]

local Carbon, self = ...
local TemplateEngine = Carbon.TemplateEngine

local loadstring = loadstring or load

--[[#property public @TemplateEngine Engine {
	The @TemplateEngine Carbide will use.
}]]
local Carbide = {
	Engine = TemplateEngine:New()
}

local direct_arrow_indices = {
	x = 1, y = 2, z = 3, w = 4,
	r = 1, g = 2, b = 3, a = 4,
	u = 1, v = 2,
	s = 1, t = 2, p = 3, q = 4
}

--[[
	lineno

	Returns the line and column a given index is at in a string.
]]
local function lineno(source, pos)
	local line = 1
	local column = 1

	for i = 1, pos do
		local char = source:sub(i, i)

		if (char:match("\n")) then
			line = line + 1
			column = 1
		else
			column = column + 1
		end

		if (i == pos) then
			return line, column
		end
	end

	return false
end

--[[
	linecount

	Returns the number of lines in a string.
]]
local function linecount(source)
	return select(2, source:gsub("\n", ""))
end

--[[
	matchexpr

	The powerhouse of the Carbide parser!
	Used when we want to match a whole expression, but no more.
]]
local function matchexpr(source, start, backwards, last_nspace)
	local forwards = not backwards
	local direction = backwards and -1 or 1
	local target = (backwards and 1 or #source)

	local elevel = 0 -- Current stack state of parens/brackets/braces

	for i = start, target, direction do
		local char = source:sub(i, i)

		if (not char:match("%s")) then
			last_nspace = char
		end

		local elevelc = false
		if (char:match("[%[%(%{]")) then
			elevelc = true

			if (forwards) then
				elevel = elevel + 1
			else
				elevel = elevel - 1
			end
		elseif (char:match("[%]%)%}]")) then
			elevelc = true

			if (forwards) then
				elevel = elevel - 1
			else
				elevel = elevel + 1
			end
		elseif (char:match(";")) then
			-- Explicit expression termination!

			if (elevel == 0) then
				return i - direction
			else
				-- FIXME: This line is not necessarily accurate if the source is transformed.
				local line = lineno(source, i)
				return false, "Cannot have semicolon (';') when elevel ~= 0!"
			end
		elseif (elevel == 0 and char:match(",")) then
			return i - direction
		elseif (char:match("%s")) then
			-- Can we have a space right now?

			if (last_nspace) then
				-- Crawl to see if the next few characters are legal
				local illegal_set = "=;"

				if (last_nspace:match("[%w_]")) then
					illegal_set = illegal_set .. "%w_\26\27"
				end

				if (elevel == 0) then
					if (forwards) then
						illegal_set = illegal_set .. "%{"
					else
						illegal_set = illegal_set .. "%}"
					end
				end

				local illegal
				if (illegal_set:len() > 0) then
					illegal = "[" .. illegal_set .. "]"
				end

				local prospective = i
				for j = i, target, direction do
					local jchar = source:sub(j, j)

					if (jchar:match("%s")) then
						prospective = j
					else
						if (illegal and jchar:match(illegal)) then
							return i
						else
							i = prospective
							break
						end
					end
				end
			end
		end

		if (elevelc) then
			if (elevel == 0) then
			elseif (elevel > 0) then

			else
				return i - direction
			end
		end
	end

	return target
end

local function operator_double(source, operator)
	local double_operator = operator .. operator
	local start, finish = 0, 0
	while (true) do
		start, finish = source:find(double_operator, finish + 1, true)

		if (not start) then
			break
		end

		local target_beginning = matchexpr(source, start - 1, true, operator)
		local target = source:sub(target_beginning, start - 1)

		source = ("%s\n%s = (%s) %s 1\n%s"):format(
			source:sub(1, target_beginning - 1),
			target, target,
			operator,
			source:sub(finish + 1)
		)
	end

	return source
end

local function operator_mutating(source, operator)
	local start, finish = 0, 0
	while (true) do
		start, finish = source:find(operator .. "=", finish + 1, true)
		
		if (not start) then
			break
		end

		local target_beginning = matchexpr(source, start - 1, true, operator)
		local target = source:sub(target_beginning, start - 1)

		local value_ending = matchexpr(source, finish + 1)
		local value = source:sub(finish + 1, value_ending)

		source = ("%s\n%s = %s %s (%s)\n%s"):format(
			source:sub(1, target_beginning - 1),
			target, target,
			operator,
			value,
			source:sub(value_ending + 1)
		)
	end

	return source
end

local function operator_dan(source)
	local start, finish = 0, 0
	while (true) do
		local prec, keys
		start, finish, keys = source:find("%->([%w_]+)", finish + 1)

		if (not start) then
			break
		end

		local target_beginning = matchexpr(source, start - 1, true, "-")
		local target = source:sub(target_beginning, start - 1)

		local mod_ending = matchexpr(source, finish + 1, false, "a")
		local mod = source:sub(finish + 1, mod_ending)

		local lookups = {}
		for i = 1, #keys do
			local key = keys:sub(i, i)
			local index = direct_arrow_indices[key]

			if (not index) then
				error("Cannot compile Carbide Lua: invalid array lookup '" .. key .. "' in '" .. keys .. "'", 2)
			end

			table.insert(lookups, ("%s[%d]%s"):format(target, index, mod))
		end

		source = ("%s%s%s"):format(
			source:sub(1, target_beginning - 1),
			table.concat(lookups, ", "),
			source:sub(mod_ending + 1)
		)
	end

	return source
end

local function operator_bang(source)
	return (source:gsub("([%.:%->]+)(%w+)!", function(convention, method)
		return ("%s%sInPlace"):format(
			convention, method
		)
	end))
end

local function strip_strings(source, str_tab)
	str_tab = str_tab or {}

	local function predicate(whole)
		table.insert(str_tab, whole)

		return "\26" .. #str_tab .. "\27"
	end

	source = source
		:gsub("(%-%-%[(=*)%[.-%]%2%])", "")
		:gsub("%-%-[^\r\n]+\r?\n?", "")
		:gsub("%b\"\"", predicate)
		:gsub("%b''", predicate)
		:gsub("(%[(=*)%[.-%]%2%])", predicate)

	return source, str_tab
end

local function replace_strings(source, str_tab)
	return (source:gsub("\26(%d-)\27", function(number)
		return str_tab[tonumber(number)]
	end))
end

--[[#method {
	class public @string Carbide.ParseTemplated(@string source, [@table settings])
		required source: The source to parse for templates.
		optional settings: Settings (source directives) to use when parsing the templates.

	Parses the source file for templates if it contains a `#TEMPLATES_ENABLED` directive.

	The document can change the templating level using `#TEMPLATE_LEVEL <level>`.
}]]
function Carbide.ParseTemplated(source, settings)
	settings = settings or {}

	if (settings.TEMPLATES_ENABLED or source:find("#TEMPLATES_ENABLED")) then
		local level = settings.TEMPLATE_LEVEL or tonumber(source:match("#TEMPLATE_LEVEL%s+(%d+)")) or 0
		local result, err, template = Carbide.Engine:Render(source, {Carbon = Carbon, __engine = Carbide.Engine}, level)
		
		if (not result) then
			return false, err
		end

		return result
	else
		return source
	end
end

--[[#method {
	class public @string Carbide.ParseCore(@string source, [@table settings])
		required source: The source to parse.
		optional settings: Settings (source directives) to pass to the parser

	Parses the given source for Carbide expressions.

	The source can change the feature level with `#CARBIDE_FEATURE_LEVEL <level>`, which defaults to `2`.
}]]
function Carbide.ParseCore(source, settings)
	settings = settings or {}

	local feature_level
	if (settings.CARBIDE_FEATURE_LEVEL) then
		feature_level = settings.CARBIDE_FEATURE_LEVEL
	else
		feature_level = tonumber(source:match("#CARBIDE_FEATURE_LEVEL (%d+)")) or 2
	end

	local extensions
	if (settings.EXTENSIONS) then
		extensions = settings.EXTENSIONS
	else
		extensions = {}
	end

	local report_out
	if (settings.COMPILE_TO) then
		report_out = settings.COMPILE_TO
	else
		local out = source:match("#COMPILE_TO ([^\r\n]+)")
		report_out = out
	end

	source, str_tab = strip_strings(source)

	if (feature_level >= 1) then
		source = operator_bang(source)
		source = operator_dan(source)

		source = operator_double(source, "+")

		source = operator_mutating(source, "+")
		source = operator_mutating(source, "-")
		source = operator_mutating(source, "*")
		source = operator_mutating(source, "/")
		source = operator_mutating(source, "^")
	end

	source = replace_strings(source, str_tab)

	if (report_out) then
		if (report_out == "stdout") then
			print(source)
		else
			print(report_out)
			local handle, err = io.open(report_out, "wb")
			if (not handle) then
				error(("Couldn't write compiled output to %q: %s"):format(tostring(report_out), err))
			end

			handle:write(source)
			handle:close()
		end
	end

	return source
end

--[[#method 1 {
	class public @function Carbide.Compile(@string source, [@string chunkname, @table environment, @table settings])
		required source: The Carbide source.
		optional chunkname: The name of the chunk for Lua errors.
		optional environment: The environment to compile the chunk with.
		optional settings: The settings to compile Carbide with.

	Parses and compiles the given Carbide source. A drop-in replacement for Carbon.LoadString.
}]]
function Carbide.Compile(source, name, environment, settings)
	source, err = Carbide.ParseTemplated(source, settings)

	if (not source) then
		error(err)
	end

	source = Carbide.ParseCore(source, settings)

	local chunk, err = Carbon.LoadString(source, name, environment)

	if (Carbon.Debug and not chunk) then
		print(source)
	end

	return chunk, err
end

Carbon.Metadata:RegisterMethods(Carbide, self)

return Carbide