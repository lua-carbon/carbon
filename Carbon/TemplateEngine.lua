--[[
	Carbon for Lua
	#class TemplateEngine

	#description {
		Templating engine targeted at metaprogramming.
	}
]]

local Carbon = (...)
local OOP = Carbon.OOP
local CodeGenerationException = Carbon.Exceptions.CodeGenerationException

local TemplateEngine = OOP:Class()
	:Members {
		Partials = {}
	}

local lua51 = Carbon:GetGrapheneCore().Support.lua51

local block_pattern = "%-?%-?{{level}%%%s*(.-)%s*%%{level}}" --matches {% block %}
local put_pattern = "^=%s*(.+)" --matches the inner part of {%= output %}

local function shallow_copy(from, to)
	to = to or {}

	for key, value in pairs(from) do
		to[key] = value
	end

	return to
end

local function strip_line_if_just_spaces(line)
	if (line:match("^[\t ]*$")) then
		return ""
	end
end

function TemplateEngine:Init()
	self.DefaultEnvironment = {
		math = math,
		string = string,
		table = table,
		tostring = tostring,
		tonumber = tonumber,
		ipairs = ipairs,
		pairs = pairs,
		unpack = unpack,
		next = next,
		select = select,
		type = type,
		newproxy = newproxy,
		RenderPartial = function(name, data)
			if (self.Partials[name]) then
				return self:Execute(self.Partials[name], data)
			elseif (type(name) == "string") then
				return self:Execute(name, data)
			else
				return ("[could not load partial '%s']"):format(name)
			end
		end
	}
end

--[[
	Takes the contents of a templated document and compiles it to an executable template
]]
function TemplateEngine:Compile(document, level)
	level = level or 0

	--Determine how many equals signs we need to safely embed this document's contents in a string
	local equals_depth = 0
	for signs in document:gmatch("[%[%]](=+)[%[%]]") do
		equals_depth = math.max(equals_depth, #signs)
	end

	local this_block_pattern = block_pattern:gsub("{level}", ("!"):rep(level))
	local equals = ("="):rep(equals_depth + 1) --We'll use this in our embedded strings
	local output_buffer = {}
	local last = 0 --The last character we dealt with

	while (true) do
		local start, finish, result = document:find(this_block_pattern, last)

		--Have we finished dealing with template blocks?
		if (not start) then
			break
		end

		--Gather up all the plain document contents since the last block, generate code to print it
		--We use the number of equals signs we calculated above
		local precontent = document:sub(last, start - 1)
		precontent = precontent:gsub("^[^\n]+$", strip_line_if_just_spaces)
		table.insert(output_buffer, ("_([%s[%s]%s])"):format(equals, precontent, equals))

		if (result:sub(1, 1) == "=") then
			--'put'-style template blocks output directly to screen
			table.insert(output_buffer, ("_(%s)"):format(result:match(put_pattern)))
		else
			--This block is plain code
			table.insert(output_buffer, result)
		end

		--We've dealt with all the characters to this point
		last = finish + 1
	end

	--Gather all of the document after the last template block
	local postcontent = document:sub(last)
	table.insert(output_buffer, ("_([%s[%s]%s])"):format(equals, postcontent, equals))

	return table.concat(output_buffer, "\n")
end

--[[
	Executes an already-compiled Soquid document with the given data
]]
function TemplateEngine:Execute(template, data)
	--Create a relatively sandboxed environment
	local env = shallow_copy(self.DefaultEnvironment)

	if (data) then
		shallow_copy(data, env)
	end

	--Define a buffer append function so the template can write out results
	local buffer = {}
	local function append_to_buffer(s)
		table.insert(buffer, tostring(s))
	end

	-- Alias output function to underscore.
	env._ = append_to_buffer

	--Load the function and try executing it
	local func, err = Carbon.LoadString(template, template:sub(50), env)

	if (not func) then
		return false, CodeGenerationException:New("(COMPILE) Generated method had error: " .. err, template)
	end

	local result, err = pcall(func)

	--Did something go wrong? Abort!
	if (not result) then
		return false, CodeGenerationException:New(err, template)
	end

	--Yield the results
	return table.concat(buffer)
end

--[[
	Compiles and executes a template-enabled document with the given data.
]]
function TemplateEngine:Render(document, data, level)
	local result, err = self:Compile(document, level)

	if (not result) then
		return false, err
	end

	local result, exception = self:Execute(result, data)

	if (not result) then
		return false, exception
	end

	return result
end

--[[
	Adds a partial document with a given name
]]
function TemplateEngine:AddPartial(name, document, level)
	local compiled = self:Compile(document, level)
	self.Partials[name] = compiled
end

return TemplateEngine