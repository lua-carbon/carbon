--[[
	Carbon for Lua
	RGBA Class

	Provides an RGB color class with alpha.
]]

local Carbon = (...)

local Color = Carbon.Math.Color
local Color_RGBA, except = Carbon.Math.VectorN:Generate({"R", "G", "B", "A"})

if (not Color_RGBA) then
	if (except.Is[Carbon.Exceptions.CodeGenerationException]) then
		print(except.GeneratedCode)
	end
	
	Carbon.Error(except)
end

Color_RGBA:Inherits(Color)

return Color_RGBA