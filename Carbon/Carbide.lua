--[[
	Carbon for Lua
	Carbide Language Extensions

	Implements a set of Lua language extensions, including inlined templates.
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