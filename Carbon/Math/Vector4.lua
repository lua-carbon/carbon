--[[
	Carbon for Lua
	Vector4 Object

	Provides a 4-length vector with X, Y, Z, and W keys.
]]

local Carbon = (...)

local Vector4, except = Carbon.Math.VectorN:Generate({"X", "Y", "Z", "W"})

if (not Vector4) then
	if (except.Is[Carbon.Exceptions.CodeGenerationException]) then
		print(except.GeneratedCode)
	end
	
	Carbon.Error(except)
end

return Vector4