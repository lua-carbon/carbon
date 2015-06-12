--[[
	Graphene 1.1.11
	https://github.com/lua-carbon/graphene
]]

if (type((...)) ~= "string") then
	return
end

-- Current graphene version
local g_version = {1, 1, 11}
local g_versionstring = ("%s.%s.%s%s%s"):format(
	g_version[1],
	g_version[2],
	g_version[3],
	g_version[4] and "-" or "",
	g_version[4] or ""
)

-- Determine Lua capabilities and library support
local support = {}

--[[
	string Support:Report()

	Generates a stringified report of supported features and extensions.
]]
function support:Report()
	local features = {}

	for feature, enabled in pairs(self) do
		if (type(enabled) == "table" and enabled.Report) then
			table.insert(features, enabled:Report())
		elseif (type(enabled) ~= "function") then
			table.insert(features, feature)
		end
	end

	return table.concat(features, ", ")
end

-- Do we have LFS?
local lfs
if (not NO_LFS) then
	local ok
	ok, lfs = pcall(require, "lfs")
	if (not ok) then
		lfs = nil
	end
end

local ok, ffi = pcall(require, "ffi")
if (not ok) then
	ffi = nil
end

-- What Lua are we running under?
-- For our purposes, 5.3 is a superset of 5.2.
if (table.unpack) then
	support.lua52 = true

	if (table.move) then
		support.lua53 = true
	end
else
	support.lua51 = true
end

-- LuaJIT 2.0+
-- Also check for OS in this path.
if (jit) then
	support.jit = true -- Deprecated in Graphene 1.1.9
	support.luajit = true

	if (jit.os == "Windows") then
		support.windows = true
	else
		support.nix = true
	end
else
	local win = package.config:sub(1, 1) == "\\"

	if (win) then
		support.windows = true
	else
		support.nix = true
	end
end

-- FFI
if (ffi) then
	support.ffi = true
end

-- LuaFileSystem
if (lfs) then
	support.lfs = true
end

-- Lua debug library
if (debug) then
	support.debug = true
end

-- Lua os library
if (os) then
	support.os = true
end

-- Lua io library
if (io) then
	support.io = true
end

-- {% if (support.love) then %}
-- Are we running in LOVE?
if (love) then
	support.love = {}

	-- return a nice report of the current LOVE version
	function support.love:Report()
		return ("love %d.%d.%d (%s)"):format(unpack(self.Version))
	end

	if (love.getVersion) then
		-- LOVE 0.9.1+
		support.love.Version = {love.getVersion()}
	else
		-- LOVE 0.9.0 and older; may be supported
		local major = love._version_major
		local minor = love._version_minor

		if (major == 0) then
			if (minor == 9) then
				-- Definitely 0.9.0
				support.love.Version = {0, 9, 0, "Baby Inspector"}
			else
				-- 0.8.0 and older; definitely not supported
				support.love = false
			end
		else
			-- What *IS* LOVE?
			support.love = false
		end
	end
end
-- {% end %}

-- Cross-version shims
local unpack = unpack or table.unpack

--[[
	loaded load_with_env(string source, table environment)
		source: The source code to compile into a function.
		environment: The environment to load the function into.

	Loads a function with a given environment.
	Essentially backports Lua 5.2's load function to LuaJIT and Lua 5.1.
]]
local load_with_env

if (support.lua51) then
	function load_with_env(source, from, environment)
		environment = environment or getfenv()
		local chunk, err = loadstring(source, from)

		if (not chunk) then
			return chunk, err
		end

		setfenv(chunk, environment)

		return chunk
	end
elseif (support.lua52) then
	function load_with_env(source, from, environment)
		return load(source, from, nil, environment or _ENV)
	end
end

if (support.jit) then
	support.xpcallargs = true
end

-- Find out a path for the directory above graphene
local g_root
local g_file = support.debug and debug.getinfo(1, "S").source:match("@(.+)$")

if (g_file) then
	-- Normalize slashes; this is okay for Windows
	g_root = g_file:gsub("\\", "/"):match("^(.+)/.-$") or "./"
else
	g_root = (...):gsub("graphene$", ""):gsub("%.init$", ""):gsub("%.", "/")

	if (g_root == "") then
		g_root = "./"
	end
end

-- Contains our actual core
local G = {
	__default_import_exceptions = {},
	__safe = false, -- Suppress loading errors
	__load_callback = nil, -- User-specified callback for hooking into module loads.
	__error_callback = nil, -- User-specified callback for handling errors.
	__loaded = {}, -- Dictionary of loaded modules for caching
	__submodules = {}, -- Contains submodule information

	Support = support, -- Table for fast support lookups
	Version = g_version, -- Version table for programmatic comparisons
	VersionString = g_versionstring, -- Version string for user-facing reporting

	-- Filesystem abstraction
	FS = {
		Providers = {}
	},

	-- Metadata API
	Metadata = {
		__store = setmetatable({}, {__mode = "k"}),
		Enabled = true
	},

	-- Configuration
	Config = {
		Lib = true,
		Loaders = {
			[".lua"] = load_with_env
		},
		InitFile = "_"
	}
}

-- Utility Methods

--[[
	(string module, bool is_directory) file_to_module(string source)
		source: The file path to be turned into a module path.

	Takes a file path (a/b/c or a/b/c.ext) and turns it into a well-formed module path.
	Also returns whether the file is most likely a directory object or not.
]]
local function file_to_module(source)
	local fsource = source:gsub("%..-$", "")
	local is_file = (fsource ~= source)
	return (fsource:gsub("[/\\]+", "."):gsub("^%.*", ""):gsub("%.*$", "")), is_file
end

--[[
	string module_join(string first, string second)
		first: The first part of the path.
		second: The second part of the path.

	Joins two module names with a period and removes any extraneous periods.
]]
local function module_join(first, second)
	return ((first .. "." .. second):gsub("%.%.+", "."):gsub("^%.+", ""):gsub("%.+$", ""))
end

--[[
	string path_join(string first, string second)
		first: The first part of the path.
		second: The second part of the path.

	Joins two path names with a period and removes any extraneous slashes.
]]
local function path_join(first, second)
	return ((first .. "/" .. second):gsub("//+", "/"):gsub("/+$", ""))
end

--[[
	string path_to_filepath(string path)
		path: The path to transform

	Turns a period-delimitted string into a slash-delimitted string.
]]
local function path_to_filepath(path)
	return (path:gsub("%.", "/"):gsub("//+", "/"))
end

--[[
	string[] file_paths(string name, [bool is_directory, string[] paths])
		name: The path to transform
		is_directory: Whether or not this points to a directory
		paths: A list of paths to search for files in. Similar to a system PATH variable.

	Create a list of all acceptable file paths for a module path on a real filesystem.
]]
local function file_paths(name, is_directory, paths)
	local paths = paths or {""}
	local filename = path_to_filepath(name)
	local result = {}

	local extensions

	-- Get a list of extensions from G.Config.Loaders
	if (is_directory) then
		extensions = {""}
	else
		extensions = {}
		local loaders = G.Config.Loaders
		for key, value in pairs(loaders) do
			table.insert(extensions, key)
		end
	end

	-- For every combination of path and extension, toss into the list.
	for i, path in ipairs(paths) do
		for j, extension in ipairs(extensions) do
			table.insert(result, path_join(path, filename) .. extension)
		end
	end

	return result
end

--[[
	function? loader_for_filepath(string filepath)
		filepath: The path to a file on a real filesystem.

	Returns a function capable of loading the given filepath.
]]
local function loader_for_filepath(filepath)
	for name, loader in pairs(G.Config.Loaders) do
		if (filepath:sub(-#name) == name) then
			return loader
		end
	end

	-- We couldn't find a loader
	return nil
end

--[[
	table dictionary_deep_copy(table from, [table to])
		from: The table to source data from.
		to: The table to copy data into.

	Performs a deep copymerge from one table to another.
]]
local function dictionary_deep_copy(from, to)
	to = to or {}

	for key, value in pairs(from) do
		if (type(value) == "table") then
			to[key] = dictionary_deep_copy(value)
		else
			to[key] = value
		end
	end

	return to
end

--[[
	table dictionary_deep_copymerge(table from, [table to])
		from: The table to source data from.
		to: The table to copy data into.

	Performs a deep copymerge from one table to another.
]]
local function dictionary_deep_copymerge(from, to)
	to = to or {}

	for key, value in pairs(from) do
		if (to[key] == nil) then
			if (type(value) == "table") then
				to[key] = dictionary_deep_copy(value)
			else
				to[key] = value
			end
		end
	end

	return to
end

--[[
	table dictionary_shallow_copy(table from, [table to])
		from: The table to source data from.
		to: The table to copy data into.

	Performs a shallow copy from one table to another.
]]
local function dictionary_shallow_copy(from, to)
	to = to or {}

	for key, value in pairs(from) do
		to[key] = value
	end

	return to
end

--[[
	table dictionary_shallow_merge(table from, table to)
		from: The table to source data from.
		to: The table to copy data into.

	Performs a shallow copy from one table to another without overwriting keys.
]]
local function dictionary_shallow_merge(from, to)
	to = to or {}

	for key, value in pairs(from) do
		if (to[key] == nil) then
			to[key] = value
		end
	end

	return to
end

--[[
	void import_dict(table source)
		source: The dictionary containing data to import

	Imports a dictionary (like a namespace).
]]
local import_dict
if (support.lua51) then
	function import_dict(source, level, list, is_white)
		level = level and level + 2 or 2

		if (is_white) then
			local white = list
			list = {}
			for key, value in pairs(source) do
				if (not white[key]) then
					list[key] = true
				end
			end
		else
			list = list or {}
		end

		local cenv = getfenv(level)

		if (cenv == _G) then
			cenv = setmetatable({}, {__index = _G})
			setfenv(level, cenv)
		end

		for key, value in pairs(source) do
			if (not list[key]) then
				cenv[key] = value
			end
		end
	end
elseif (support.debug) then
	function import_dict(source, level, list, is_white)
		level = level and level + 2 or 2
		
		if (is_white) then
			local white = list
			list = {}
			for key, value in pairs(source) do
				if (not white[key]) then
					list[key] = true
				end
			end
		else
			list = list or {}
		end

		local func = debug.getinfo(level).func
		local i = 1
		local name, cenv = debug.getupvalue(func, 1)

		if (name ~= "_ENV") then
			while (true) do
				local name, value = debug.getlocal(func, i)
				if (not name) then
					break
				end
				if (name == "_ENV") then
					cenv = value
					break
				end
				i = i + 1
			end
		end

		if (not cenv) then
			error("Couldn't locate _ENV upvalue, tell LPGhatguy on GitHub!")
		end

		if (cenv == _G) then
			cenv = setmetatable({}, {__index = _G})
			debug.setupvalue(func, i, cenv)
		end

		for key, value in pairs(source) do
			if (not list[key]) then
				cenv[key] = value
			end
		end
	end
else
	function import_dict()
		error("Importing requires Lua 5.1, or Lua 5.2+ with the debug library enabled!", 2)
	end
end

-- xpcall with argument passing
local xpcallargs
if (support.xpcallargs) then
	xpcallargs = xpcall
else
	xpcallargs = function(method, errhand, ...)
		local varg = {...}

		return xpcall(function()
			return method((unpack or table.unpack)(varg))
		end, errhand)
	end
end

-- Filesystem Abstractions

--[[
	File? FS:GetFile(string path)
		path: The file to find a provider for.

	Returns the file from whatever filesystem provider it's located on.
]]
function G.FS:GetFile(path)
	for i, provider in ipairs(self.Providers) do
		if (provider.GetFile) then
			local file = provider:GetFile(path)

			if (file) then
				return file
			end
		end
	end

	return nil
end

--[[
	directory? FS:GetDirectory(string path)
		path: The directory to find a provider for.

	Returns the directory from whatever filesystem provider it's located on.
]]
function G.FS:GetDirectory(path)
	for i, provider in ipairs(self.Providers) do
		if (provider.GetDirectory) then
			local directory = provider:GetDirectory(path)

			if (directory) then
				return directory
			end
		end
	end

	return nil
end

--[[
	provider? FS:GetProvider(string id)
		id: The ID of the FS provider to search for.

	Returns the provider with the given ID if it exists.
]]
function G.FS:GetProvider(id)
	for i, provider in ipairs(self.Providers) do
		if (provider.ID == id) then
			return provider
		end
	end

	return nil
end

--[[
	Filesystem provider schema:

	Provider.ID
		An ID to look up the provider with.

	Provider.Name
		A friendly name to describe the provider.

	Provider.Path (LOVE and vanilla IO only)
		Similar to a system PATH, where the provider looks for files.

	Returns whether the specified path exists on this filesystem provider.

	File Provider:GetFile(string path)
		path: The module path to check.

		Returns a file object corresponding to the given file on this filesystem.

		Returns whether the specified path exists on this filesystem provider.

	Directory Provider:GetDirectory(string path)
		path: The module path to check.

		Returns a directory object corresponding to the given directory on this filesystem.

	string File:Read()
		contents: The complete contents of the file.

		Reads the entire file into a string and returns it.

	void File:Close()
	
		Closes the file, allowing it to be reused by the system.

	string[] Directory:List()
		files: The files and folders contained in this directory.

		Returns a list of files contained in the directory.

	void Directory:Close()
	
		Closes the directory, allowing it to be reused by the system.
]]

-- {% if (support.love) then %}
-- LOVE filesystem provider
if (support.love) then
	local love_fs = {
		ID = "love",
		Name = "LOVE Filesystem",
		Path = {g_root}
	}

	table.insert(G.FS.Providers, love_fs)

	local file_buffer = {}
	local directory_buffer = {}

	local is_file = love.filesystem.isFile
	local is_directory = love.filesystem.isDirectory

	local function file_close(self)
		table.insert(file_buffer, self)
	end

	local function file_read(self)
		return love.filesystem.read(self.FilePath)
	end

	local function directory_close(self)
		table.insert(directory_buffer, self)
	end

	local function directory_list(self)
		local items = love.filesystem.getDirectoryItems(self.FilePath)

		for i = 1, #items do
			items[i] = file_to_module(items[i])
		end

		return items
	end

	function love_fs:GetFile(path, global_loader)
		local paths = file_paths(path, false, self.Path)

		for i, filepath in ipairs(paths) do
			filepath = filepath:gsub("^%./", "")

			if (is_file(filepath)) then
				local loader = global_loader or loader_for_filepath(filepath)

				local file = file_buffer[#file_buffer]
				file_buffer[#file_buffer] = nil

				if (file) then
					file.Path = path
					file.FilePath = filepath
					file.Loader = loader

					return file
				else
					return {
						Close = file_close,
						Read = file_read,
						Path = path,
						FilePath = filepath,
						FSID = self.ID,
						Loader = loader
					}
				end
			end
		end
	end

	function love_fs:GetDirectory(path)
		local paths = file_paths(path, true, self.Path)

		for i, filepath in ipairs(paths) do
			filepath = filepath:gsub("^%./", "")
			
			if (is_directory(filepath)) then
				local directory = directory_buffer[#directory_buffer]
				directory_buffer[#directory_buffer] = nil

				if (directory) then
					directory.Path = path
					directory.FilePath = filepath

					return directory
				else
					return {
						Close = directory_close,
						List = directory_list,
						Path = path,
						FilePath = filepath,
						FSID = self.ID
					}
				end
			end
		end
	end
end
-- {% end %}

-- {% if (support.io) then %}

-- Only support the full filesystem if we have IO
-- No FullyLoad method without LFS
-- FS provider to read from the actual filesystem
if (support.io and (not support.love or USE_IO)) then
	local full_fs = {
		ID = "io",
		Name = "Full Filesystem",
		Path = {g_root}
	}

	table.insert(G.FS.Providers, full_fs)

	-- Provider is_directory and is_file fallbacks for systems without LFS.
	local is_directory
	local is_file

	if (support.lfs) then
		function is_file(path)
			return (lfs.attributes(path, "mode") == "file")
		end

		function is_directory(path)
			return (lfs.attributes(path, "mode") == "directory")
		end
	else
		-- Reduced file functionality without LFS
		function is_file(path)
			local handle = io.open(path, "r")

			if (handle) then
				handle:close()

				return true
			end

			return false
		end

		local execute_success
		if (support.ffi and support.windows) then
			ffi.cdef([[
				typedef struct _iobuf FILE;
				FILE* _popen(const char* command, const char* mode);
				int _pclose(FILE* stream);
			]])

			function execute_success(cmd)
				local f = ffi.C._popen(cmd, "rb")
				return (ffi.C._pclose(f) == 0)
			end
		elseif (support.lua51) then
			function execute_success(cmd)
				return os.execute(cmd) == 0
			end
		else
			function execute_success(cmd)
				return os.execute(cmd)
			end
		end

		if (support.windows) then
			function is_directory(path)
				return execute_success(("cd %q 1>nul 2>nul"):format(path))
			end
		else
			function is_directory(path)
				return execute_success(("stat %q >/dev/null"):format(path))
			end
		end
	end

	local file_buffer = {}
	local directory_buffer = {}

	-- File:Close() method
	local function file_close(self)
		table.insert(file_buffer, self)
	end

	-- File:Read() method
	local function file_read(self)
		local handle, err = io.open(self.FilePath, "r")

		if (handle) then
			local body = handle:read("*a")
			handle:close()

			return body
		else
			return nil, err
		end
	end

	-- Directory:Close() method
	local function directory_close(self)
		table.insert(directory_buffer, self)
	end

	-- Directory:List() method
	local function directory_list(self)
		if (not support.lfs) then
			error("Cannot list directory without LFS!", 2)
		end

		local paths = {}

		for name in lfs.dir(self.FilePath) do
			if (name ~= "." and name ~= "..") then
				table.insert(paths, (file_to_module(name)))
			end
		end

		return paths
	end

	function full_fs:GetFile(path, global_loader)
		local paths = file_paths(path, false, self.Path)

		for i, filepath in ipairs(paths) do
			if (is_file(filepath)) then
				local loader = global_loader or loader_for_filepath(filepath)

				local file = file_buffer[#file_buffer]
				file_buffer[#file_buffer] = nil

				if (file) then
					file.Path = path
					file.FilePath = filepath
					file.Loader = loader

					return file
				else
					return {
						Close = file_close,
						Read = file_read,
						Path = path,
						FilePath = filepath,
						FSID = self.ID,
						Loader = loader
					}
				end
			end
		end
	end

	-- Returns a directory object
	function full_fs:GetDirectory(path)
		local paths = file_paths(path, true, self.Path)

		for i, filepath in ipairs(paths) do
			if (is_directory(filepath)) then
				local directory = directory_buffer[#directory_buffer]
				directory_buffer[#directory_buffer] = nil

				if (directory) then
					directory.Path = path
					directory.FilePath = filepath

					return directory
				else
					return {
						Close = directory_close,
						List = directory_list,
						Path = path,
						FilePath = filepath,
						FSID = self.ID
					}
				end

				break
			end
		end
	end
end
-- {% end %}

-- {% if (support.vfs) then %}
-- Virtual Filesystem for Graphene
-- Used when packing for platforms that don't have real filesystem access

-- The internal VFS is deprecated as of Graphene 1.1.9
do
	local vfs = {
		ID = "vfs",
		Name = "Virtual Filesystem",
		Enabled = false,

		Nodes = {},
		Directory = true
	}

	table.insert(G.FS.Providers, vfs)

	local function is_file(path)
		if (not vfs.Enabled) then
			return false
		end

		local object = vfs:Navigate(path)

		return (object and object.File)
	end

	local function is_directory(path)
		if (not vfs.Enabled) then
			return false
		end

		local object = vfs:Navigate(path)

		return (object and object.Directory)
	end

	-- File:Read() method
	local function file_read(self)
		return self._contents
	end

	-- File:Close() method
	-- a stub, since this doesn't apply to a VFS
	local function file_close()
	end

	-- Directory:List() method
	local function directory_list(self)
		local list = {}

		for name in pairs(self._nodes) do
			table.insert(list, name)
		end

		return list
	end

	-- Directory:Close() method
	-- a stub, since this doesn't apply to a VFS
	local function directory_close()
	end

	-- Clears the entire VFS.
	function vfs:Clear()
		self.Nodes = {}
	end

	-- Starts at a root node and navigates according to a module name
	-- Add auto_dir to automatically create directories
	-- If the path does not exist, or cannot be reached due to an invalid node,
	-- the function will return nil, the furthest location reached, and a list of node names navigated.
	function vfs:Navigate(path, auto_dir)
		local location = self
		local nodes = {}

		for node in path:gmatch("[^%.]+") do
			if (not location.Nodes) then
				return nil, location, nodes
			end

			if (location.Nodes[node]) then
				location = location.Nodes[node]
				table.insert(nodes, node)
			elseif (auto_dir) then
				table.insert(nodes, node)
				location = vfs:AddDirectory(table.concat(nodes, "."))
			else
				return nil, location, nodes
			end
		end

		return location
	end

	-- Performs string parsing and navigates to the parent node of a given path
	function vfs:LeafedNavigate(path, auto_dir)
		local leafless, leaf = path:match("^(.-)%.([^%.]+)$")

		if (leafless) then
			local parent = self:Navigate(leafless, auto_dir)

			-- Couldn't get there! Ouch!
			if (not parent) then
				return nil, ("Could not navigate to parent node '%s': invalid path"):format(leafless)
			end

			if (not parent.Directory) then
				return nil, ("Could not create node in node '%s': not a directory"):format(leafless)
			end

			return parent, leafless, leaf
		else
			leafless = ""
			leaf = path

			return self, leafless, leaf
		end
	end

	function vfs:GetFile(path, global_loader)
		if (not self.Enabled) then
			return false
		end

		local object = self:Navigate(path)

		if (object and object.File) then
			return {
				_contents = object.Contents,
				Read = file_read,
				Close = file_close,
				Path = path,
				FSID = self.ID,
				Loader = global_loader or object.Loader or load_with_env
			}
		end
	end

	function vfs:AddFile(path, contents, loader)
		self.Enabled = true
		loader = loader or load_with_env
		local parent, leafless, leaf = self:LeafedNavigate(path, true)

		-- leafless contains error state if parent is nil
		if (not parent) then
			return nil, leafless
		end

		local node = {
			File = true,
			Contents = contents,
			Loader = loader
		}

		parent.Nodes[leaf] = node

		return node
	end

	function vfs:GetDirectory(path)
		if (not self.Enabled) then
			return false
		end

		local object = self:Navigate(path)

		if (object and object.Directory) then
			return {
				_nodes = object.Nodes,
				List = directory_list,
				Close = directory_close,
				Path = path,
				FSID = self.ID
			}
		end
	end

	function vfs:AddDirectory(path)
		self.Enabled = true
		local parent, leafless, leaf = self:LeafedNavigate(path, true)

		-- leafless contains error state if parent is nil
		if (not parent) then
			return nil, leafless
		end

		local node = {
			Directory = true,
			Nodes = {}
		}

		parent.Nodes[leaf] = node

		return node
	end
end
-- {% end %}

-- Objects we can index
-- Used in utilities below
local indexable = {
	table = true,
	userdata = true
}

G.Directory = {
	IsDirectory = true
}

--[[
	G Directory:GetGrapheneCore()

	Returns the Graphene core, defined as G in this file.
	Not affected by any rebasing rules.
]]
function G.Directory:GetGraphene()
	return G
end

-- DEPRECATED: GetGrapheneCore -> GetGraphene
G.Directory.GetGrapheneCore = G.Directory.GetGraphene

--[[
	void Directory:AddGrapheneSubmodule(string path)
		path: The path to the submodule relative to this directory.

	Adds a submodule relative to this directory.
]]
function G.Directory:AddGrapheneSubmodule(path)
	if (type(path) ~= "string") then
		error("Bad argument #1: submodule path must be a string!", 2)
	end
	
	return G:AddSubmodule(module_join(self.__directory.Path, path))
end

--[[
	void Directory:AddGrapheneAlias(string path, any object)
		path: The module path to associate with this module.
		object: The object to load with this alias.

	Aliases an object with a library path. Will overwrite existing entries mercilessly.
]]
function G.Directory:AddGrapheneAlias(path, object)
	if (type(path) ~= "string") then
		error("Bad argument #1: module alias path must be a string!", 2)
	end

	G.__loaded[module_join(self.__directory.Path, path)] = object
end

--[[
	Directory Directory:CreateGrapheneSubdirectory(string path)
		path: The path to associate with the directory

	Creates a directory based on a submodule of the current directory.
]]
function G.Directory:CreateGrapheneSubdirectory(path)
	if (type(path) ~= "string") then
		error("Bad argument #1: subdirectory path must be a string!", 2)
	end

	return G:CreateDirectory(module_join(self.__directory.Path, path))
end

--[[
	void Directory:ImportAs(table mapping)
		mapping: Table mapping module names to their target names

	Imports a directory using a defined mapping of aliases.
]]
function G.Directory:ImportAs(mapping)
	local white = self.__import_whitelist
	local black = self.__import_blacklist or G.Importable.__import_blacklist

	local fake = {}
	for key, value in pairs(mapping) do
		fake[value] = self[key]
	end

	import_dict(fake, 1, white or black, not not white)
end

--[[
	void Directory:Import(...)

	Imports the given members from the library.
]]
function G.Directory:Import(...)
	local white = self.__import_whitelist
	local black = self.__import_blacklist or G.Importable.__import_blacklist

	local fake = {}
	for i = 1, select("#", ...) do
		fake[select(i, ...)] = self[select(i, ...)]
	end

	import_dict(fake, 1, white or black, not not white)
end

--[[
	void Directory:ImportAll()

	Loads the entire library and imports all of its members.
]]
function G.Directory:ImportAll()
	local white = self.__import_whitelist
	local black = self.__import_blacklist or G.Importable.__import_blacklist

	self:FullyLoad()

	import_dict(self, 1, white or black, not not white)
end

--[[
	void Directory:FullyLoad()

	Recursively loads all members of the directory.
]]
function G.Directory:FullyLoad()
	local list = self.__directory:List()

	for i, member in ipairs(list) do
		if (member ~= G.Config.InitFile) then
			local object = self[member]

			-- Make sure we have an object that isn't this one (necessary because of _.lua).
			-- Also make sure that it's got a FullyLoad method, which makes it either a directory
			-- or something trying to emulate a directory, probably.
			if (object and object ~= self and type(object) == "table" and object.FullyLoad) then
				object:FullyLoad()
			end
		end
	end

	return self
end

--[[
	Describes can object that can be imported.
]]
G.Importable = {
	__import_whitelist = nil,
	__import_blacklist = {
		Import = true,
		ImportAs = true,
		ImportAll = true,
		Except = true,
		__import_blacklist = true
	},
	Import = G.Directory.Import,
	ImportAs = G.Directory.ImportAs
}

--[[
	self Importable:ImportAll()

	Imports all of the members of the object.
]]
function G.Importable:ImportAll()
	local white = self.__import_whitelist
	local black = self.__import_blacklist or G.Importable.__import_blacklist

	import_dict(self, 1, white or black, not not white)
end

--[[
	self Importable:Except(table block)
		block: A set of things to ignore.

	Adds exceptions to the object's import list.
]]
function G.Importable:Except(block)
	if (self.__import_blacklist == G.Importable.__import_blacklist) then
		self.__import_blacklist = dictionary_shallow_copy(G.Importable.__import_blacklist)
	end

	dictionary_shallow_copy(block, self.__import_blacklist)

	return self
end

function G.Importable:Only(block)
	self.__import_whitelist = dictionary_shallow_copy(block, self.__import_whitelist)

	return self
end

local function xerrhand(...)
	return ("\n%s\n%s"):format(
		tostring(...),
		debug and debug.traceback() or "[no traceback without debug]"
	)
end

--[[
	any? load_file(string path, any? base)
		path: The module path of the file.
		base: The root to pass to the module, defaults to G.Base.

	Loads a file and executes it, returning the result.
	Uses the built-in filesystem abstractions.
]]
local function load_file(file, base)
	local body, err = file:Read()

	if (not body) then
		-- This really should never happen!
		error(("File at %q could not be loaded: %s"):format(file.Path, err))
	end

	local meta = {
		Name = file.Path,
		ShortName = file.Path:match("[^%.]+$"),
		Path = file.Path,
		FilePath = file.FilePath,
		FSID = file.FSID,
		Loader = file.Loader
	}

	local method, err = file.Loader(file:Read(), file.Path)

	if (not method) then
		if (G.__error_callback) then
			G.__error_callback("compile", err)
		end

		if (G.__safe) then
			return false, err
		else
			error(err)
		end
	end

	local ok, result = xpcallargs(method, xerrhand, base or G.base, meta)
	if (not ok) then
		if (G.__error_callback) then
			G.__error_callback("run", result)
		end

		if (G.__safe) then
			return false, result
		else
			error(result)
		end
	end

	if (result ~= nil) then
		G.Metadata:Set(result, meta)
	end

	return result, meta
end

--===============--
-- GRAPHENE API --
--===============--

--[[
	object G:MakeImportable(table object)
		object: The object to augment.

	Makes an object an Importable.
]]
function G:MakeImportable(object)
	dictionary_deep_copymerge(self.Importable, object)

	return object
end

function G:MakeLightImportable(object)
	setmetatable(object, {
		__index = self.Importable
	})

	return object
end

--[[
	table? G.Metadata:Get(any object, any field)
		object: The object to query metadata for.
		field: The key of the metadata to try to return.

	Returns the metadata object associated with the object if it exists
]]
function G.Metadata:Get(object, field)
	local meta = self.__store[object]

	if (field ~= nil) then
		return meta and meta[field]
	else
		return meta
	end
end

--[[
	void G.Metadata:Set(any object, any metadata)
		object: The object to set metdata for.
		metadata: The metadata to store with this object.

	Stores metadata about a given object.
]]
function G.Metadata:Set(object, metadata)
	if (not self.Enabled) then
		return
	end

	self.__store[object] = metadata
end

--[[
	List G:GetLoadedModules([string path])
		path: An optional path to check for modules in, defaults to an empty string.

	Returns a list of loaded modules within the given path. If not specified, returns all loaded modules.
	Each element of the list has the following components:
		Index 1: The module object itself.
		Index 2..n: The names this module goes by according to Graphene.
]]
function G:GetLoadedModules(path)
	path = path and "^" .. path or ""

	local len_path = #path

	-- First, build a hashmap of module->{names} to ensure module uniqueness.
	local map = {}
	for name, module in pairs(self.__loaded) do
		if (name:match(path)) then
			if (map[module]) then
				table.insert(map[module], name)
			else
				map[module] = {name}
			end
		end
	end

	-- Then, transform the map into a list, not preserving the original map.
	-- The first key becomes the module itself with the following keys being the names for it.
	local list = {}
	for module, names in pairs(map) do
		table.insert(names, 1, module)
		table.insert(list, names)
	end

	return list
end

local function submodule_predicate(a, b)
	return #a[1] > #a[2]
end

--[[
	void G:AddRebase(string path)
		path: The path to have as a submodule

	Adds a rebasing rule for modules that match this rule.
	Used for embedding existing Graphene modules.

	Components should use directory:AddGrapheneSubmodule instead unless wrapping Graphene itself.
]]
function G:AddSubmodule(path)
	if (type(path) ~= "string") then
		error("Bad argument #1: module path must be a string", 2)
	end

	table.insert(self.__submodules, {"^" .. path:gsub("%.", "%%."), path})
	table.sort(self.__submodules, submodule_predicate)
end

--[[
	void G:ClearRebases()

	Removes all rebasing rules from the core.
]]
function G:ClearSubmodules()
	for key, value in pairs(self.__submodules) do
		self.__submodules[key] = nil
	end
end

-- DEPRECATED: G:ClearRebases() --> G:ClearSubmodules()
G.ClearRebases = G.ClearSubmodules

--[[
	void G:Alias(string path, any object)
		path: The module path to associate with this module.
		object: The object to load with this alias.

	Aliases an object with a library path. Will overwrite existing entries mercilessly.
]]
function G:Alias(path, object)
	if (type(path) ~= "string") then
		error("Bad argument #1: module path must be a string.", 2)
	end

	self.__loaded[path] = object
end

--[[
	Directory G:CreateDirectory(string path, [FSDirectory directory])
		path: The path the directory should be based on.
		directory: A directory object to use. A generic one is created if not given.

	Creates a Directory object with the given path.
	Not associated with any filesystem.
]]
function G:CreateDirectory(path, directory)
	if (type(path) ~= "string") then
		error("Bad argument #1: module path must be a string.", 2)
	end

	if (directory ~= nil and not indexable[type(directory)]) then
		error("Bad argument #2: directory must be an indexable object if given.", 2)
	end

	if (not directory) then
		directory = {
			Path = path,
			List = function(self)
				error("List is not supported with root-created directory objects!")
			end
		}
	end

	local object = dictionary_shallow_copy(self.Directory)
	object.__initializing = {}
	object.__directory = directory

	local __initializing = object.__initializing

	function object:GrapheneGet(key)
		if (rawget(object, key)) then
			return rawget(object, key)
		end

		if (__initializing[key]) then
			error(("Circular reference loading %q!"):format(path), 2)
		end

		local path = module_join(directory.Path, key)

		__initializing[key] = true

		local result = G:Get(path, self, key)

		__initializing[key] = false

		return result
	end

	local interface = setmetatable({}, {
		__index = object.GrapheneGet
	})

	if (G.Metadata.Enabled) then
		G.Metadata:Set(interface, {
			Name = directory.Path,
			ShortName = directory.Path:match("[^%.]+$"),
			Path = directory.Path,
			FilePath = directory.FilePath,
			FSID = directory.FSID,
			Loader = directory.Loader
		})
	end

	return interface
end

--[[
	void G:SetLoadCallback(function method)
		method: The callback to set.

	Sets the method that should be called when a module is loaded by Graphene.
]]
function G:SetLoadCallback(method)
	if (type(method) ~= "function") then
		error("Bad argument #1: method must be of type 'function'!", 2)
	end

	self.__load_callback = method
end

--[[
	function? G:GetLoadCallback()

	Returns the current load callback, if set.
]]
function G:GetLoadCallback()
	return self.__load_callback
end

--[[
	void G:SetErrorCallback(function method)
		method: The callback to set.
	
	Sets the method to be called if an error arrises loading a module.
]]
function G:SetErrorCallback(method)
	if (type(method) ~= "function") then
		error("Bad argument #1: method must be of type 'function'!", 2)
	end

	self.__error_callback = method
end

--[[
	function? G:GetLoadCallback()

	Returns the current error callback, if set.
]]
function G:GetErrorCallback()
	return self.__error_callback
end

--[[
	void G:SetSafeMode(bool value)
		value: Whether loading should be safe.

	Determines whether modules will have their errors suppressed when loading.
	Useful for unit testing.
]]
function G:SetSafeMode(value)
	self.__safe = not not value
end

--[[
	any? G:Get([string path, table target, any key])
		path: The path to the module, period delimitted. If not given, it becomes an empty string.
		target: A container to load the result into.
		key: The index of the container to place the result at.

	Returns the object relative to this namespace's root, if it exists.
]]
function G:Get(path, target, key)
	if (path ~= nil and not (type(path) == "string")) then
		error("Bad argument #1: module path must be a string if given.", 2)
	end

	if (target ~= nil and key == nil) then
		error("Bad argument #3: If argument #2 is given, argument #3 must also be given.", 2)
	end

	path = path or ""

	-- Flag to determine whether to use target and key as out.
	local do_placement = not not (target and key)

	-- Check for already loaded module!
	if (self.__loaded[path]) then
		local object = self.__loaded[path]

		if (do_placement) then
			target[key] = object
		end

		return object, self.Metadata:Get(object)
	end

	-- Run path through our submodule rules
	local base = G.Base
	for i, submodule in ipairs(self.__submodules) do
		if (path:match(submodule[1])) then
			base = self.__loaded[submodule[2]]

			break
		end
	end

	-- Is this a file?
	local file = G.FS:GetFile(path)

	if (file) then
		local object, meta = load_file(file, base)
		file:Close()

		if (object) then
			path = meta.Path or path
			self.__loaded[path] = object

			if (do_placement) then
				target[key] = object
			end

			if (self.__load_callback) then
				self.__load_callback(object, meta)
			end

			return object, meta
		end
	else
		-- How about a directory?
		local directory = G.FS:GetDirectory(path)

		if (directory) then
			local object = self:CreateDirectory(path, directory)

			if (object) then
				self.__loaded[path] = object

				if (do_placement) then
					target[key] = object
				end

				-- Check for init file
				local init, meta = self:Get(module_join(path, self.Config.InitFile))

				if (init) then
					-- If init is a table, we should set up metatable fallbacks
					if (type(init) == "table") then
						-- Merge in our metatables from our directory object without overwriting existing entries
						setmetatable(init, dictionary_shallow_merge(getmetatable(object), getmetatable(init) or {}))
					end

					-- Get rid of the old path and load into a new one according to our metadata directive.

					path = meta.Path or path

					self.__loaded[path] = init

					if (do_placement) then
						target[key] = init
					end

					if (self.__load_callback) then
						self.__load_callback(init, meta)
					end

					return init, meta
				end

				if (self.__load_callback) then
					self.__load_callback(object)
				end

				return object
			end
		else
			return nil
		end
	end
end

-- If the Lib switch is set, make our base the current namespace instead of the Graphene core.
-- Setting 'Lib' to false is deprecated.
if (G.Config.Lib) then
	G:Get(nil, G, "Base")
else
	print("Deprecated: Lib = false in configuration is deprecated as of Graphene 1.1.9")
	G.Base = G
end

return G.Base