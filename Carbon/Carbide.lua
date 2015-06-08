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
local SyntaxErrorException = Carbon.Exceptions.SyntaxErrorException

Carbon.Logging:ImportAll()

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
				return false, SyntaxErrorException(
					"Cannot have semicolon (';') when elevel ~= 0!",
					lineno(source, i)
				)
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

					if (backwards) then
						illegal_set = illegal_set .. "%)%}%]"
					end
				elseif (forwards) then
					if (last_nspace:match("[%)%}%]\27]")) then
						illegal_set = illegal_set .. "%w"
					end
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
							return i - direction
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

		source = ("%s%s = (%s) %s 1%s"):format(
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
		start, finish = source:find("%s*%" .. operator .. "%=%s*", finish + 1)
		
		if (not start) then
			break
		end

		local target_beginning = matchexpr(source, start - 1, true, operator)
		local target = source:sub(target_beginning, start - 1)

		local value_ending = matchexpr(source, finish + 1)
		local value = source:sub(finish + 1, value_ending)

		source = ("%s%s = %s %s (%s)%s"):format(
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
				return false, SyntaxErrorException(
					"Cannot compile Carbide Lua: invalid array lookup '" .. key .. "' in '" .. keys .. "'",
					lineno(source, target_beginning)
				)
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

local function operator_lambda(source)
	local start, finish = 0, 0
	while (true) do
		local prec, keys
		start, finish, name, args = source:find("([%w%.:]*)%s*(%b())%s*=>%s*", finish + 1)

		if (not start) then
			break
		end

		local body_ending = matchexpr(source, finish + 1, false, " ")
		local body = source:sub(finish + 1, body_ending)

		source = ("%sfunction %s%s return %s end%s"):format(
			source:sub(1, start - 1),
			name, args,
			body,
			source:sub(body_ending + 1)
		)
	end

	return source
end

local function operator_defaultargs(source)
	local start, finish = 0, 0
	while (true) do
		local prec, keys
		start, finish, name, args = source:find("function ([%w%.:]*)%s*(%b())", finish + 1)

		if (not start) then
			break
		end

		local args_buffer = {}
		local defs_buffer = {}
		local state = 0
		local aname_building = ""
		local adef_building = ""
		local depth = 0

		for i = 2, args:len() do
			local char = args:sub(i, i)

			if (state == 0) then -- match name
				if (char:match("[%w%._]")) then
					aname_building = aname_building .. char
				elseif (char == ",") then
					table.insert(args_buffer, aname_building)
					aname_building = ""
				elseif (char == "=") then
					state = 1
				end
			elseif (state == 1) then -- match default definition
				if (char:match("[,%)]") and depth == 0) then
					table.insert(args_buffer, aname_building)
					table.insert(defs_buffer, {aname_building, adef_building})
					aname_building = ""
					adef_building = ""
					state = 0
				else
					adef_building = adef_building .. char
				end

				if (char:match("[%[%(%{]")) then
					depth = depth + 1
				elseif (char:match("[%]%)%}]")) then
					depth = depth - 1
				end
			end
		end

		if (state == 0 and aname_building ~= "") then
			table.insert(args_buffer, aname_building)
		end

		local defo_buffer = {}
		for key, def in ipairs(defs_buffer) do
			local name, value = def[1], def[2]
			table.insert(defo_buffer, ("%s = (%s ~= nil) and %s or %s"):format(
				name, name, name, value
			))
		end

		local body_ending = matchexpr(source, finish + 1, false, " ")
		local body = source:sub(finish + 1, body_ending)

		source = ("%sfunction %s(%s)\n%s%s"):format(
			source:sub(1, start - 1),
			name,
			table.concat(args_buffer, ","),
			table.concat(defo_buffer, "\n"),
			source:sub(finish + 1)
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

Carbide.FeaturesByLevel = {
	[1] = {
		operator_lambda,
		operator_defaultargs,
		operator_bang,
		operator_dan,
		function(source)
			return operator_double(source, "+")
		end,
		function(source)
			return operator_mutating(source, "+")
		end,
		function(source)
			return operator_mutating(source, "-")
		end,
		function(source)
			return operator_mutating(source, "*")
		end,
		function(source)
			return operator_mutating(source, "/")
		end,
		function(source)
			return operator_mutating(source, "^")
		end,
		function(source)
			return operator_mutating(source, "..")
		end
	}
}

Carbide.Extensions = {
	Annotations = function(source)
		WarnOnce("Annotations have been enabled but are not implemented!")
		return source
	end
}

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
	if (settings.CARBIDE_EXTENSIONS) then
		extensions = settings.CARBIDE_EXTENSIONS
	else
		extensions = {}

		for nameset in source:gmatch("#CARBIDE_EXTENSIONS ([^\r\n]+)") do
			for name in nameset:gmatch("[^%s,]+") do
				table.insert(extensions, name)
			end
		end
	end

	local report_out
	if (settings.COMPILE_TO) then
		report_out = settings.COMPILE_TO
	else
		local out = source:match("#COMPILE_TO ([^\r\n]+)")
		report_out = out
	end

	local str_tab
	source, str_tab = strip_strings(source)

	local err
	for level, set in ipairs(Carbide.FeaturesByLevel) do
		if (feature_level >= level) then
			for key, operator in ipairs(set) do
				source, err = operator(source)

				if (not source) then
					return nil, err
				end
			end
		end
	end

	for key, name in ipairs(extensions) do
		local extension = Carbide.Extensions[name]

		if (extension) then
			source, err = extension(source)

			if (not source) then
				return nil, err
			end
		else
			WarnOnce(("Unknown extension '%s'!"):format(name))
		end
	end

	source = replace_strings(source, str_tab)

	if (report_out) then
		if (report_out == "stdout") then
			print(source)
		else
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
	class public @function Carbide.Parse(@string source, [@table settings])
		required source: The Carbide source.
		optional settings: The settings to compile Carbide with.

	Parses the given Carbide source.
}]]
function Carbide.Parse(source, settings)
	source, err = Carbide.ParseTemplated(source, settings)

	if (not source) then
		return false, SyntaxErrorException(err)
	end

	return Carbide.ParseCore(source, settings)
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
	local source, err = Carbide.Parse(source, settings)

	if (not source) then
		return false, err
	end

	local chunk, err = Carbon.LoadString(source, name, environment)

	if (not chunk) then
		return false, SyntaxErrorException(err)
	end

	return chunk
end

Carbon.Metadata:RegisterMethods(Carbide, self)

return Carbide