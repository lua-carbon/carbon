--[[
	Carbon for Lua
	#class Math.ColorRGB
	#inherits Math.Color, Math.Vector<3>

	#description {
		Provides an RGB color class with no alpha.
	}
]]

local Carbon = (...)

local Color = Carbon.Math.Color
local ColorRGB, except = Carbon.Math.Vector:Generate(3)

if (not ColorRGB) then
	if (except.Is[Carbon.Exceptions.CodeGenerationException]) then
		print(except.GeneratedCode)
	end
	
	Carbon.Error(except)
end

ColorRGB:Inherits(Color)

return ColorRGB