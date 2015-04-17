--[[
	Carbon for Lua
	#class Carbon

	#description {
		This is the Carbon core, containing all other modules and some utilities.
	}
]]

local libCarbon = (...)
local Graphene = libCarbon:GetGraphene()
local Support = Graphene.Support

local Carbon = {}

--[[#method 1 {
	class public @void Carbon:ImportCore()

	Imports Carbon's core utilities into the current file for use.

	Presently imports `Async`, `Assert`, `Error`, `IsObject`, and `LoadString`.
}]]
function Carbon:ImportCore()
	return self:Import("Async", "Assert", "Error", "IsObject", "LoadString")
end

--[[#property public @list Carbon.Version {
	Contains the current version in the form `{major, minor, revision, status}`.
}]]
Carbon.Version = {1, 0, 0}

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
}]]
function Carbon.Assert(condition, message)
	if (not condition) then
		error(tostring(message) or "Assertion failed!", 2)
	end
end

--[[#method {
	class public @void Carbon.Error(...)
		required ...: Arguments to pass to Lua's `error` function.

	Throws an error, calling tostring on the message explicitly.
}]]
function Carbon.Error(...)
	error(tostring((...)), select(2, ...))
end

--[[#method {
	class public @bool Carbon.IsObject(@any object)
		required object: The object to check

	Returns whether the given object is a valid Carbon object.
}]]
function Carbon.IsObject(x)
	local t = type(x)
	if (t == "table" or (t == "userdata" and getmetatable(t) and getmetatable(t).__index)) then
		return not not t.Is
	end

	return false
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

-- These shims are used for Carbide and its dependencies.
for key, value in pairs(Carbon) do
	libCarbon[key] = value
end

-- Register Carbide as a Graphene loader.
Graphene.Config.Loaders[".clua"] = libCarbon.Carbide.Compile

return Carbon