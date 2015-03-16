--[[
	Carbon for Lua
	#class Configuration
	#inherits OOP.Object

	#description {
		Provides configuration facilities for modules.
	}
]]

local Carbon = (...)
local Configuration = {}

--[[#method 1 {
	public @Configuration Configuration:New(string name)
		required name: The name of the configuration object

	Creates a new @Configuration object for configuring modules before they're loaded.
}]]
function Configuration:New(name)
	return function(body)
		local body = body or {}
		local handle = newproxy(true)
		getmetatable(handle).__index = body
		getmetatable(handle).__newindex = body

		-- Retrieve a value from the configuration, errors if it does not exist.
		function body:_require(path)
			local at = self

			for key in path:gmatch("[^%.]+") do
				if (type(at) ~= "table" and type(at) ~= "userdata") then
					error(("Could not find required value in %q: %s"):format(name, path), 2)
				end

				at = at[key]
			end

			if (not at) then
				error(("Could not find required value in %q: %s"):format(name, path), 2)
			end

			return at
		end

		-- Used when the applicable module is loaded
		-- Prevents further configuration changes
		function body:_lock()
			self._locked = true
			getmetatable(self).__newindex = function(self, key, value)
				error(("Cannot modify the configuration %q after the module has been loaded."):format(name), 2)
			end
		end

		return handle
	end
end

function Configuration:Copy()
end

return Configuration