--[[
	Carbon for Lua
	#class Exceptions.SyntaxErrorException
	#inherits Exception

	#description {
		An exception to be generated when a syntax error is encountered
	}
]]

local Carbon = (...)

--[[
	#property public string Line {
		The line the syntax error occured on, approximately.
	}
]]
local SyntaxErrorException = Carbon.OOP:Class()
	:Inherits(Carbon.Exception)
	:Members {
		Message = "Syntax error: ",
		Line = 1
	}

--[[#method 1 {
	$typical_constructor(SyntaxErrorException(@string err, [@unumber line]))
		required err: The reason for the error.
		optional line: The line the error was found on. Defaults to 1.

	Generates a new @SyntaxErrorException for a given syntax error.
}]]
function SyntaxErrorException:Init(err, line)
	self.Message = self.Message .. (err or "[unknown]")
	self.Line = line or self.Line
end

return SyntaxErrorException