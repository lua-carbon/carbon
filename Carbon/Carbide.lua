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

function Carbide.Parse(source)
	local result, err, template = Carbide.Engine:Render(source, {Carbon = Carbon})
	
	if (not result) then
		return false, err
	end

	return result
end

function Carbide.Compile(source, name, environment)
	if (source:find("#TEMPLATES_ENABLED") then
		local result, err = Carbide.ParseTemplated(source)

		if (not result) then
			error(err)
		end
	end

	return lua_loader(result, name, environment)
end

return Carbide