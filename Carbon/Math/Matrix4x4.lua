--[[
	Carbon for Lua
	4x4 FastMatrix
]]

local Carbon = (...)

local Matrix4x4, except = Carbon.Math.Matrix:Generate(4, 4)

if (not Matrix4x4) then
	if (except.Is[Carbon.Exceptions.CodeGenerationException]) then
		print(except.GeneratedCode)
	end
	
	Carbon.Error(except)
end

return Matrix4x4