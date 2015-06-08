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
local Callisto = Carbon.Callisto

Callisto.Compiler.Legacy = true

Carbon.Logging:ImportAll()

--[[#property public @TemplateEngine Engine {
	The @TemplateEngine Carbide will use.
}]]
local Carbide = {
	Engine = TemplateEngine:New()
}

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
	return Callisto.Transform(source, settings)
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