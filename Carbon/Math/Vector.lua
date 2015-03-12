--[[
	Carbon for Lua
	Vector Template

	Provides a code generation-driven method of generating arbitrary-length vectors.
	Maximum length of 26, can be expanded upon request.
]]

local Carbon = (...)
local OOP = Carbon.OOP
local Dictionary = Carbon.Collections.Dictionary
local List = Carbon.Collections.List
local CodeGenerationException = Carbon.Exceptions.CodeGenerationException
local TemplateEngine = Carbon.TemplateEngine

local loadstring = loadstring or load

local Vector = {
	Engine = TemplateEngine:New(),
	__cache = {},
	__methods = {
		-- Initializer:
		-- Vector:_init(...)
		_init = [[
			return function(self, {%= ARGS_STRING %})
				{% for i, arg in ipairs(ARGS) do
					_(("self[%d] = %s or %s;"):format(
						i, arg, PARAMETERS.DefaultValues[i]
					))
				end %}
			end
		]],

		Length = [[
			return function(self)
				return math.sqrt(
				{% for i = 1, LENGTH do
					_(("self[%d]^2%s"):format(
						i, i < LENGTH and "+" or ""
					))
				end %})
			end
		]],

		LengthSquared = [[
			return function(self)
				return 
				{% for i = 1, LENGTH do
					_(("self[%d]^2%s"):format(
						i, i < LENGTH and "+" or ""
					))
				end %}
			end
		]],

		Normalize = [[
			return function(self, out)
				out = (out == "self") and self or out or self.class:New()

				local length = self:Length()

				if (length == 0) then
					length = 1 / {%= PARAMETERS.NormalizedLength %}
				else
					{% if (PARAMETERS.NormalizedLength ~= 1) then %}					
						length = length / {%= PARAMETERS.NormalizedLength %}
					{% end %}
				end

				{% for i = 1, LENGTH do
					_(("out[%d] = %g * self[%d] / length;"):format(
						i, PARAMETERS.NormalizedLength, i
					))
				end %}

				return out
			end
		]]
	},
	__metatable = {
		-- String conversion:
		-- tostring(Vector)
		__tostring = [[
			return function(self)
				return ("({%= ("%g, "):rep(LENGTH):sub(1,-3) %})"):format(
				{% for i = 1, LENGTH do
					_(("self[%d]%s"):format(
						i, i < LENGTH and "," or ""
					))
				end %})
			end
		]]
	}
}

local arg_list = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"}

--[[
	function Vector:__generate_method(string body, table arguments)
		body: Template-enabled code to return a function.
		arguments: Arguments to the template

	Generates a method using Carbon's TemplateEngine and handles errors.
]]
function Vector:__generate_method(body, arguments, env)
	env = env or {}
	local generated, exception = self.Engine:Render(body, arguments)

	if (not generated) then
		return false, exception
	end

	Dictionary.ShallowMerge(_G, env)
	local generator, err = Carbon.LoadString(generated, body:sub(1, 50), env)

	if (not generator) then
		return false, CodeGenerationException:New(err, generated), generated
	end

	return generator()
end

--[[
	Class<Vector> Vector:Generate(uint length, [table parameters])
		length: The length of the vector.
		parameters: Options for generating the class:
			number NormalizedLength (1): The length the vector reaches when normalized.
			number DefaultValue (0): The value to initialize all members to if not given.
			list DefaultValues: A list of values to initialize specific keys to. If any are given, all keys must be specified.

	Generates a new Vector class with the given keys and parameters. Results are cached, but this method may still be slow.
	It performs runtime code generation and template parsing on each generated class.
]]
function Vector:Generate(length, parameters)
	parameters = parameters or {}

	if (self.__cache[length]) then
		return self.__cache[length]
	end

	local args = {}
	for i = 1, length do
		table.insert(args, arg_list[i])
	end

	local args_string = table.concat(args, ",")

	if (parameters.DefaultValue) then
		parameters.DefaultValues = {}
		for i = 1, length do
			table.insert(paramters.DefaultValues, parameters.DefaultValue)
		end
	elseif (not parameters.DefaultValues) then
		parameters.DefaultValues = {}
		for i = 1, length do
			table.insert(parameters.DefaultValues, 0)
		end
	end

	parameters.NormalizedLength = parameters.NormalizedLength or 1

	local class = OOP:Class()
	class.Is[Vector] = true

	local body = {
		ComponentCount = length
	}

	class:Members(body)

	-- These are all LOUD to show that they're template arguments.
	local gen_args = {
		LENGTH = length,
		ARGS = args,
		ARGS_STRING = args_string,
		PARAMETERS = parameters,
		CLASS = class
	}

	-- Process methods for the generated class
	for name, body in pairs(self.__methods) do
		if (type(body) == "string") then
			class[name], err, body = self:__generate_method(body, gen_args)

			if (not class[name]) then
				return false, err, body
			end
		else
			class[name] = body
		end
	end

	local metatable = {}

	for name, body in pairs(self.__metatable) do
		if (type(body) == "string") then
			metatable[name], err, body = self:__generate_method(body, gen_args)

			if (not metatable[name]) then
				return false, err, body
			end
		else
			metatable[name] = body
		end
	end

	class:Metatable(metatable)
		:Attributes {
			PooledInstantiation = true,
			PoolSize = 64,
			SparseInstances = true,
			ExplicitInitialization = true
		}

	self.__cache[length] = class

	return class
end

return Vector