--[[
	Callisto
	#class Callisto

	#description {
		A superset of Lua for those who want more.
	}
]]

local Callisto = (...)
local Compiler = Callisto.Compiler

Callisto.Version = {1, 0, 0}

Callisto.VersionString = ("%s.%s.%s%s%s"):format(
	Callisto.Version[1],
	Callisto.Version[2],
	Callisto.Version[3],
	Callisto.Version[4] and "-" or "",
	Callisto.Version[4] or ""
)

-- In (string source, [table settings])
-- Out (string source, table sourcemap)
Callisto.Transform = Compiler.Transform

-- In (string source, [table sourcemap])
-- Out (function? chunk, string? error)
Callisto.LoadString = Compiler.LoadString

-- In (string source, [table settings])
-- Out (function? chunk, string? error)
function Callisto.Compile(source, settings)
	local transformed, errmap = Callisto.Transform(source, settings)

	if (not transformed) then
		return false, errmap
	end

	return Callisto.LoadString(transformed, errmap)
end

return Callisto