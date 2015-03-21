--[[
	Carbon for Lua
	#class Math.Vector
	#inherits OOP.Object

	#description {
		**Abstract Template `Vector<N>`**

		Provides a metaprogramming-driven method of generating N-length vectors.

		Presently has a hard maximum component count of 26, can be expanded upon request.
	}
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
		--[[#method 1 {
			public @Vector<N> Vector<N>:New(...)
				optional ...: The arguments to the intialization. Should be `N` arguments long.

			Creates a new @Vector with `N` components.
		}]]
		Init = [[
			return function(self, {%= ARGS_STRING %})
				{% for i, arg in ipairs(ARGS) do
					_(("self[%d] = %s or %s;"):format(
						i, arg, PARAMETERS.DefaultValues[i]
					))
				end %}
			end
		]],

		--[[#method {
			public @unumber Vector<N>:Length()

			Returns the length of the vector.
		}]]
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

		--[[#method {
			public @unumber Vector<N>:LengthSquared()

			Returns the length of the vector squared.
		}]]
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

		--[[#method {
			public self Vector<N>:NormalizeInPlace()

			Normalizes the vector in-place.

			Called in Carbide as `Vector:Normalize!()`
		}]]
		NormalizeInPlace = function(self)
			return self:Normalize(self)
		end,

		--[[#method {
			public out Vector<N>:Normalize([@Vector<N> out])
				optional out: Where to place the data of the normalized vector. A new `Vector<N>` if not given.

			Normalizes the @Vector<N> object, optionally outputting the data to an existing @Vector<N>.
		}]]
		Normalize = [[
			return function(self, out)
				out = out or self.class:New()

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
		]],

		--[[#method {
			public @tuple<N, unumber> Vector<N>:GetComponents()

			Returns the individual components of the @Vector<N> in order. Much faster than `unpack`.
		}]]
		GetComponents = [[
			return function(self)
				return 
				{% for i = 1, LENGTH do
					_(("self[%d]"):format(i))

					if (i < LENGTH) then
						_(",")
					end
				end %}
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

--[[#method {
	private function Vector:__generate_method(@string body, @dictionary arguments, [@dictionary env])
		required body: Template-enabled code to return a function.
		required arguments: Arguments to the template
		optional env: The environment to generate the method under.

	Generates a method using Carbon's TemplateEngine and handles errors.
}]]
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

--[[#method {
	public @Vector<length> Vector:Generate(@uint length, [@dictionary parameters])
		required length: The length of the vector.
		optional parameters: Options for generating the class:

	Generates a new Vector class with the given keys and parameters. Results are cached, but this method may still be slow.
	It performs runtime code generation and template parsing on each generated class.

	The following parameters are valid:

	- @number NormalizedLength (1): The length the vector reaches when normalized.
	- @number DefaultValue (0): The value to initialize all members to if not given.
	- @list<@number> DefaultValues: A list of values to initialize specific keys to. If any are given, all keys must be specified.
}]]
function Vector:Generate(length, parameters)
	-- I had a good reason why this function cached based on parameters,
	-- but I don't remember it now, so for now it does not cache.
	--[[
	if (self.__cache[length]) then
		return self.__cache[length]
	end
	]]

	parameters = parameters or {}

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

	--self.__cache[length] = class

	return class
end

return Vector