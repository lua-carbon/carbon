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
	fs_base = "./Carbon",
	url_base = "https://github.com/lua-carbon/carbon/tree/master/Carbon"
}

local function path_join(a, b)
	return ((a .. "/" .. b):gsub("//+", "/"))
end

function docs:parse_file(filename)
	--todo: body
end

return docs