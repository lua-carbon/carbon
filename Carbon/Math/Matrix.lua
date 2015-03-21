--[[
	Carbon for Lua
	#class Math.Matrix<N, M>

	#description {
		Generates `N`x`M` matrices.

		Matrices native to Carbon are Row-Major!

		This does not scale very well, but is fast for small values of `N` and `M`.
		Works only for matrices smaller than 14x14.
		For larger matrices, consider a different implementation.

		The 'loose' form of a Matrix, `@loose<@Matrix>` is of the form `(N, M, ...)` where `N` and `M`
		are the dimensions of the matrix and `...` represents the values within it.
	}
]]

local Carbon = (...)
local Dictionary = Carbon.Collections.Dictionary
local OOP = Carbon.OOP
local CodeGenerationException = Carbon.Exceptions.CodeGenerationException
local TemplateEngine = Carbon.TemplateEngine

local ok, ffi = pcall(require, "ffi")
if (not ok) then
	ffi = nil
end

local Matrix
Matrix = {
	Engine = TemplateEngine:New(),
	__cache = {},
	__methods = {
		-- Initializer:
		-- Matrix:Init(...)
		--[[#method 1 {
			class public @Matrix Matrix:New(...)
			-alias: object public self Matrix:Init(...)
				optional ...: The values to initialize the matrix with. Each value is 0 by default.

			Initializes or creates a matrix with a set of row-major values.
		}]]
		Init = [[
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

		--[[#method 1 {
			class public @Matrix Matrix:NewFromLoose(@unumber rows, @unumber columns, ...)
			-alias: object public self Matrix:InitFromLoose(@unumber rows, @unumber columns, ...)
				required rows: The number of rows the loose data has.
				required columns: The number of columns the loose data has.
				optional ...: The data to initialize or create the matrix with.

			Initializes or creates a matrix with a set of sized row-major values.
		}]]
		InitFromLoose = function(self, rows, columns, ...)
			for i = 1, columns do
				for j = 1, rows do
					self[(i - 1) * columns + j] = select((i - 1) * columns + j, ...)
				end
			end

			return self
		end,

		NewFromLoose = function(self, ...)
			return self:New():InitFromLoose(...)
		end,

		--[[#method {
			object public @loose<@Matrix> Matrix:ToLoose()

			Returns the loose form of the @Matrix, decomposing into a tuple.
		}]]
		ToLoose = [[
			return function(self)
				return
				{% _(ROWS) _(",") _(COLUMNS) _(",")
				for i = 1, N do
					_(("self[%d]"):format(
						i
					))

					if (i < N) then
						_(",")
					end
				end %}
			end
		]],

		GetComponents = [[
			return function(self)
				return
				{% for i = 1, N do
					_(("self[%d]"):format(
						i
					))

					if (i < N) then
						_(",")
					end
				end %}
			end
		]],

		TransposeInPlace = function(self)
			return self:Transpose(self)
		end,

		Transpose = [[
			{% if (COLUMNS == ROWS) then %}
				return function(self, out)
					out = out or self.class:New()

					for i = 1, {%=ROWS %} do
						for j = 1, {%=COLUMNS %} do
							out:Set(i, j, self:Get(j, i))
						end
					end

					return out
				end
			{% end %}
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

		Set = [[
			return function(self, i, j, value)
				self[(i - 1) * {%=COLUMNS %} + j] = value
			end
		]],

		Get = [[
			return function(self, i, j)
				return self[(i - 1) * {%=COLUMNS %} + j]
			end
		]],

		GetRow = [[
			return function(self, i)
				return 
				{% for j = 1, COLUMNS do
					_(("self[(i - 1) * %d + %d]"):format(
						COLUMNS, j
					))

					if (j < COLUMNS) then
						_(",")
					end
				end %}
			end
		]],

		MultiplyScalarInPlace = function(self, value)
			return self:MultiplyScalar(value, self)
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

		MultiplyVector = function(self, other, out)
			if (self.ColumnCount ~= other.ComponentCount) then
				return nil, "Cannot multiply mismatched matrices and vectors!"
			end

			out = out or other.class:New()

			for i = 1, self.RowCount do
				local sum = 0
				for k = 1, self.ColumnCount do
					sum = sum + self:Get(i, k) * other[k]
				end
				out[i] = sum
			end

			return out
		end,

		MultiplyMatrixInPlace = function(self, other, out)
			return self:MultiplyMatrix(other, out)
		end,

		MultiplyMatrix = function(self, other, out)
			if (self.ColumnCount ~= other.RowCount) then
				return nil, "Cannot multiply matrices where a.rows ~= b.columns!"
			end

			out = out or Matrix:Generate(self.RowCount, other.ColumnCount):New()

			for i = 1, self.RowCount do
				for j = 1, other.ColumnCount do
					local sum = 0
					for k = 1, self.ColumnCount do
						sum = sum + self:Get(i, k) * other:Get(k, j)
					end
					out:Set(i, j, sum)
				end
			end

			return out
		end,

		ToNative = [[
			{% if (ffi) then %}
				return function(self, out)
					if (out) then
						for i = 1, {%=N %} do
							out[i - 1] = self[i]
						end
					else
						return ffi.new("float[{%=N %}]", self:GetComponents())
					end
				end
			{% else %}
				return function() end
			{% end %}
		]]
	},
	__metatable = {
		-- String conversion:
		-- tostring(Matrix)
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
	function Matrix:__generate_method(string body, table arguments)
		body: Template-enabled code to return a function.
		arguments: Arguments to the template

	Generates a method using Carbon's TemplateEngine and handles errors.
]]
function Matrix:__generate_method(body, arguments, env)
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
	Class<Matrix> Matrix:Generate(uint rows, uint columns)
		rows: The number of rows in the matrix
		columns: The number of columns in the matrix

	Generates a new Matrix class with the given keys and parameters. Results are cached, but this method may still be slow.
	It performs runtime code generation and template parsing on each generated class.
]]
function Matrix:Generate(rows, columns)
	local n = rows * columns

	if (self.__cache[rows] and self.__cache[rows][columns]) then
		return self.__cache[rows][columns]
	end

	local class = OOP:Class()
	class.Is[Matrix] = true

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
		CLASS = class,
		ffi = ffi
	}

	local env = {
		Matrix = self,
		ffi = ffi
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
			PoolSize = 64,
			SparseInstances = true,
			ExplicitInitialization = true
		}

	self.__cache[rows] = self.__cache[rows] or {}
	self.__cache[rows][columns] = class

	return class
end

return Matrix