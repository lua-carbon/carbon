--[[
	Carbon for Lua
	#class Math.Vector2
	#inherits Math.Vector<2>

	#description {
		A 2-length vector.

		The loose form of a @Vector2, `@loose<@Vector2>` is of the form `(x, y)`.
	}
]]

local Carbon = (...)

local Vector2, except = Carbon.Math.Vector:Generate(2)

if (not Vector2) then
	if (except.Is[Carbon.Exceptions.CodeGenerationException]) then
		print(except.GeneratedCode)
	end
	
	Carbon.Error(except)
end

return Vector2