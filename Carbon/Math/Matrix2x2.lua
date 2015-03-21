--[[
	Carbon for Lua
	#class Math.Matrix2x2
	#inherits Math.Matrix

	#description {
		A 2x2 row-major matrix.
	}
]]

local Carbon = (...)

local Matrix2x2, except = Carbon.Math.Matrix:Generate(2, 2)

if (not Matrix2x2) then
	if (except.Is[Carbon.Exceptions.CodeGenerationException]) then
		print(except.GeneratedCode)
	end
	
	Carbon.Error(except)
end

return Matrix2x2