--[[
	Carbon for Lua
	NotImplementedException
]]

local Carbon = (...)

local NotImplementedException = Carbon.OOP:Class()
	:Inherits(Carbon.Exception)
	:Members {
		Message = "Feature not implemented: ",
		MethodName = "[unknown]"
	}

function NotImplementedException:_init(method_name)
	self.MethodName = method_name or self.MethodName
	self.Message = self.Message .. self.MethodName
end

return NotImplementedException