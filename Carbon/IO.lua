--[[
	Carbon for Lua
	IO module
]]

local Carbon = (...)
local GlobalTube = Carbon.Nanotube.Global
local Promise = Carbon.Promise

local IO = {
	ChunkSize = 1024 * 1024 -- One MiB
}

local G = Carbon:GetGrapheneCore()
local love = G.Support.love and love
local io = G.Support.io and io

-- Allow Carbon.IO to use LOVE's IO
local io_open
if (love) then
	function io_open(filename, mode)
		return love.filesystem.newFile(filename, mode or "r") or io.open(filename, mode)
	end
elseif (io) then
	io_open = io.open
else
	-- Bail, return a fake module that throws errors
	local function die()
		error("Carbon.IO requires one or more IO backends: love, io", 3)
	end

	local fake = {}
	setmetatable(fake, {
		__index = die
	})

	return fake
end

--[[
	File IO.Open(string path, [string mode, Nanotube tube])
		path: The path to the file to open.
		mode: The file mode to open the file with. Defaults to "rb".
		tube: The Nanotube object to cycle file events through with asynchronous I/O calls on this file.

	Opens a new File object.
]]
function IO.Open(path, mode, tube)
	local handle, err = io_open(path, mode)

	if (not handle) then
		return handle, err
	end

	local file = {
		__handle = handle,
		__tube = tube or GlobalTube
	}

	setmetatable(file, {
		__index = IO
	})

	return file
end

--[[
	Promise<string> IO.ReadFileAsync(string path, [Nanotube tube])
		path: The path to the file to read.
		tube: The Nanotube object to cycle events through. Defaults to the global tube.

	Opens a file by a path and returns its contents.
]]
function IO.ReadFileAsync(path, tube)
	local promise = Promise:New()
	local file, err = IO.Open(path, "rb", tube)

	if (not file) then
		promise:Reject(err)

		return promise
	end

	file:ReadAsync():Then(function(...)
		promise:Resolve(...)
	end)

	return promise
end

--[[
	void IO.Close(File self)
	void File:Close()
	
	Closes the file.
]]
function IO.Close(self)
	return self.__handle:close()
end

--[[
	string IO.Read(File self)
	string File:Read()

	Reads the entire contents of the file.
]]
function IO.Read(self, ...)
	return self.__handle:read(...)
end

--[[
	void IO.Write(File self, string contents)
	string File:Write(string contents)
		contents: The file contents

	Writes to the file.
]]
function IO.Write(self, ...)
	return self.__handle:write(...)
end

--[[
	Promise<string[]> IO.ReadBufferAsync(File self, [string[] into])
	Promise<string[]> File:ReadBufferAsync([string[] into])
		into: A list to write the output into instead of creating a new buffer.

	Reads a file and amortizes its loading through an event loop.
	Returns the raw buffer, containing a series of strings.
]]
function IO.ReadBufferAsync(self, into)
	local promise = Promise:New()
	local buffer = into or {}

	self.__tube:On("Step", function()
		local chunk = self.__handle:read(IO.ChunkSize)

		if (chunk) then
			table.insert(buffer, chunk)
		else
			promise:Resolve(buffer)

			return "unhook"
		end
	end)

	return promise
end

--[[
	Promise<string> IO.ReadBufferAsync(File self)
	Promise<string> File:ReadBufferAsync()

	Reads a file and amortizes its loading through an event loop.
]]
function IO.ReadAsync(self)
	return IO.ReadBufferAsync(self):Then(table.concat)
end

return IO