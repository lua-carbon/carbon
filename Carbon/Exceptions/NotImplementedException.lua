--[[
	Carbon for Lua
	#class Exceptions.NotImplementedException
	#inherits Exception

	#description {
		An exception to be generated when a feature is not (yet) implemented.
	}
]]

local Carbon = (...)

--[[
	#property public string MethodName {
		The name of the method that isn't implemented.
	}
]]
local NotImplementedException = Carbon.OOP:Class()
	:Inherits(Carbon.Exception)
	:Members {
		Message = "Feature not implemented: ",
		MethodName = "[unknown]"
	}

--[[#method 1 {
	$typical_constructor(NotImplementedException(@string method_name))
		required method_name: The name of the method that isn't yet implemented.

	Generates a new @NotImplementedException for a method with the given name.
}]]
function NotImplementedException:Init(method_name)
	self.MethodName = method_name or self.MethodName
	self.Message = self.Message .. self.MethodName
end

return NotImplementedException