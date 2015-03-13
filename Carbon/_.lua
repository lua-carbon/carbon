--[[
	Carbon for Lua
	Core
]]

local libCarbon = (...)
local Support = libCarbon:GetGraphene().Support

local Carbon = {
	Version = {1, 0, 0, "alpha2"},

	Config = {
	}
}

Carbon.VersionString = ("%d.%d.%d%s%s"):format(
	Carbon.Version[1],
	Carbon.Version[2],
	Carbon.Version[3],
	Carbon.Version[4] and "-" or "",
	Carbon.Version[4] or ""
)

Carbon.Async = coroutine.wrap

--[[
	void Carbon.Assert(...)

	Asserts, like Lua's assert, but calls tostring on the message explicitly.
]]
function Carbon.Assert(...)
	if (not (...)) then
		error(tostring(select(2, ...)), 2)
	end

	return ...
end

--[[
	void Carbon.Error(...)

	Throws an error, calling tostring on the message explicitly.
]]
function Carbon.Error(...)
	error(tostring((...)), select(2, ...))
end

--[[
	bool Carbon.IsObject(any object)
		object: The object to check

	Returns whether the given object is a valid Carbon object.
]]
function Carbon.IsObject(x)
	local t = type(x)
	if (t == "table" or (t == "userdata" and getmetatable(t) and getmetatable(t).__index)) then
		return not not t.Is
	end

	return false
end

--[[
	loaded Carbon.LoadString(string source, table environment)
		source: The source code to compile into a function.
		environment: The environment to load the function into.

	Loads a function with a given environment.
	Essentially backports Lua 5.2's load function to LuaJIT and Lua 5.1.
]]
if (Support.lua51) then
	function Carbon.LoadString(source, from, environment)
		environment = environment or getfenv()
		local chunk, err = loadstring(source, from)

		if (not chunk) then
			return chunk, err
		end

		setfenv(chunk, environment)

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

libCarbon:GetGraphene().Config.Loaders[".clua"] = libCarbon.Carbide.Compile

return Carbon