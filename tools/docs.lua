--[[
	docs.lua

	Generates markdown documentation from the Carbon sources.
	Requires LuaFileSystem!

	Built specifically for Carbon and Carbon-like inline documentation.
]]

local ok, lfs = pcall(require, "lfs")
if (not ok) then
	error("LFS is required to use docs.lua!")
end

local docs = {
	parser = {},
	generator = {},

	-- Parser attributes
	fs_base = "./Carbon",

	-- Generator attributes
	url_base = "https://github.com/lua-carbon/carbon/tree/master/Carbon",
	doc_dir = "./docs"
}

local function path_join(a, b)
	return ((a .. "/" .. b):gsub("//+", "/"))
end

local function path_leaf(a)
	return (a:match("([^/]+)/*$"))
end

local function path_to_class(name)
	return path_join("Classes", name) .. ".md"
end

local function clean_multiline_string(a)
	-- Strip \r, trim whitespace
	a = a:gsub("\r", "")
	a = a:match("^\n*(.-)\n*$")

	-- Strip excessive indentation
	local indent_level = #a:match("^(\t*)")
	a = a:sub(indent_level + 1):gsub("\n" .. ("\t"):rep(indent_level), "\n")
	a = a:match("^%s*(.-)%s*$")

	return a
end

function docs.parser.method(out)
	local start, finish, returns, name, args = out.definition:find("(.-)%s+([%w_:%.]+)(%b())")
	if (not start) then
		print(out.definition)
		error("^^Invalid method definition ^^")
	end

	out.returns = returns
	out.name = name
	out.args = args:sub(2, -2)
	out.declaration = ("%s %s%s"):format(returns, name, args)

	out.arg_descriptions = {}
	local start, finish, last = 0, 0, finish
	while (true) do
		start, finish, name, description = out.definition:find("\t([%w_]+):%s*([^\n]+)", finish + 1)

		if (not start) then
			break
		end

		last = math.max(last, finish)

		table.insert(out.arg_descriptions, {name = name, description = description})
	end
	
	out.description = clean_multiline_string(out.definition:sub(last + 1))
end

function docs.parser.classes(body, class_list)
	local objects = {}
	local len_class_list = #class_list
	local len_body = #body

	for i = 1, len_class_list do
		local class = class_list[i]
		local low_bound, high_bound
		if (i < len_class_list) then
			low_bound, high_bound = class[1], class_list[i + 1][1]
		else
			low_bound, high_bound = class[1], #body
		end

		local object = {
			type = "class",
			name = class[2],
			description = "[no description]",
			members = {},
			inherits = {},
			type_aliases = {}
		}

		table.insert(objects, object)

		-- Match #description
		local start, finish, description = body:find("#description%s+(%b{})", low_bound)
		if (start and finish < high_bound) then
			-- Strip braces used for matching
			description = description:sub(2, -2)
			description = clean_multiline_string(description)

			object.description = description
		end

		-- Match #inherits
		local start, finish, inherits_string = body:find("#inherits%s+([^\n]+)", low_bound)
		if (start and finish < high_bound) then
			for key in inherits_string:gmatch("[^,%s]+") do
				table.insert(object.inherits, key)
			end
		end

		-- Match #alias TypeA TypeB
		local start, finish = 0, low_bound
		while (true) do
			local source, target
			start, finish, source, target = body:find("#alias%s+([%w_%.]+)%s+([%w_%.]+)", finish)

			if (not start or finish > high_bound) then
				break
			end

			object.type_aliases[source] = target
		end

		-- Match #method {...}
		local start, finish = 0, low_bound
		while (true) do
			local method
			start, finish, definition = body:find("#method%s+(%b{})", finish)

			if (not start or finish > high_bound) then
				break
			end

			definition = definition:sub(2, -2)
			definition = clean_multiline_string(definition)

			local method = {
				type = "method",
				definition = definition
			}

			docs.parser.method(method)
			table.insert(object.members, method)
		end
	end

	return objects
end

function docs.parser.body(body, out)
	-- Discover all the classes in the file and their bounds
	local class_list = {}
	local start, finish = 0, 0
	while (true) do
		local classname
		start, finish, classname = body:find("#class%s+([%w_%. ]+)", finish + 1)

		if (not start) then
			break
		end

		table.insert(class_list, {start, classname})
	end

	out.classes = docs.parser.classes(body, class_list)
end

function docs.parser.file(filename, out)
	local handle, err = io.open(filename, "rb")

	if (not handle) then
		error(("Could not open file %q for parsing: %s"):format(
			filename, err
		))
	end

	local body = handle:read("*a")
	handle:close()

	local object = {
		type = "file",
		name = path_leaf(filename),
		filename = filename
	}

	docs.parser.body(body, object)

	table.insert(out.files, object)
	for key, value in ipairs(object.classes) do
		value.filename = filename
		table.insert(out.classes, value)
	end

	return object
end

function docs.parser.directory(dirname, out)
	local mode = lfs.attributes(dirname, "mode")

	if (mode ~= "directory") then
		error(("Could not parse directory %q: not a directory"):format(
			dirname
		))
	end

	local result = {
		type = "directory",
		name = path_leaf(dirname),
		members = {}
	}

	for filename in lfs.dir(dirname) do
		if (filename ~= "." and filename ~= "..") then
			local path = path_join(dirname, filename)
			local object = docs.parser.parse(path, out)

			if (not object) then
				error("Got no object parsing file " .. path)
			end

			table.insert(result.members, object)
		end
	end

	return result
end

function docs.parser.parse(path, out)
	local mode = lfs.attributes(path, "mode")

	if (mode == "directory") then
		return docs.parser.directory(path, out)
	elseif (mode == "file") then
		return docs.parser.file(path, out)
	end

	return nil, "Unknown file mode: " .. mode
end

function docs.generator.write_file(path, contents)
	local handle, err = io.open(path_join(docs.doc_dir, path), "wb")

	if (not handle) then
		error(("Couldn't open file %q: %s"):format(
			path, err
		))
	end

	handle:write(contents)
	handle:close()
end

local function do_template(template, data)
	for key, value in pairs(data) do
		template = template:gsub(("{%s}"):format(key), tostring(value))
	end

	return template
end

local template_class = [[
# {name}
{description}

Inherits {inherits_string}

## Methods
{methods_string}

## Properties
{properties_string}
]]

local template_method = [[
### {declaration}
{arg_descriptions_string}
{description}
]]

local template_arg_description = [[
- {name}: {description}
]]

-- NYI
local template_property = [[
### {name}
{description}
]]

function docs.generator.class(class)
	local path = path_to_class(class.name)
	local body = template_class

	-- Default values for these lists in their string form.
	class.methods_string = "[none]"
	class.properties_string = "[none]"
	class.inherits_string = "[none]"

	-- Build an inhertiance string using @ directives.
	local inherits_buffer = {}
	for key, ancestor in ipairs(class.inherits) do
		table.insert(inherits_buffer, "@" .. ancestor)
	end
	class.inherits_string = next(inherits_buffer) and table.concat(inherits_buffer, ", ") or class.inherits_string

	-- Handle methods and properties
	local methods_buffer = {}
	local properties_buffer = {}
	for key, member in pairs(class.members) do
		if (member.type == "method") then
			local arg_descriptions_buffer = {}
			for key, description in ipairs(member.arg_descriptions) do
				table.insert(arg_descriptions_buffer, do_template(template_arg_description, description))
			end

			member.arg_descriptions_string = table.concat(arg_descriptions_buffer, "\n")
			table.insert(methods_buffer, do_template(template_method, member))
		elseif (member.type == "property") then
			table.insert(properties_buffer, do_template(template_property, member))
		end
	end
	class.methods_string = next(methods_buffer) and table.concat(methods_buffer, "\n\n") or class.methods_string
	class.properties_string = next(properties_buffer) and table.concat(properties_buffer, "\n\n") or class.properties_string

	body = do_template(body, class)

	-- Replace @ClassName with a link to that class.
	body = body:gsub("@([%w_%.]+)", function(target)
		local post = ""
		if (not target:sub(-1, -1):match("[%w_]")) then
			post = target:sub(-1, -1)
			target = target:sub(1, -2)
		end

		return ("[%s](%s)%s"):format(
			target, path_to_class(class.type_aliases[target] or target),
			post
		)
	end)

	docs.generator.write_file(path, body)
end

function docs.generator.root(object)
	object.classes_by_name = {}
	for key, class in ipairs(object.classes) do
		object.classes_by_name[class.name] = object
	end

	for key, class in ipairs(object.classes) do
		docs.generator.class(class)
	end
end

function docs.update()
	local out = {
		classes = {},
		files = {}
	}

	local parsed = docs.parser.directory(docs.fs_base, out)
	docs.generator.root(out)
end

return docs