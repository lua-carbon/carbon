--[[
	Callisto
	#class Callisto.Compiler

	#description {
		The pure compiler API for Callisto.
	}
]]

local Callisto = (...)
local Support = Callisto:GetGraphene().Support

local loadsource
if (Support.lua51) then
	function loadsource(source, from, environment)
		environment = environment or getfenv()
		local chunk, err = loadstring(source, from)

		if (not chunk) then
			return chunk, err
		end

		if (environment) then
			setfenv(chunk, environment)
		end

		return chunk
	end
elseif (Support.lua52) then
	function loadsource(source, from, environment)
		return load(source, from, nil, environment)
	end
end

local Compiler = {}

local cnal_indices = {
	x = 1, y = 2, z = 3, w = 4,
	r = 1, g = 2, b = 3, a = 4,
}

local cnal_indices_legacy = {
	x = 1, y = 2, z = 3, w = 4,
	r = 1, g = 2, b = 3, a = 4,
	u = 1, v = 2,
	s = 1, t = 2, p = 3, q = 4
}

--[[
	matchexpr

	The powerhouse of the Callisto parser!
	Used when we want to match a whole expression, but no more.
]]
local function matchexpr(source, start, backwards, last_nspace)
	local forwards = not backwards
	local direction = backwards and -1 or 1
	local target = (backwards and 1 or #source)

	local elevel = 0 -- Current depth of parens/brackets/braces

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
			if (elevel < 0) then
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

local function operator_cnal(source, settings)
	local clookups
	if (settings.Legacy) then
		clookups = cnal_indices_legacy
	else
		clookups = cnal_indices
	end

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
			local index = clookups[key]

			if (not index) then
				return false, ("Invalid array lookup %q in %q!"):format(key, keys)
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
					adef_building = adef_building:match("^%s*(.-)%s*$")

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

		source = ("%sfunction %s(%s)%s%s"):format(
			source:sub(1, start - 1),
			name,
			table.concat(args_buffer, ","),
			table.concat(defo_buffer, "\n"),
			source:sub(finish + 1)
		)
	end

	return source
end

local function operator_bang(source, settings)
	return (source:gsub("([%w_!]*![%w_!]*)", function(banged)
		if (settings.Legacy) then
			return (banged:gsub("!", "InPlace"))
		else
			return (banged:gsub("!", "BANG"))
		end
	end))
end

local function operator_que(source, settings)
	return (source:gsub("([%w_%?]*%?[%w_%?]*)", function(banged)
		return (banged:gsub("%?", "QUE"))
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

Compiler.Features = {
	operator_lambda,
	operator_defaultargs,
	operator_bang,
	operator_que,
	operator_cnal,
	function(source, settings)
		if (settings.Legacy) then
			return operator_double(source, "+")
		else
			return source
		end
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

Compiler.Extensions = {
	Annotations = function(source)
		WarnOnce("Annotations have been enabled but are not implemented!")
		return source
	end
}

--[[#method {
	class public @string Compiler.Transform(@string source, [@table settings])
		required source: The source to transform.
		optional settings: Settings (source directives) to pass to the transpiler.

	Transforms the given source from Callisto to Lua.
}]]
function Compiler.Transform(source, settings)
	settings = settings or {}

	local legacy
	if (Compiler.Legacy or settings.Legacy) then
		legacy = true
	else
		legacy = not not (source:match("#CallistoLegacy") or source:match("#CARBIDE_LEGACY"))
	end

	settings.Legacy = legacy

	local extensions
	if (settings.CallistoExtensions) then
		extensions = settings.CallistoExtensions
	else
		extensions = {}

		if (legacy) then
			for nameset in source:gmatch("#CARBIDE_EXTENSIONS ([^\r\n]+)") do
				for name in nameset:gmatch("[^%s,]+") do
					table.insert(extensions, name)
				end
			end
		end

		for nameset in source:gmatch("#CallistoExtensions ([^\r\n]+)") do
			for name in nameset:gmatch("[^%s,]+") do
				table.insert(extensions, name)
			end
		end
	end

	local report_out
	if (legacy) then
		if (settings.COMPILE_TO) then
			report_out = settings.COMPILE_TO
		else
			local out = source:match("#COMPILE_TO ([^\r\n]+)")

			if (out) then
				report_out = out
			end
		end
	end

	if (settings.CompileTo) then
		report_out = settings.CompileTo
	else
		local out = source:match("#CompileTo ([^\r\n]+)")

		if (out) then
			report_out = out
		end
	end

	local str_tab
	source, str_tab = strip_strings(source)

	local err
	for key, operator in ipairs(Compiler.Features) do
		source, err = operator(source, settings)

		if (not source) then
			return nil, err
		end
	end

	for key, name in ipairs(extensions) do
		local extension = Compiler.Extensions[name]

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

	return source, {}
end

--[[#method  {
	class public @function Compiler.LoadString(@string source, [@table sourcemap, @string chunkname, @table environment])
		required source: The source to load into a chunk.
		optional sourcemap: A Callisto sourcemap mapping lines.
		optional chunkname: A name to give the resulting chunk.
		optional environment: The Lua environment to load the chunk into.

	Loads a compiled chunk in a way compatible with any Lua 5.1+
}]]
function Compiler.LoadString(source, sourcemap, chunkname, environment)
	return loadsource(source, chunkname, environment)
end

return Compiler