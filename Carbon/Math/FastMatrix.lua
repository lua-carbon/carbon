--[[
	Carbon for Lua
	FastMatrix Template

	Generates NxM matrices.

	This does not scale very well, but is fast for small values of N and M.
	Works only for matrices smaller than 14x14.
	For larger matrices, consider a different implementation.
]]

local Carbon = (...)
local Dictionary = Carbon.Collections.Dictionary
local OOP = Carbon.OOP
local CodeGenerationException = Carbon.Exceptions.CodeGenerationException
local TemplateEngine = Carbon.TemplateEngine

local FastMatrix
FastMatrix = {
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

		Zero = [[
			return function(self)
				return self:New(
				{% for i = 1, N do
					_("0")
					if (i < N) then
						_(",")
					end
				end %}
				)
			end
		]],

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
		]],

		SetValue = function(self, i, j, value)
			self[(i - 1) * self.ColumnCount + j] = value
		end,

		GetValue = function(self, i, j)
			return self[(i - 1) * self.ColumnCount + j]
		end,

		MultiplyScalar = [[
			return function(self, value, out)
				out = out or self.class:New()

				{% for i = 1, N do
					_(("out[%d] = out[%d] * value\n"):format(
						i, i
					))
				end %}
			end
		]],

		MultiplyLoose = [[
			return function(self, rows, columns, ...)
				local out = select(rows*columns + 1, ...) or self.class:New()
			end
		]],

		MultiplyLikeMatrix = [[
			return function() end
		]],

		MultiplyMatrix = function(self, other, out)
			if (self.ColumnCount ~= other.RowCount) then
				return nil, "Cannot multiply matrices where a.rows ~= b.columns!"
			end

			out = out or FastMatrix:Generate(self.RowCount, other.ColumnCount):New()

			for i = 1, self.RowCount do
				for j = 1, other.ColumnCount do
					local sum = 0
					for k = 1, self.ColumnCount do
						sum = sum + 
							(self:GetValue(i, k)) *
							(other:GetValue(k, j))
					end
					out:SetValue(i, j, sum)
				end
			end

			return out
		end
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
function FastMatrix:__generate_method(body, arguments, env)
	local generated, exception = self.Engine:Render(body, arguments)

	if (not generated) then
		return false, exception
	end

	Dictionary.ShallowMerge(_G, env)
	local generator, err = Carbon:LoadString(generated, body:sub(1, 50), env)

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
	local n = rows * columns

	if (self.__cache[rows] and self.__cache[rows][columns]) then
		return self.__cache[rows][columns]
	end

	local class = OOP:Class()
	class.Is[FastMatrix] = true

	local body = {
		RowCount = rows,
		ColumnCount = columns
	}

	class:Members(body)

	-- These are all LOUD to show that they're template arguments.
	local gen_args = {
		N = n,
		ROWS = rows,
		COLUMNS = columns,
		CLASS = class
	}

	local env = {
		FastMatrix = self
	}

	-- Process methods for the generated class
	for name, body in pairs(self.__methods) do
		if (type(body) == "string") then
			class[name], err, body = self:__generate_method(body, gen_args, env)

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
			metatable[name], err, body = self:__generate_method(body, gen_args, env)

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

	self.__cache[rows] = self.__cache[rows] or {}
	self.__cache[rows][columns] = class

	return class
end

return FastMatrix