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

local Exception = OOP:Class()
	:Metatable {
		__tostring = function(self)
			return tostring(self.Message)
		end
	}
	:Members {
		Message = "An exception occurred!"
	}

--[[#method {
	Exception Exception:New(string message)
		message: The message to initialize the exception with.

	Creates a new generic exception with the given message.
}]]
function Exception:_init(message)
	self.Message = message or self.Message
end

--[[#method {
	void Exception:Throw(uint? level)
		level: An optional parameter passed onto Lua's error function.

	Throws the exception as a traditional Lua error.
}]]
function Exception:Throw(level)
	error(self.Message, (level or 0) + 1)
end

return Exception