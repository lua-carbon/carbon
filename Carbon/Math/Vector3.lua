--[[
	Carbon for Lua
	Vector3 Object

	Provides a 3-length vector with X, Y, and Z keys.
]]

local Carbon = (...)

local Vector3, except = Carbon.Math.Vector:Generate(3)

if (not Vector3) then
	if (except.Is[Carbon.Exceptions.CodeGenerationException]) then
		print(except.GeneratedCode)
	end
	
	Carbon.Error(except)
end

return Vector3