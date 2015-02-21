--[[
	Carbon for Lua
	Carbide Language Extensions

	Implements a set of Lua language extensions, including inlined templates.

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

local Carbon = (...)
local TemplateEngine = Carbon.TemplateEngine

local loadstring = loadstring or load
local lua_loader = Carbon:GetGrapheneCore().Config.Loaders[".lua"]

local Carbide = {
	Engine = TemplateEngine:New()
}

function Carbide.ParseTemplated(source)
	local result, err, template = Carbide.Engine:Render(source, {Carbon = Carbon})
	
	if (not result) then
		return false, err
	end

	return result
end

function Carbide.CompileTemplated(source, name, environment)
	local result, err = Carbide.ParseTemplated(source)

	if (not result) then
		error(err)
	end

	return lua_loader(result, name, environment)
end

-- Right now, Carbide implements no language extensions beyond inlined templates.
-- Full Carbide Lua (*.clua) will implement more features in the future over Templated Carbide Lua (*.tlua).
Carbide.Compile = Carbide.CompileTemplated
Carbide.Parse = Carbide.ParseTemplated

return Carbide