--[[
	Carbon for Lua
	#class Math.Vector3
	#inherits Math.Vector<3>

	#description {
		A 3-length vector.

		The loose form of a @Vector3, `@loose<@Vector3>` is of the form `(x, y, z)`.
	}
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