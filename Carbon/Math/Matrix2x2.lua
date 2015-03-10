--[[
	Carbon for Lua
	2x2 FastMatrix
]]

local Carbon = (...)

local Matrix2x2, except = Carbon.Math.FastMatrix:Generate(2, 2)

if (not Matrix2x2) then
	if (except.Is[Carbon.Exceptions.CodeGenerationException]) then
		print(except.GeneratedCode)
	end
	
	Carbon.Error(except)
end

return Matrix2x2