--[[
	Carbon for Lua
	3x3 FastMatrix
]]

local Carbon = (...)

local Matrix3x3, except = Carbon.Math.Matrix:Generate(3, 3)

if (not Matrix3x3) then
	if (except.Is[Carbon.Exceptions.CodeGenerationException]) then
		print(except.GeneratedCode)
	end
	
	Carbon.Error(except)
end

return Matrix3x3