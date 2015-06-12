--[[
	Carbon for Lua
	#class Carbon

	#description {
		This is the Carbon core, containing all other modules and some utilities.
	}
]]

local Carbon = (...)
local Graphene = Carbon:GetGraphene()
local Support = Graphene.Support

Carbon:AddGrapheneSubmodule("Callisto")

--[[#method 1 {
	class public @void Carbon:ImportCore()

	Imports Carbon's core utilities into the current file for use.

	Presently imports:
	- Async
	- Assert
	- Error
	- IsObject
	- LoadString
	- Deprecated
	- None
	- Maybe
}]]
function Carbon:ImportCore()
	return self:Import("Async", "Assert", "Error", "IsObject", "LoadString", "Deprecated", "None", "Maybe")
end

--[[#property public @dictionary Carbon.Support {
	Contains the support information provided by Graphene.
}]]
Carbon.Support = Graphene.Support

--[[#property public @list Carbon.Version {
	Contains the current version in the form `{major, minor, revision, status}`.
}]]
Carbon.Version = {1, 2, 0}

--[[#property public @string Carbon.VersionString {
	Contains a string version of the current version in the form `"major.minor.revision-status"`.
}]]
Carbon.VersionString = ("%d.%d.%d%s%s"):format(
	Carbon.Version[1],
	Carbon.Version[2],
	Carbon.Version[3],
	Carbon.Version[4] and "-" or "",
	Carbon.Version[4] or ""
)

--[[#property public @set Carbon.Features {
	Contains a set of features and whether they are enabled or disabled.
}]]
Carbon.Features = {
	Debug = false,
	RemoveDeprecated = false,
	ExperimentalFeatures = false
}

--[[#property public None Carbon.None {
	A type to represent "none", but not @nil.
}]]
Carbon.None = newproxy(false)

--[[#property public Maybe Carbon.Maybe {
	A type to represent a value between `true` and `false`.
}]]
Carbon.Maybe = newproxy(false)

--[[#method {
	class public @void Carbon.Enable(@any ...)
		optional ...: The features to enable

	Enables a feature by name.
}]]
function Carbon.Enable(...)
	for i = 1, select("#", ...) do
		Carbon.Features[select(i, ...)] = true
	end
end

--[[#method {
	class public @void Carbon.Disable(@any ...)
		optional ...: The features to disable

	Disables a feature by name.
}]]
function Carbon.Disable(...)
	for i = 1, select("#", ...) do
		Carbon.Features[select(i, ...)] = false
	end
end

--[[#method {
	class public @void Carbon.Enabled(@any feature)
		required feature: The feature to check

	Returns whether a feature is enabled.
}]]
function Carbon.Enabled(feature)
	return (not not Carbon.Features[feature])
end

--[[#method {
	class public @any? Carbon.Deprecated(@any? thing)
		required thing: The thing to mark as deprecated.

	Wraps an object in a deprecation handler.

	If the `RemoveDeprecated` feature is enabled, this method will return nil.

	If `thing` is a function, it will throw a one-time warning on the first call.
}]]
function Carbon.Deprecated(thing, name)
	if (Carbon.Features.RemoveDeprecated) then
		return nil
	end

	if (not Carbon.Features.Debug) then
		return thing
	end

	local t = type(thing)

	if (t == "function") then
		name = name or debug.getinfo(thing, "n").name or "[unknown function]"

		return function(...)
			Carbon.Logging.WarnOnce(name .. " is deprecated")
			return thing(...)
		end
	end

	return thing
end

--[[#method {
	class public @coroutine Carbon.Async(@function method)
		required method: The method to get an asynchronous form of.

	Returns a version of the given function that is async.

	Presently an alias for Lua's `coroutine.wrap`, but this may change in the future.
}]]
Carbon.Async = coroutine.wrap

--[[#method {
	class public @void Carbon.Assert(@bool condition, [@string message])
		required condition: The condition to assert.
		optional message: The message to throw if the assertion fails.

	Asserts, like Lua's assert, but calls tostring on the message explicitly.

	**DEPRECATED** in 1.1: Use `assert` or `Exception:ThrowIf` (added in 1.1)
}]]
function Carbon.Assert(condition, message)
	if (not condition) then
		error(tostring(message) or "Assertion failed!", 2)
	end
end
Carbon.Assert = Carbon.Deprecated(Carbon.Assert, "Carbon.Assert")

--[[#method {
	class public @void Carbon.Error(...)
		required ...: Arguments to pass to Lua's `error` function.

	Throws an error, calling tostring on the message explicitly.

	**DEPRECATED** in 1.1: Use `error` or `Exception:Throw` (added in 1.0)
}]]
function Carbon.Error(...)
	error(tostring((...)), select(2, ...))
end
Carbon.Error = Carbon.Deprecated(Carbon.Error, "Carbon.Error")

--[[#method {
	class public @bool Carbon.IsObject(@any object)
		required object: The object to check

	Returns whether the given object is a valid Carbon object.
}]]
function Carbon.IsObject(x)
	local t = type(x)
	if (t == "table" or (t == "userdata" and getmetatable(t) and getmetatable(t).__index)) then
		return not not x.Is
	end

	return false
end

--[[#method {
	class public @function Carbon.Unpack(@table t)
		required t: The table to unpack

	Performs a fast unpack on the table.
}]]
do
	local _cache = {}
	local function _generate(n)
		local str_buffer = {}

		for i = 1, n do
			table.insert(str_buffer, ("arr[%d]"):format(i))
		end
		local str = table.concat(str_buffer, ",")

		return loadstring(("return function(arr) return %s end"):format(str))()
	end

	local vunpack = unpack or table.unpack

	function Carbon.Unpack(t)
		local n = #t

		if (n > 8) then
			return vunpack(t)
		end

		if (not _cache[n]) then
			_cache[n] = _generate(n)
		end
		
		return _cache[n](t)
	end
end

--[[#method {
	class public @function Carbon.LoadString(@string source, [@string chunkname, @table environment])
		required source: The source code to compile into a function.
		optional chunkname: The name of the chunk to reference if the method returns an error.
		optional environment: The environment to load the function into.

	Loads a function with a given environment.
	Essentially backports Lua 5.2's load function to LuaJIT and Lua 5.1.
}]]
if (Support.lua51) then
	function Carbon.LoadString(source, from, environment)
		environment = environment or getfenv()
		local chunk, err = loadstring(source, from)

		if (not chunk) then
			return chunk, err
		end

		if (environment) then
			setfenv(chunk, environment)
		end

		return chunk
	end
elseif (Support.lua52) then
	function Carbon.LoadString(source, from, environment)
		return load(source, from, nil, environment)
	end
end

-- Register Carbide as a Graphene loader.
Graphene.Config.Loaders[".clua"] = Carbon.Carbide.Compile

return Carbon