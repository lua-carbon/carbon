--[[
	Carbon for Lua
	FastMatrix Template

	Generates NxM matrices.

	This does not scale very well, but is fast for small values of N and M.
	Past 14x14 matrices, this class will not work at all.
	For larger matrices, consider a different implementation.
]]

local Carbon = (...)
local OOP = Carbon.OOP
local CodeGenerationException = Carbon.Exceptions.CodeGenerationException
local TemplateEngine = Carbon.TemplateEngine

local loadstring = loadstring or load

local FastMatrix = {
	Engine = TemplateEngine:New(),
	__cache = {},
	__methods = {
		-- Initializer:
		-- FastMatrix:_init(...)
		_init = [[
			return function(self, ...)
				{% for i = 1, N do
					_(("self[%d]"):format(
						i
					))

					if (i < N) then
						_(",")
					end
				end %} = ...
			end
		]],

		-- FastMatrix:Identity()
		Identity = [[
			return function(self)
				{% if (ROWS == COLUMNS) then %}
					return self:New(
						{% for i = 1, ROWS do
							for j = 1, COLUMNS do
								if (i == j) then
									_("1")
								else
									_("0")
								end

								if (i < ROWS or j < COLUMNS) then
									_(",")
								end
							end
						end %}
					)
				{% else %}
					return nil, "No identity exists for non-square matrices!"
				{% end %}
			end
		]]
	},
	__metatable = {
		-- String conversion:
		-- tostring(FastMatrix)
		__tostring = [[
			return function(self)
				local buffer = {}
				for i = 1, {%=N %} do
					table.insert(buffer, (self[i] or "x") .. ((i % {%=COLUMNS %} == 0) and "\n" or " "))
				end
				return table.concat(buffer)
			end
		]]
	}
}

--[[
	function FastMatrix:__generate_method(string body, table arguments)
		body: Template-enabled code to return a function.
		arguments: Arguments to the template

	Generates a method using Carbon's TemplateEngine and handles errors.
]]
function FastMatrix:__generate_method(body, arguments)
	local generated, exception = self.Engine:Render(body, arguments)

	if (not generated) then
		return false, exception
	end

	local generator, err = loadstring(generated)

	if (not generator) then
		return false, CodeGenerationException:New(err, generated), generated
	end

	return generator()
end

--[[
	Class<FastMatrix> FastMatrix:Generate(uint rows, uint columns)
		rows: The number of rows in the matrix
		columns: The number of columns in the matrix

	Generates a new FastMatrix class with the given keys and parameters. Results are cached, but this method may still be slow.
	It performs runtime code generation and template parsing on each generated class.
]]
function FastMatrix:Generate(rows, columns)
	local dimensions = rows .. "x" .. columns
	local n = rows * columns

	if (self.__cache[dimensions]) then
		return self.__cache[dimensions]
	end

	local class = OOP:Class()
	class.Is[FastMatrix] = true

	local body = {
		__rows = rows,
		__columns = columns
	}

	class:Members(body)

	-- These are all LOUD to show that they're template arguments.
	local gen_args = {
		N = n,
		ROWS = rows,
		COLUMNS = columns,
		CLASS = class
	}

	-- Process methods for the generated class
	for name, body in pairs(self.__methods) do
		if (type(body) == "string") then
			class[name], err, body = self:__generate_method(body, gen_args)

			if (not class[name]) then
				return nil, err, name, body
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
				return nil, err, name, body
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

	self.__cache[dimensions] = class

	return class
end

return FastMatrix