--[[
	Carbon for Lua
	#class Logging

	#description {
		Provides logging facilities.
	}
]]

local Carbon = (...)
local Graphene = Carbon:GetGraphene()

local out = io.stdout

local eol = "\n"
if (Carbon.Support.windows) then
	eol = "\r\n"
end

--[[
	#property public @unumber ReportingLevel {
		The level of messages to report. Messages are always outputted.

		- 0 - Errors only
		- 1 - Errors and warnings
		- 2 - Errors, warnings, and notices
	}
]]
local Logging = Graphene:MakeImportable {
	ReportingLevel = 2,

	OncedMessages = {},
	OncedNotices = {},
	OncedWarnings = {}
}

--[[#method {
	class public Logging.SetOutputHandle(file handle)
		required handle: The file handle to use for logging.t

	Sets a new handle for outputting logs with.
}]]
function Logging.SetOutputHandle(handle)
	out = handle
end

--[[#method {
	class public Logging.Message(@string msg)
		required msg: The message to send.

	Reports a message to the log.
}]]
function Logging.Message(msg)
	out:write("MESSAGE: ")
	out:write(msg)
	out:write(eol)
end

--[[#method {
	class public Logging.MessageOnce(@string msg)
		required msg: The message to send.

	Reports a message to the log, once per message body.
}]]
function Logging.MessageOnce(msg)
	if (Logging.OncedMessages[msg]) then
		return
	end

	Logging.OncedMessages[msg] = true
	Logging.Message(msg)
end

--[[#method {
	class public Logging.Notice(@string msg)
		required msg: The notice to send.

	Reports a notice to the log if `ReportingLevel` >= 2.
}]]
function Logging.Notice(msg)
	if (Logging.ReportingLevel >= 2) then
		out:write("NOTICE: ")
		out:write(msg)
		out:write(eol)
	end
end

--[[#method {
	class public Logging.NoticeOnce(@string msg)
		required msg: The notice to send.

	Reports a notice to the log if `ReportingLevel` >= 2, once per message body.
}]]
function Logging.NoticeOnce(msg)
	if (Logging.OncedNotices[msg]) then
		return
	end

	Logging.OncedNotices[msg] = true
	Logging.Notice(msg)
end

--[[#method {
	class public Logging.Warn(@string msg)
		required msg: The warning to send.

	Reports a warning to the log if `ReportingLevel` >= 1.
}]]
function Logging.Warn(msg)
	if (Logging.ReportingLevel >= 1) then
		out:write("WARNING: ")
		out:write(msg)
		out:write(eol)
	end
end

--[[#method {
	class public Logging.WarnOnce(@string msg)
		required msg: The warning to send.

	Reports a warning to the log if `ReportingLevel` >= 1, once per message body.
}]]
function Logging.WarnOnce(msg)
	if (Logging.OncedWarnings[msg]) then
		return
	end

	Logging.OncedWarnings[msg] = true
	Logging.Warn(msg)
end

--[[#method {
	class public Logging.Warn(@string msg)
		required msg: The error to send.

	Reports an error to the log and throws an error.
}]]
function Logging.Err(msg)
	out:write("ERROR: ")
	out:write(msg)
	out:write(eol)

	error(msg, 2)
end

return Logging