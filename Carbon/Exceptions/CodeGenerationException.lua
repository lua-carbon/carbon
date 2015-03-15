--[[
	Carbon for Lua
	#class Exceptions.CodeGenerationException
	#inherits Exception

	#description {
		An exception to be generated when generation of code fails.
	}
]]

local Carbon = (...)

--[[
	#property string CodeGenerationException.Message {
		Contains a message about what went wrong generating code.
	}

	#property string CodeGenerationException.GeneratedCode {
		Contains the code that was generated and failed to meet the criteria.
	}
]]
local CodeGenerationException = Carbon.OOP:Class()
	:Inherits(Carbon.Exception)
	:Members {
		Message = "Code generation failed: ",
		GeneratedCode = "[none]"
	}

--[[#method {
	CodeGenerationException CodeGenerationException:New(string message, string code)
		message: A message explaining why code generation failed.
		code: The code that was generated.

	Denotes that code generation failed in a metaprogramming-enabled module.
}]]
function CodeGenerationException:_init(message, code)
	self.GeneratedCode = code
	self.Message = self.Message .. message
end

return CodeGenerationException