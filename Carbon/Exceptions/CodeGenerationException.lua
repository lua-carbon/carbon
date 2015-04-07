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
	#property public string Message {
		Contains a message about what went wrong generating code.
	}

	#property public string GeneratedCode {
		Contains the code that was generated and failed to meet the criteria.
	}
]]
local CodeGenerationException = Carbon.OOP:Class()
	:Inherits(Carbon.Exception)
	:Members {
		Message = "Code generation failed: ",
		GeneratedCode = "[none]"
	}

--[[#method 1 {
	$typical_constructor(CodeGenerationException(@string message, @string code))
		required message: A message explaining why code generation failed.
		required code: The code that was generated.

	Denotes that code generation failed in a metaprogramming-enabled module.
}]]
function CodeGenerationException:Init(message, code)
	self.GeneratedCode = code
	self.Message = self.Message .. message
end

return CodeGenerationException