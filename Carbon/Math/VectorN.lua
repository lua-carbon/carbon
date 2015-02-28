--[[
	Carbon for Lua
	VectorN Template

	Provides a code generation-driven method of generating arbitrary-length vectors.
]]

local Carbon = (...)
local OOP = Carbon.OOP
local CodeGenerationException = Carbon.Exceptions.CodeGenerationException
local TemplateEngine = Carbon.TemplateEngine

local loadstring = loadstring or load

local VectorN = {
	Engine = TemplateEngine:New(),
	__cache = {},
	__methods = {
		-- Initializer:
		-- Vector:_init(...)
		_init = [[
			return function(self, {%= ARGS %})
				{% for i, member in ipairs(MEMBERS) do
					_(("self[%q] = %s or %s;"):format(
						member, member, PARAMETERS.DefaultValues[i]
					))
				end %}
			end
		]],

		Length = [[
			return function(self)
				return math.sqrt(
				{% for i, member in ipairs(MEMBERS) do
					_(("self[%q]^2%s"):format(
						member, i < N and "+" or ""
					))
				end %})
			end
		]],

		LengthSquared = [[
			return function(self)
				return 
				{% for i, member in ipairs(MEMBERS) do
					_(("self[%q]^2%s"):format(
						member, i < N and "+" or ""
					))
				end %}
			end
		]],

		Normalize = [[
			return function(self, out)
				out = out or self.class:New()

				local length = math.sqrt(
				{% for i, member in ipairs(MEMBERS) do
					_(("self[%q]^2%s"):format(
						member, i < N and "+" or ""
					))
				end %})

				if (length == 0) then
					length = 1 / {%= PARAMETERS.NormalizedLength %}
				else
					{% if (PARAMETERS.NormalizedLength ~= 1) then %}					
						length = length / {%= PARAMETERS.NormalizedLength %}
					{% end %}
				end

				{% for i, member in ipairs(MEMBERS) do
					_(("out[%q] = %g * self[%q] / length;"):format(
						member, PARAMETERS.NormalizedLength, member
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
				return ("({%= ("%g, "):rep(N):sub(1,-3) %})"):format(
				{% for i, member in ipairs(MEMBERS) do
					_(("self[%q]%s"):format(
						member, i < N and "," or ""
					))
				end %})
			end
		]]
	}
}

--[[
	function VectorN:__generate_method(string body, table arguments)
		body: Template-enabled code to return a function.
		arguments: Arguments to the template

	Generates a method using Carbon's TemplateEngine and handles errors.
]]
function VectorN:__generate_method(body, arguments)
	local generated, exception = self.Engine:Render(body, arguments)

	if (not generated) then
		return false, exception
	end

	local generator, err = loadstring(generated)

	if (not generator) then
		return false, CodeGenerationException:New(err, generated)
	end

	return generator()
end

--[[
	Class<Vector> VectorN:Generate(string[] members, [table parameters])
		members: The keys to the vector.
		parameters: Options for generating the class:
			number NormalizedLength (1): The length the vector reaches when normalized.
			number DefaultValue (0): The value to initialize all members to if not given.
			list DefaultValues: A list of values to initialize specific keys to. If any are given, all keys must be specified.

	Generates a new Vector class with the given keys and parameters. Results are cached, but this method may still be slow.
	It performs runtime code generation and template parsing on each generated class.
]]
function VectorN:Generate(members, parameters)
	parameters = parameters or {}

	local n = #members
	local args = table.concat(members, ",")

	if (self.__cache[args]) then
		return self.__cache[args]
	end

	if (parameters.DefaultValue) then
		parameters.DefaultValues = {}
		for i = 1, n do
			table.insert(paramters.DefaultValues, parameters.DefaultValue)
		end
	elseif (not parameters.DefaultValues) then
		parameters.DefaultValues = {}
		for i = 1, n do
			table.insert(parameters.DefaultValues, 0)
		end
	end

	parameters.NormalizedLength = parameters.NormalizedLength or 1

	local class = OOP:Class()

	local body = {}
	for i = 1, n do
		body[members[i]] = 0
	end

	class:Members(body)

	-- These are all LOUD to show that they're template arguments.
	local gen_args = {
		N = n,
		ARGS = args,
		MEMBERS = members,
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
			PoolSize = 50,
			SparseInstances = true,
			ExplicitInitialization = true
		}

	self.__cache[args] = class

	return class
end

return VectorN