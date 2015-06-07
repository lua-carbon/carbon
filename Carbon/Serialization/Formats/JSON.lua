--[[
	Carbon for Lua
	#class Serialization.Formats.JSON
	#inherits OOP.Object

	#description {
		**Static**

		A class describing how to serialize data to JSON.
	}
]]

local Carbon = (...)
local OOP = Carbon.OOP
local Format = Carbon.Serialization.Format

local JSON = OOP:StaticClass()
	:Inherits(Format)

return JSON