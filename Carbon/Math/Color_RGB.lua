--[[
	Carbon for Lua
	RGB Class

	Provides an RGB color class with no alpha.
]]

local Carbon = (...)

local Color = Carbon.Math.Color
local Color_RGB, except = Carbon.Math.VectorN:Generate({"R", "G", "B"})

if (not Color_RGB) then
	if (except.Is[Carbon.Exceptions.CodeGenerationException]) then
		print(except.GeneratedCode)
	end
	
	Carbon.Error(except)
end

Color_RGB:Inherits(Color)

return Color_RGB