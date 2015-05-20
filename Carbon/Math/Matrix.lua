--[[
	Carbon for Lua
	#class Math.Matrix<N, M>

	#description {
		Generates `N`x`M` matrices.

		Matrices native to Carbon are row-major!

		This does not scale very well, but is fast for small values of `N` and `M`.
		Works only for matrices smaller than 14x14.
		For larger matrices, consider a different implementation.

		The 'loose' form of a Matrix, `@loose<@Matrix>` is of the form `(N, M, ...)` where `N` and `M`
		are the dimensions of the matrix and `...` represents the values within it.

		Methods listed here operating on a `@Matrix<N, M>` work only on generated classes, while those
		listed as operating on `@Matrix` operate only on the generator class.
	}

	#alias Vector Math.Vector
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

-- Helper functions for the generators
-- These would use string.format, or string.gsub even, but percent signs make Lua throw up.

-- Denotes that a function can only work if the matrix is square.
local function SQUARE_ONLY(str)
	return [[
		{% if (ROWS ~= COLUMNS) then %}
			return function()
				return nil, "Method only exists for square matrices!"
			end
		{% else %}
	]] .. str .. [[
		{% end %}
	]]
end

-- Denotes that a function can only work if the LuaJIT FFI is available.
local function FFI_ONLY(str)
	return [[
		{% if (not ffi) then %}
			return function()
				return nil, "Method only works with the LuaJTI FFI!"
			end
		{% else %}
	]] .. str .. [[
		{% end %}
	]]
end

-- Argument list for U* generators.
local args = {
	"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
	"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
	"_"
}

-- Generates a list of letters given a count and offset (default to 0)
local function ULIST(count, offset, prefix)
	offset = offset or 0
	prefix = prefix or ""

	local buffer = {}
	for i = offset + 1, count + offset do
		table.insert(buffer, prefix .. args[i])
	end

	return table.concat(buffer, ",")
end

-- Returns a single letter with the given index.
local function USINGLE(item)
	return args[item]
end

local Matrix
Matrix = {
	Engine = TemplateEngine:New(),
	__cache = {},
	__methods = {
		--[[#method 1 {
			$typical_constructor(Matrix<N,M>(...))
				optional ...: The values to initialize the matrix with. Each value is nil by default.

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
			$constructor_init_pair(FromLoose Matrix<N,M>(@unumber rows, @unumber columns, ...))
				required rows: The number of rows the loose data has.
				required columns: The number of columns the loose data has.
				optional ...: The data to initialize or create the matrix with.

			Initializes or creates a matrix with a set of sized row-major values.
		}]]
		InitFromLoose = function(self, rows, columns, ...)
			self:InitIdentity()
			for i = 1, columns do
				for j = 1, rows do
					self:Set(i, j, select((i - 1) * columns + j, ...))
				end
			end

			return self
		end,

		NewFromLoose = function(self, ...)
			return self:NewZero():InitFromLoose(...)
		end,

		--[[#method 2 {
			object public @loose<@Matrix<N,M>> Matrix<N,M>:ToLoose()

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

		--[[#method 2 {
			object public @tuple<N*M, ...> Matrix<N,M>:GetComponents()

			Returns the components of the @Matrix in row-major ordering.
		}]]
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

		--[[#method {
			object public @Matrix<N,M> Matrix<N,M>:Transpose([@Matrix<N,M> out])
				optional out: An optional @Matrix to place the data into.

			Transposes the @Matrix.
		}]]
		Transpose = SQUARE_ONLY [[
			return function(self, out)
				out = out or self.class:New()

				{% for i = 1, ROWS do %}
					local {%=ULIST(COLUMNS, i * COLUMNS - COLUMNS) %} = self:GetRow({%=i %})
				{% end %}

				{% for i = 1, COLUMNS do %}
					out:SetColumn({%=i %}, {%=ULIST(COLUMNS, i * COLUMNS - COLUMNS) %})
				{% end %}

				return out
			end
		]],

		--[[#method {
			object public self Matrix<N,M>:Transpose!()
			-alias: object public self Matrix<N,M>:TransposeInPlace()

			Transposes the matrix in-place.
		}]]
		TransposeInPlace = function(self)
			return self:Transpose(self)
		end,

		--[[#method 1 {
			$constructor_init_pair(Zero Matrix<N,M>())

			Creates or initializes a matrix with all zero values.
		}]]
		NewZero = [[
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

		InitZero = [[
			return function(self)
				self:Init(
				{% for i = 1, N do
					_("0")
					if (i < N) then
						_(",")
					end
				end %}
				)
			end
		]],

		PlacementNewFromLoose = [[
			return function(self, out, rows, columns, ...)
				if (out) then
					out:InitFromLoose(rows, columns, ...)
					return out
				else
					return self:NewFromLoose(rows, columns, ...)
				end
			end
		]],

		--[[#method {
			class public @loose<@Matrix<N,M>> Matrix<N,M>:NewLooseZero()

			Returns a @loose<@Matrix<N,M>> full of zeroes.
		}]]
		NewLooseZero = [[
			return function(self)
				return {%=ROWS %}, {%=COLUMNS %},
				{% for i = 1, N do
					_("0")

					if (i < N) then
						_(",")
					end
				end %}
			end
		]],

		--[[#method 1 {
			class public @Matrix<N,M> Matrix<N,M>:NewIdentity()
			-alias: object public @void Matrix<N,M>:InitIdentity()

			Creates or initializes an identity matrix.
		}]]
		NewIdentity = SQUARE_ONLY [[
			return function(self)
				return self:NewFromLoose(self:NewLooseIdentity())
			end
		]],

		InitIdentity = SQUARE_ONLY [[
			return function(self)
				return self:Init(select(3, self:NewLooseIdentity()))
			end
		]],

		--[[#method {
			class public @loose<@Matrix<N,M>> Matrix<N,M>:NewLooseIdentity()

			Returns an identity @loose<@Matrix<N,M>>.
		}]]
		NewLooseIdentity = SQUARE_ONLY [[
			return function(self)
				return {%=ROWS %}, {%=COLUMNS %},
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
			end
		]],

		--[[#method 2 {
			object public @void Matrix<N,M>:Set(@unumber i, @unumber j, @number? value)
				required i: The column to look up.
				required j: The row to look up.
				required value: The value to set at the cell.

			Sets a value of a cell specified by `(column, row)`.
		}]]
		Set = [[
			return function(self, i, j, value)
				self[(i - 1) * {%=COLUMNS %} + j] = value
			end
		]],

		--[[#method 2 {
			object public @number? Matrix<N,M>:Get(@unumber i, @unumber j)
				required i: The column to look up.
				required j: The row to look up.

			Gets a value of a cell specified by `(column, row)`.
		}]]
		Get = [[
			return function(self, i, j)
				return self[(i - 1) * {%=COLUMNS %} + j]
			end
		]],

		--[[#method 2.01 {
			object public @void Matrix<N,M>:SetRow(@unumber row, @tuple<N, ...> values)
				required row: The row to set values for
				required values: The values to set for this row.

			Sets an entire row's values in the @Matrix.
		}]]
		SetRow = [[
			return function(self, i, ...)
				{% for j = 1, COLUMNS do
					_(("self[(i - 1) * %d + %d]"):format(
						COLUMNS, j
					))

					if (j < COLUMNS) then
						_(",")
					end
				end %} = ...
			end
		]],

		--[[#method 2.01 {
			object public @tuple<N, ...> Matrix<N,M>:GetRow(@unumber row)
				required row: The row to get values for.

			Returns an entire row's values from this @Matrix.
		}]]
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

		--[[#method 2.02 {
			object public @void Matrix:SetColumn<N,M>(@unumber column, @tuple<M, ...> values)
				required column: The column to set values for
				required values: The values to set for this column.

			Sets an entire column's values in the @Matrix.
		}]]
		SetColumn = [[
			return function(self, j, ...)
				{% for i = 1, ROWS do
					_(("self[(%d - 1) * %d + j]"):format(
						i, COLUMNS
					))

					if (i < ROWS) then
						_(",")
					end
				end %} = ...
			end
		]],

		--[[#method 2.02 {
			object public @tuple<M, ...> Matrix<N,M>:GetColumn(@unumber column)
				required column: The column to get values for.

			Returns an entire column's values from this @Matrix.
		}]]
		GetColumn = [[
			return function(self, j)
				return
				{% for i = 1, ROWS do
					_(("self[(%d - 1) * %d + j]"):format(
						i, COLUMNS
					))

					if (i < ROWS) then
						_(",")
					end
				end %}
			end
		]],

		--[[#method {
			object public @Matrix<N,M> Matrix<N,M>:MutiplyScalar(@number value, [@Matrix out])
				required value: The scalar to scale the matrix with.
				optional out: Where to put the resulting data.

			Multiplies the @Matrix by a scalar value.
		}]]
		MultiplyScalar = [[
			return function(self, value, out)
				out = out or self.class:New()

				{% for i = 1, N do
					_(("out[%d] = out[%d] * value\n"):format(
						i, i
					))
				end %}

				return out
			end
		]],

		--[[#method {
			object public self Matrix<N,M>:MultiplyScalar!(@number value)
			-alias: object public self Matrix<N,M>:MultiplyScalarInPlace(@number value)
				required value: The scalar to scale the matrix with.

			Multiplies the @Matrix by a scalar value in place.
		}]]
		MultiplyScalarInPlace = function(self, value)
			return self:MultiplyScalar(value, self)
		end,

		--[[#method {
			object public @Matrix<N,M> Matrix:MultiplyLooseMatrix<N,M>(@loose<@Matrix> other, [@Matrix out])
				required other: A @loose @Matrix, (rows, columns, ...)
				optional out: Where to put the resulting data.

			Multiplies the @Matrix with a loose-representation matrix.
		}]]
		MultiplyLooseMatrix = [[
			{% local components = ULIST(N, 0, "c_") %}

			return function(self, rows, columns, ...)
				if ({%=COLUMNS %} ~= rows) then
					return nil, "Cannot multiply matrices where a.rows ~= b.columns!"
				end

				local out = select(rows*columns + 1, ...) or self.class:New()

				local {%=components %} = self:GetComponents()

				for i = 1, {%=ROWS %} do
					for j = 1, columns do
						local sum = 0

						for k = 1, {%=COLUMNS %} do
							sum = sum
								+ select((i - 1) * {%=COLUMNS %} + k, {%=components %})
								* select((k - 1) * columns + j, ...)
						end

						out:Set(i, j, sum)
					end
				end

				return out
			end
		]],

		--[[#method {
			object public @loose<@Vector<N>> Matrix<N,M>:LooseMultiplyLooseVector(@loose<@Vector<N>>> vector)
				required vector: The loose vector to multiply with.

			Multiplies the matrix with a row vector and returns the result in loose form.
		}]]
		LooseMultiplyLooseVector = [[
			return function(self, {%=ULIST(COLUMNS) %})
				return
				{% for i = 1, ROWS do
					for k = 1, COLUMNS do
						_(("(self:Get(%d, %d) * %s)"):format(
							i, k, USINGLE(k)
						))

						if (k < COLUMNS) then
							_("+")
						end
					end

					if (i < ROWS) then
						_(",")
					end
				end %}
			end
		]],

		--[[#method {
			object public @Vector<N> Matrix<N,M>:MultiplyLooseVector(@loose<@Vector<N>>> vector)
				required vector: The loose vector to multiply with.

			Multiplies the matrix with a row vector and returns the result in a @Vector.
		}]]
		MultiplyLooseVector = [[
			local vector = Carbon.Math.Vector:Generate({%=COLUMNS %})

			return function(self, {%=ULIST(COLUMNS) %}, out)
				if (out) then
					out:Init(self:LooseMultiplyLooseVector({%=ULIST(COLUMNS) %}))
				else
					vector:New(self:LooseMultiplyLooseVector({%=ULIST(COLUMNS) %}))
				end
			end
		]],

		--[[#method {
			object public @Vector<N> Matrix<N,M>:MultiplyVector(@Vector<N> other, [@Vector<N> out])
				required other: The vector to multiply with.
				optional out: Where to put the resulting data.

			Post-Multiplies the @Matrix with the given @Vector.

			`@Matrix * @Vector`
		}]]
		MultiplyVector = [[
			return function(self, other, out)
				if ({%=COLUMNS %} ~= other.ComponentCount) then
					return nil, "Cannot multiply mismatched matrices and vectors!"
				end

				out = out or other.class:New()
				local {%=ULIST(COLUMNS) %} = other:GetComponents()

				return self:MultiplyLooseVector({%=ULIST(COLUMNS) %}, out)
			end
		]],

		MultiplyVectorInPlace = function(self, other)
			return self:MultiplyVector(other, other)
		end,

		--[[#method {
			object public @Vector<M> Matrix<N,M>:PreMultiplyVector(@Vector<M> other, [@Vector<M> out])
				required other: The @Vector to multiply with.
				optional out: Where to put the resulting data.

			Pre-multiplies the @Matrix and the given @Vector.

			`@Vector * @Matrix`
		}]]
		PreMultiplyVector = [[
			return function(self, other, out)
				if ({%=COLUMNS %} ~= other.ComponentCount) then
					return nil, "Cannot multiply mismatched matrices and vectors!"
				end

				out = out or other.class:New()
				local {%=ULIST(COLUMNS) %} = other:GetComponents()

				{% for i = 1, ROWS do
					_(("out[%d] = "):format(i))

					for k = 1, COLUMNS do
						_(("(self:Get(%d, %d) * %s)"):format(
							i, k, USINGLE(k)
						))

						if (k < COLUMNS) then
							_("+")
						end
					end
				end %}

				return out
			end
		]],

		PreMultiplyVectorInPlace = function(self, other)
			return self:MultiplyVector(other, other)
		end,

		--[[#method {
			object public self Matrix<N,M>:MultiplyMatrix!(@Matrix other)
			-alias: object public self Matrix:MultiplyMatrixInPlace(@Matrix other)
				required other: The matrix to multiply with.

			Multiplies this matrix with another matrix, outputting into this matrix.

			Only works with square matrices.
		}]]
		MultiplyMatrixInPlace = function(self, other)
			return self:MultiplyMatrix(other, self)
		end,

		--[[#method {
			object public @Matrix Matrix<N,M>:MultiplyMatrix(@Matrix other, [@Matrix out])
				required other: The matrix to multiply with this one.
				optional out: Where to put the data. A new matrix if not specified.

			Multiplies this @Matrix with another @Matrix.
		}]]
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

		--[[#method {
			object public @FFI<float[N*M]> Matrix<N,M>:GetNative()

			Returns this matrix's native representation. Uses the same object for every call.
		}]]
		GetNative = FFI_ONLY [[
			return function(self)
				if (self.__native) then
					{% for i = 1, N do
						_(("self.__native[%d] = self[%d]"):format(
							i - 1, i
						))
					end %}
				else
					self.__native = ffi.new("float[{%=N %}]", self:GetComponents())
				end

				return self.__native
			end
		]],

		--[[#method {
			object public @FFI<float[N*M]> Matrix<N,M>:ToNative([@FFI<float[N]> out])
				optional out: Where to place the resulting data.

			Returns a native representation of the matrix using the LuaJIT FFI.
		}]]
		ToNative = FFI_ONLY [[
			return function(self, out)
				if (out) then
					for i = 1, {%=N %} do
						out[i - 1] = self[i]
					end
				else
					return ffi.new("float[{%=N %}]", self:GetComponents())
				end
			end
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
	},
	__generated = {}
}

--[[#method {
	class private @function Matrix:__generate_method(string body, table arguments)
		required body: Template-enabled code to return a function.
		required arguments: Arguments to the template

	Generates a method using Carbon's TemplateEngine and handles errors.
}]]
function Matrix:__generate_method(body, arguments, env, name)
	local generated, exception = self.Engine:Render(body, arguments)

	if (not generated) then
		exception.Message = exception.Message .. " in method " .. (name or "[unknown]")
		return false, exception
	end

	Dictionary.ShallowMerge(_G, env)
	local generator, err = Carbon.LoadString(generated, body:sub(1, 50), env)

	if (not generator) then
		return false, CodeGenerationException:New(err, generated), generated
	end

	return generated, generator()
end

--[[#method 0 {
	class public Class<@Matrix> Matrix:Generate(uint rows, uint columns)
		required rows: The number of rows in the matrix
		required columns: The number of columns in the matrix

	Generates a new Matrix class with the given size. Results are cached, but this method may still be slow.
	It performs runtime code generation and template parsing on each generated class.
}]]
function Matrix:Generate(rows, columns)
	local n = rows * columns

	if (self.__cache[rows] and self.__cache[rows][columns]) then
		return self.__cache[rows][columns]
	end

	local class = OOP:Class()
	class.Is[Matrix] = true

	local body = {
		__generated = {},
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
		ULIST = ULIST,
		USINGLE = USINGLE,
		ffi = ffi,
		Carbon = Carbon
	}

	local env = {
		ULIST = ULIST,
		USINGLE = USINGLE,
		Carbon = Carbon,
		Matrix = self,
		ffi = ffi
	}

	-- Process methods for the generated class
	for name, body in pairs(self.__methods) do
		if (type(body) == "string") then
			local generated, err
			generated, class[name], err = self:__generate_method(body, gen_args, env, name)

			if (not class[name]) then
				return nil, err, name, body
			end

			class.__generated[name] = generated
		else
			class[name] = body
		end
	end

	local metatable = {}

	for name, body in pairs(self.__metatable) do
		if (type(body) == "string") then
			local generated, err
			generated, metatable[name], err = self:__generate_method(body, gen_args, env, name)

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