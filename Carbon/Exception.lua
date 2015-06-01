--[[
	Carbon for Lua
	#class Exception
	#inherits OOP.Object

	#description {
		Signals detailed, strongly-typed error conditions.
	}
]]

local Carbon = (...)
local OOP = Carbon.OOP

--[[
	#property public @string Exception.Message {
		An error message explaining the exception.
	}
]]
local Exception = OOP:Class()
	:Metatable {
		__tostring = function(self)
			return tostring(self.Message)
		end
	}
	:Members {
		Message = "An exception occurred!"
	}

--[[#method 1 {
	$typical_constructor(Exception(@string message))
		required message: The message to initialize the exception with.

	Creates a new generic exception with the given message.
}]]
function Exception:Init(message)
	self.Message = message or self.Message
end

--[[#method {
	object public @void Exception:Throw([@uint level])
		optional level: An optional parameter passed onto Lua's error function.

	Throws the exception as a traditional Lua error.
}]]
function Exception:Throw(level)
	error(self.Message, (level or 0) + 1)
end

--[[#method {
	object public @void Exception:ThrowIf(@bool condition, [@uint level])
		required condition: The condition determining whether this exception should throw.
		optional level: Passed onto Lua's error method determining the level of the error.

	Throws the exception if a given condition is truthy. Similar to Lua's `assert`.
}]]
function Exception:ThrowIf(condition, level)
	if (condition) then
		self:Throw(level)
	end
end

return Exception