--[[
	Carbon for Lua
	#class Logging

	#description {
		Provides logging facilities.
	}
]]

local Carbon = (...)
local Graphene = Carbon:GetGraphene()

local write = io.write

local Logging = Graphene:MakeImportable {
	ReportingLevel = 2,
	OncedMessages = {},
	OncedNotices = {},
	OncedWarnings = {}
}

function Logging.Message(msg)
	write("MESSAGE: ")
	write(msg)
	write("\n")
end

function Logging.MessageOnce(msg)
	if (Logging.OncedMessages[msg]) then
		return
	end

	Logging.OncedMessages[msg] = true
	Logging.Message(msg)
end

function Logging.Notice(msg)
	write("NOTICE: ")
	write(msg)
	write("\n")
end

function Logging.NoticeOnce(msg)
	if (Logging.OncedNotices[msg]) then
		return
	end

	Logging.OncedNotices[msg] = true
	Logging.Notice(msg)
end

function Logging.Warn(msg)
	write("WARNING: ")
	write(msg)
	write("\n")
end

function Logging.WarnOnce(msg)
	if (Logging.OncedWarnings[msg]) then
		return
	end

	Logging.OncedWarnings[msg] = true
	Logging.Warn(msg)
end

function Logging.Err(msg)
	write("ERROR: ")
	write(msg)
	write("\n")

	error(msg, 2)
end

return Logging