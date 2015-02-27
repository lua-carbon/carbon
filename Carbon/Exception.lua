--[[
	Carbon for Lua
	Exception

	Signals error conditions.
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

function Exception:_init(message)
	self.Message = message or self.Message
end

function Exception:Throw(level)
	error(self.Message, (level or 0) + 1)
end

return Exception