--[[
	Carbon for Lua
	Core

	Provides information about Carbon.

	Copyright (c) 2014 Lucien Greathouse (LPGhatguy)

	This software is provided 'as-is', without any express or implied warranty.
	In no event will the authors be held liable for any damages arising from the
	use of this software.

	Permission is granted to anyone to use this software for any purpose, including
	commercial applications, and to alter it and redistribute it freely, subject to
	the following restrictions:

	1. The origin of this software must not be misrepresented; you must not claim
	that you wrote the original software. If you use this software in a product, an
	acknowledgment in the product documentation would be appreciated but is not required.

	2. Altered source versions must be plainly marked as such, and must not be misrepresented
	as being the original software.

	3. This notice may not be removed or altered from any source distribution.
]]

local libCarbon = (...)
local Configuration = libCarbon.Configuration

local Carbon = {
	Version = {1, 0, 0, ""},

	Config = {
	}
}

Carbon.VersionString = ("%d.%d.%d%s"):format(unpack(Carbon.Version))

Carbon.Async = coroutine.wrap

Carbon.Assert = function(...)
	if (not (...)) then
		error(tostring(select(2, ...)), 2)
	end

	return ...
end

Carbon.Error = function(...)
	error(tostring(...))
end

-- These shims are used for Carbide and its dependencies.
for key, value in pairs(Carbon) do
	libCarbon[key] = value
end

libCarbon:GetGrapheneCore().Config.Loaders[".tlua"] = libCarbon.Carbide.CompileTemplated
libCarbon:GetGrapheneCore().Config.Loaders[".clua"] = libCarbon.Carbide.Compile

return Carbon