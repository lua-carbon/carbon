--[[
	Carbon for Lua
	#class IO
	
	#description {
		Provides async and sync I/O operations that work on multiple platforms.
	}

	#class IO.File

	#description {
		Exposes object-oriented filesystem access. See @IO for more methods.
	}

	#alias File IO.File
	#class IO
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

--[[#method 1 {
	class public @File IO.Open(@string path, [@string mode, @Nanotube tube])
		required path: The path to the file to open.
		optional mode: The file mode to open the file with. Defaults to "rb".
		optional tube: The Nanotube object to cycle file events through with asynchronous I/O calls on this file.

	Opens a new @File object.
}]]
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

--[[#method {
	class public @Promise<string> IO.ReadFileAsync(@string path, [@Nanotube tube])
		required path: The path to the file to read.
		optional tube: The Nanotube object to cycle events through. Defaults to the global tube.

	Opens a file by a path and returns its contents through a @Promise.
}]]
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

--[[#method {
	class public @void IO.Close(@File self)
	-alias IO.File: object public @void File:Close()
	
	Closes the file.
}]]
function IO.Close(self)
	return self.__handle:close()
end

--[[#method {
	class public @string IO.Read(@File self)
	-alias IO.File: object public @void File:Read()

	Reads the entire contents of the file.
}]]
function IO.Read(self, ...)
	return self.__handle:read(...)
end

--[[#method {
	class public @void IO.Write(@File self, @string contents)
	-alias IO.File: object public @void File:Write(@string contents)
		required contents: The file contents

	Writes to the file.
}]]
function IO.Write(self, ...)
	return self.__handle:write(...)
end

--[[#method {
	class public @Promise<@list<@string>> IO.ReadBufferAsync(@File self, [@list<@string> into])
	-alias IO.File: object public @Promise<@list<@string>> File:ReadBufferAsync([@list<@string> into])
		optional into: A list to write the output into instead of creating a new buffer.

	Reads a file and amortizes its loading through an event loop.
	Returns the raw buffer, containing a series of strings.
}]]
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

--[[#method {
	class public @Promise<@string> IO.ReadBufferAsync(File self)
	-alias IO.File: object public @Promise<@string> File:ReadBufferAsync()

	Reads a file and amortizes its loading through an event loop.
	The same as `File:ReadAsync()`
}]]
function IO.ReadAsync(self)
	return IO.ReadBufferAsync(self):Then(table.concat)
end

return IO