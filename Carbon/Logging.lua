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

local Logging = Graphene:MakeImportable {
	ReportingLevel = 2,
	OncedMessages = {},
	OncedNotices = {},
	OncedWarnings = {}
}

function Logging.SetOutputHandle(handle)
	out = handle
end

function Logging.Message(msg)
	out:write("MESSAGE: ")
	out:write(msg)
	out:write(eol)
end

function Logging.MessageOnce(msg)
	if (Logging.OncedMessages[msg]) then
		return
	end

	Logging.OncedMessages[msg] = true
	Logging.Message(msg)
end

function Logging.Notice(msg)
	out:write("NOTICE: ")
	out:write(msg)
	out:write(eol)
end

function Logging.NoticeOnce(msg)
	if (Logging.OncedNotices[msg]) then
		return
	end

	Logging.OncedNotices[msg] = true
	Logging.Notice(msg)
end

function Logging.Warn(msg)
	out:write("WARNING: ")
	out:write(msg)
	out:write(eol)
end

function Logging.WarnOnce(msg)
	if (Logging.OncedWarnings[msg]) then
		return
	end

	Logging.OncedWarnings[msg] = true
	Logging.Warn(msg)
end

function Logging.Err(msg)
	out:write("ERROR: ")
	out:write(msg)
	out:write(eol)

	error(msg, 2)
end

return Logging