--[[
	Carbon for Lua
	#class Exceptions.NotImplementedException
	#inherits Exception

	#description {
		An exception to be generated when a feature is not (yet) implemented.
	}
]]

local Carbon = (...)

local NotImplementedException = Carbon.OOP:Class()
	:Inherits(Carbon.Exception)
	:Members {
		Message = "Feature not implemented: ",
		MethodName = "[unknown]"
	}

--[[#method {
	NotImplementedException NotImplementedException:New(string method_name)
		method_name: The name of the method that isn't yet implemented.

	Generates a new NotImplementedException for a method with the given name.
}]]
function NotImplementedException:_init(method_name)
	self.MethodName = method_name or self.MethodName
	self.Message = self.Message .. self.MethodName
end

return NotImplementedException