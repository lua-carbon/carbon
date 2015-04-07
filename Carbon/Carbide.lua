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

local function matchexpr(source, start, backwards)
	local direction = backwards and -1 or 1

	-- parens, bracket, curly brace
	local plevel, blevel, clevel = 0, 0, 0
	local target_beginning = start
	local space_ok = true

	for i = start, (backwards and 1 or #source), direction do
		local char = source:sub(i, i)

		if (char:match("%s")) then
			if (space_ok) then
				target_beginning = target_beginning + direction
			elseif (plevel == 0 and blevel == 0 and clevel == 0) then
				local die = false

				-- Crawl around to see if the next character would be illegal
				for j = i, (backwards and 1 or #source), direction do
					local char = source:sub(j, j)
					if (char:match(backwards and "[%w%)%}%];]" or "[%w;]")) then
						die = true
						break
					elseif (char:match("%S")) then
						break
					end
				end
				
				if (die) then
					break
				end
			end
		else
			target_beginning = target_beginning + direction
			space_ok = not char:match("[%w_]")

			if (char == "[") then
				blevel = blevel + direction
			elseif (char == "]") then
				blevel = blevel - direction
			elseif (char == "(") then
				plevel = plevel + direction
			elseif (char == ")") then
				plevel = plevel - direction
			elseif (char == "{") then
				clevel = clevel + direction
			elseif (char == "}") then
				clevel = clevel - direction
			end
		end
	end

	return target_beginning
end

local function operator_double(source, operator)
	local double_operator = "%" .. operator .. "%" .. operator
	local start, finish = 0, 0
	while (true) do
		start, finish = source:find(double_operator, finish + 1)

		if (not start) then
			break
		end

		local target_beginning = matchexpr(source, start - 1, true)
		local target = source:sub(target_beginning, start - 1):gsub("^%s+", ""):gsub("%s+$", "")

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
		start, finish = source:find(operator .. "=", finish + 1)
		
		if (not start) then
			break
		end

		local target_beginning = matchexpr(source, start - 1, true)
		local target = source:sub(target_beginning, start - 1):gsub("^%s+", ""):gsub("%s+$", "")

		local value_ending = matchexpr(source, finish + 1)
		local value = source:sub(finish + 1, value_ending):gsub("^%s+", ""):gsub("%s+$", "")

		source = ("%s\n%s = %s + (%s)\n%s"):format(
			source:sub(1, target_beginning - 1),
			target, target,
			value,
			source:sub(value_ending + 1)
		)
	end

	return source
end

local function operator_dan(source)
	-- Implement direct arrow operator
	-- Transforms vec3->x to vec3[1], see 'direct_arrow_indices' table above
	return (source:gsub("(([^-])%->([%w_]+))", function(whole, prec, key)
		local index = direct_arrow_indices[key]

		if (not index) then
			error("Cannot compile Carbide Lua: invalid array lookup '" .. key .. "'", 2)
		end

		return ("%s[%d]"):format(prec, index)
	end))
end

local function operator_bang(source)
	return (source:gsub("([%.:%->]+)(%w+)!", function(convention, method)
		return ("%s%sInPlace"):format(
			convention, method
		)
	end))
end

--[[#method {
	class public @string Carbide.ParseTemplated(@string source)
		required source: The source to parse for templates.

	Parses the source file for templates if it contains a `#TEMPLATES_ENABLED` directive.

	The document can change the templating level using `#TEMPLATE_LEVEL <level>`.
}]]
function Carbide.ParseTemplated(source)
	if (source:find("#TEMPLATES_ENABLED")) then
		local level = tonumber(source:match("#TEMPLATE_LEVEL%s+(%d+)"))
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
	class public @string Carbide.ParseCore(@string source)
		required source: The source to parse.

	Parses the given source for Carbide expressions.

	The source can change the feature level with `#CARBIDE_FEATURE_LEVEL <level>`, which defaults to `2`.
}]]
function Carbide.ParseCore(source)
	local feature_level = tonumber(source:match("#CARBIDE_FEATURE_LEVEL (%d+)")) or 2
	local extensions = {}

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

	return source
end

--[[#method 1 {
	class public @function Carbide.Compile(@string source, [@string chunkname, @table environment])
		required source: The Carbide source.
		optional chunkname: The name of the chunk for Lua errors.
		optional environment: The environment to compile the chunk with.

	Parses and compiles the given Carbide source. A drop-in replacement for Carbon.LoadString.
}]]
function Carbide.Compile(source, name, environment)
	source, err = Carbide.ParseTemplated(source)

	if (not source) then
		error(err)
	end

	source = Carbide.ParseCore(source)

	return Carbon.LoadString(source, name, environment)
end

Carbon.Metadata:RegisterMethods(Carbide, self)

return Carbide