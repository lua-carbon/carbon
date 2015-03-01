-- Make sure Carbon is in our path
-- Only these examples need to do this
if (not __CARBON_IN_PATH) then
	__CARBON_IN_PATH = true
	package.path = package.path .. ";../?/init.lua"
end

--[[
	Carbon: Advanced OOP: Templates

	Carbon has template parameters to specialize classes.
]]

local Carbon = require("Carbon")
local OOP = Carbon.OOP

-- Implement a vector class using templates
-- Carbon.Math.VectorN is a better implementation of this
-- as it uses inlining and code generation.
local Vector = OOP:Class()
	:Attributes {
		TemplateRequired = true,
		ExplicitInitialization = true
	}

function Vector:_init(...)
	local keys = self.class.__template_arguments
	for i, v in ipairs(keys) do
		self[v] = select(i, ...) or 0
	end
end

-- Create a VectorXY and a class inheriting from that adding Z.
local VectorXY = Vector("X", "Y")
local VectorXYZ = VectorXY("Z")

print("VectorXY is Vector:", VectorXY.Is[Vector]) --> true
print("VectorXYZ is VectorXY:", VectorXYZ.Is[VectorXY]) --> true

local xy = VectorXY:New(5, 6)
local xyz = VectorXYZ:New(7, 8, 9)

print(xy.X, xy.Y) --> 5   6
print(xyz.X, xyz.Y, xyz.Z) --> 7   8   9