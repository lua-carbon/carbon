--[[
	Carbon for Lua
	#class Math.Vector4
	#inherits Math.Vector<4>

	#description {
		A 4-length vector.

		The loose form of a @Vector4, `@loose<@Vector4>` is of the form `(x, y, z, w)`.
	}
]]

local Carbon = (...)

local Vector4, except = Carbon.Math.Vector:Generate(4)

if (not Vector4) then
	if (except.Is[Carbon.Exceptions.CodeGenerationException]) then
		print(except.GeneratedCode)
	end
	
	Carbon.Error(except)
end

return Vector4