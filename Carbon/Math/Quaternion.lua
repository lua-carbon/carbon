--[[
	Carbon for Lua
	#class Math.Quaternion
	#inherits Math.Vector<4>

	#description {
		Provides a quaternion object for representing rotations.
	}
]]

local Carbon = (...)

local Quaternion, except = Carbon.Math.Vector:Generate(4)

if (not Quaternion) then
	if (except.Is[Carbon.Exceptions.CodeGenerationException]) then
		print(except.GeneratedCode)
	end
	
	Carbon.Error(except)
end

return Quaternion