--[[
	docs.lua

	Generates documentation from the Carbon sources.
	Requires LuaFileSystem!
]]

local ok, lfs = pcall(require, "lfs")
if (not ok) then
	error("LFS is required to use docs.lua!")
end

local docs = {
	source_base = "./Carbon"
}

function docs:parse_file(filename)
	--todo: body
end

return docs