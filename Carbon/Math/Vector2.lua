--[[
	Carbon for Lua
	Vector2 Object

	Provides a 2-length vector with X and Y keys.
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