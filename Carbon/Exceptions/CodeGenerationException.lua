--[[
	Carbon for Lua
	CodeGenerationException

	Should be thrown when generation of code fails.
]]

local Carbon = (...)

local CodeGenerationException = Carbon.OOP:Class()
	:Inherits(Carbon.Exception)
	:Members {
		Message = "Code generation failed: ",
		GeneratedCode = "[none]"
	}

function CodeGenerationException:_init(message, code)
	self.GeneratedCode = code
	self.Message = self.Message .. message
end

return CodeGenerationException