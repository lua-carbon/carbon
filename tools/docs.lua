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

local template_typical_constructor = [[
class public @{class} {class}:New({arguments})
-alias: class public @{class} {class}:PlacementNew(@{class}? out{arg_comma}{arguments})
-alias: object public @void {class}:Init({arguments})
]]

local template_constructor_init_pair = [[
class public @{class} {class}:New{suffix}({arguments})
-alias: object public @void {class}:Init{suffix}({arguments})
]]

local docs = {
	hand_files = {
		"index.md, Index",
		"Getting_Started.md, Tutorials, Getting Started",
		"Using_Carbide.md, Tutorials, Using Carbide",
		"Types.md, Tutorials, Carbon Types"
	},
	files_written = {},
	parser = {},
	generator = {},
	classes_by_name = {},
	shorts = {
		required = [[<span class="doc-arg-level doc-required">required</span>]],
		optional = [[<span class="doc-arg-level doc-optional">optional</span>]],
		internal = [[<span class="doc-arg-level doc-internal">internal</span>]],
		unknown = [[<span class="doc-unknown">unknown</span>]],
		class = [[<span class="doc-scope doc-class">class</span>]],
		object = [[<span class="doc-scope doc-object">object</span>]],
		public = [[<span class="doc-visibility doc-public">public</span>]],
		private = [[<span class="doc-visibility doc-private">private</span>]]
	},
	macros = {
		typical_constructor = function(whole)
			local class, arguments = whole:match("^([^%(]+)%((.*)%)$")
			return (template_typical_constructor
				:gsub("{arg_comma}", (#arguments > 0) and ", " or "")
				:gsub("{class}", class)
				:gsub("{arguments}", arguments)
			)
		end,

		constructor_init_pair = function(whole)
			local suffix, class, arguments = whole:match("^(%S+)%s+([^%(]+)%((.*)%)$")
			return (template_constructor_init_pair
				:gsub("{arg_comma}", (#arguments > 0) and ", " or "")
				:gsub("{suffix}", suffix)
				:gsub("{class}", class)
				:gsub("{arguments}", arguments)
			)
		end
	},

	-- Parser attributes
	fs_base = "./Carbon",

	-- Generator attributes
	file_url_base = "https://github.com/lua-carbon/carbon/tree/master/",
	doc_url_base = "carbon.lpghatguy.com",
	doc_dir = "./docs"
}

local function do_macros(document)
	return document:gsub("%$([%w_]+)(%b())", function(name, arg_string)
		local arguments = arg_string:sub(2, -2)

		local macro = docs.macros[name]

		if (not macro) then
			print(("WARNING: Invalid macro %q!"):format(name))
			return
		end

		return macro(arguments)
	end)
end

local function path_join(a, b)
	return ((a .. "/" .. b):gsub("//+", "/"))
end

local function path_leaf(a)
	return (a:match("([^/]+)/*$"))
end

-- FIXME: this breaks with readthedocs
local function absolute_link_to_class(name)
	return "http://" .. path_join(path_join(docs.doc_url_base, "Classes"), name)
end

local function link_to_type(name)
	return "Types#" .. name
end

local function link_to_class(name)
	return path_join("Classes", name)
end

local function path_to_class(name)
	return path_join("Classes", name) .. ".md"
end

local function escape_html(str)
	return (str:gsub("<", "&lt;"):gsub(">", "&gt;"))
end

local function clean_string(a)
	-- Strip \r, trim whitespace
	a = a:gsub("\r", "")
	a = a:match("^\n*(.-)\n*$")

	-- Strip excessive indentation
	local indent_level = #a:match("^(\t*)")
	a = a:sub(indent_level + 1):gsub("\n" .. ("\t"):rep(indent_level), "\n")
	a = a:match("^%s*(.-)%s*$")

	return a
end

local function process_string(s)
	s = escape_html(s)

	s = s:gsub("```([^\n]+)\n(.-)```", function(args, body)
		return ("<code class=\"%s hljs\">%s</code>"):format(args, body)
	end)

	s = s:gsub("%b``", function(whole)
		if (#whole > 3) then
			return ("<code>%s</code>"):format(whole:sub(2, -2))
		else
			return whole
		end
	end)

	-- This is really sketchy
	s = s .. "\n\n"
	s = s:gsub("\n%- *(.-)\n\n", function(contents)
		contents = contents:gsub("\n%- *([^\n]*)", "<li>%1</li>")
		contents = contents:gsub("\n", "<br />")
		return "\n<ul><li>" .. contents .. "</li></ul>\n"
	end)

	return clean_string(s)
end

local function dictionary_shallow_copy(a, b)
	b = b or {}

	for key, value in pairs(a) do
		b[key] = value
	end

	return b
end

local function dictionary_deep_copy(a, b)
	b = b or {}

	for key, value in pairs(a) do
		if (type(value) == "table") then
			b[key] = dictionary_deep_copy(value)
		else
			b[key] = value
		end
	end

	return b
end

local function dictionary_shallow_merge(a, b)
	for key, value in pairs(a) do
		if (b[key] == nil) then
			b[key] = value
		end
	end

	return b
end

local function make_class_base(name)
	return {
		__priority = math.huge,
		type = "class",
		name = name,
		description = "[no description]",
		members = {},
		inherits = {},
		type_aliases = {
			[name:match("([^%.]+)$")] = name
		}
	}
end

local function parse_method_declaration(source, out)
	source = do_macros(source)

	local start, finish, prefix, name, args = source:find("(.-)%s+([^%s]-)(%b())")
	if (not start) then
		error("Invalid method declaration: " .. tostring(source))
	end

	local sans_class, class_founds = prefix:gsub("^class%s*", "")
	local sans_object, object_founds = prefix:gsub("^object%s*", "")
	local sans_scope = class_founds > 0 and sans_class or sans_object
	local scope = class_founds > 0 and "class" or object_founds > 0 and "object" or " "

	local sans_public, publics = sans_scope:gsub("^public%s*", "")
	local sans_private, privates = sans_scope:gsub("^private%s*", "")
	local sans_vis = publics > 0 and sans_public or sans_private
	local visibility = publics > 0 and "public" or privates > 0 and "private" or "unknown"

	if (visibility == "unknown") then
		print("DOCGEN WARNING: Unknown visibility in method:", name)
	end

	out.definition = source
	out.type = "method"
	out.prefix = prefix
	out.scope = scope
	out.visibility = visibility
	out.returns = sans_vis
	out.name = name
	out.args = args:sub(2, -2)
	out.declaration = ("%s %s%s"):format(returns, name, args)
	out.aka = {}

	return finish
end

function docs.parser.method(out)
	local finish = parse_method_declaration(out.definition, out)

	-- Parse all the argument descriptions for this method.
	out.arg_descriptions = {}
	local start, finish, last = 0, 0, finish
	local arg = 0
	while (true) do
		local prefix, name, description
		start, finish, prefix, name, description = out.definition:find("\t([^\t\n:]-)([^%s:]+):%s*([^\n]+)", finish + 1)

		if (not start) then
			break
		end
		arg = arg + 1

		if (#prefix == 0) then
			print(("DOCGEN WARNING: Unknown prefix %q for argument %d in method %q!"):format(
				prefix, arg, out.name
			))
			prefix = "unknown"
		end

		last = math.max(last, finish)

		table.insert(out.arg_descriptions, {prefix = prefix, name = name, description = description})
	end

	-- Run a routine to find the end of -alias directives.
	-- Necessary to do *before* we calculate the description.
	local start, finish, last = 0, 0, last
	while (true) do
		local alias
		start, finish, class_target, definition = out.definition:find("%-alias%s*([^:]*):%s*([^\n]+)", finish + 1)

		if (not start) then
			break
		end

		last = math.max(last, finish)
	end

	out.description = clean_string(out.definition:sub(last + 1))

	-- Actually parse the -alias directives for this method.
	local start, finish, last = 0, 0, 0
	while (true) do
		local alias
		start, finish, class_target, definition = out.definition:find("%-alias%s*([^:]*):%s*([^\n]+)", finish + 1)

		if (not start) then
			break
		end

		last = finish

		local item = {}
		parse_method_declaration(definition, item)

		dictionary_shallow_merge(out, item)

		if (#class_target > 0) then
			local class = docs.classes_by_name[class_target]

			if (not class) then
				class = make_class_base(class_target)
				docs.classes_by_name[class_target] = class
			end

			local alt_version = dictionary_deep_copy(out)
			dictionary_shallow_copy(item, alt_version)
			table.insert(class.members, alt_version)
		end

		table.insert(out.aka, item)
	end
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

		local object, existing
		if (docs.classes_by_name[class[2]]) then
			object = docs.classes_by_name[class[2]]
			existing = true
		else
			object = make_class_base(class[2])
			docs.classes_by_name[class[2]] = object
		end

		table.insert(objects, object)

		-- Match #description
		local start, finish, description = body:find("#description%s+(%b{})", low_bound)
		if (start and finish < high_bound) then
			-- Strip braces used for matching
			description = description:sub(2, -2)
			description = clean_string(description)

			object.description = description
		end

		-- Match #inherits
		local start, finish, inherits_string = body:find("#inherits%s+([^\n]+)", low_bound)
		if (start and finish < high_bound) then
			for key in inherits_string:gmatch("%s*([^,\r\n]+)%s*") do
				table.insert(object.inherits, key)
			end
		end

		-- Match #priority
		local start, finish, priority = body:find("#priority%s+(%-?[%d%.]+)", low_bound)
		if (start and finish < high_bound) then
			object.priority = tonumber(priority) or priority
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

		-- Match #method priority {...}
		local start, finish = 0, low_bound
		while (true) do
			local definition
			start, finish, priority, definition = body:find("#method%s*(%-?[%d%.]*)%s*(%b{})", finish)

			if (not start or finish > high_bound) then
				break
			end

			definition = definition:sub(2, -2)
			definition = clean_string(definition)

			local method = {
				priority = tonumber(priority) or object.__priority,
				type = "method",
				definition = definition
			}

			docs.parser.method(method)
			table.insert(object.members, method)
		end

		-- Match #property visibility class name {...}
		local start, finish = 0, low_bound
		while (true) do
			local visibility, class, name, description
			start, finish, visibility, class, name, description = body:find("#property%s*(%w+)%s*([^\n]-)%s+([%w%._]+)%s*(%b{})", finish)

			if (not start or finish > high_bound) then
				break
			end

			description = description:sub(2, -2)
			description = clean_string(description)

			if (visibility ~= "public" and visibility ~= "private") then
				print(("DOCGEN WARNING: Unknown visibility %q in property %s!"):format(
					visibility, name
				))
				visibility = "unknown"
			end

			local property = {
				priority = object.__priority,
				type = "property",
				visibility = visibility,
				class = class,
				name = name,
				description = description
			}

			table.insert(object.members, property)
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
	local seen = {}
	for key, value in ipairs(object.classes) do
		value.filename = filename
		if (not seen[value]) then
			seen[value] = true
			table.insert(out.classes, value)
		end
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

function docs.generator.write_file_if_changed(path, contents)
	table.insert(docs.files_written, path)
	
	local full_path = path_join(docs.doc_dir, path)

	local handle, err = io.open(full_path, "rb")

	if (handle) then
		local old = handle:read("*a")
		handle:close()

		if (old == contents) then
			return
		end
	end

	docs.generator.write_file(path, contents)
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

local template_class = clean_string [[
<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">{name}</h1>
<span class="file-link">(in [{filename}]({file_link}))</span><br/>

{escaped_description}

{inherits_string}
<hr />
## Methods
{methods_string}

<hr />
## Properties
{properties_string}
]]

local template_inherits = [[
<span class="bold">Inherits {inherits_list}</span>
]]

local template_method_name = clean_string [[
<h4 class="method-name">!!{scope} !!{visibility} {escaped_name}({backticked_args})</h4>
<p class="method-returns bold">Returns <code>{escaped_returns}</code></p>
]]

local template_method = clean_string [[
{name_string}{aka_string}
<ul class="doc-arg-list">
{arg_descriptions_string}
</ul>

{escaped_description}
]]

local template_arg_description = clean_string [[
<li>!!{prefix} `{name}`: {description}</li>
]]

local template_property = clean_string [[
#### !!{visibility} {class_string} {name}
{description}
]]

local function process_method(method)
	local arg_descriptions_buffer = {}
	for key, description in ipairs(method.arg_descriptions) do
		table.insert(arg_descriptions_buffer, clean_string(do_template(template_arg_description, description)))
	end

	method.arg_descriptions_string = table.concat(arg_descriptions_buffer, "\n")

	-- Make args code-styled
	method.escaped_args = method.args:gsub("<", "&lt;"):gsub(">", "&gt;")
	method.backticked_args = #method.args > 0 and ("<code>%s</code>"):format(method.escaped_args) or ""

	-- Escape the name and return types so we can use template syntax in them
	method.escaped_name = escape_html(method.name)
	method.escaped_returns = escape_html(method.returns)
	method.escaped_description = process_string(escape_html(method.description))

	if (#method.scope <= 1) then
		method.scope = "unknown"
	end

	method.name_string = do_template(template_method_name, method)
end

function docs.generator.class(class)
	local path = path_to_class(class.name)
	local body = template_class

	-- Default values for these lists in their string form.
	class.methods_string = "[none]"
	class.properties_string = "[none]"

	-- Build an inhertiance string using @ directives.
	local inherits_buffer = {}
	for key, ancestor in ipairs(class.inherits) do
		table.insert(inherits_buffer, "@" .. ancestor)
	end

	if (#inherits_buffer > 0) then
		class.inherits_list = table.concat(inherits_buffer, ", ")
		class.inherits_string = do_template(template_inherits, class)
	else
		class.inherits_string = ""
	end

	class.file_link = docs.file_url_base .. class.filename
	class.escaped_description = process_string(class.description)

	-- Sort members based on their priority
	table.sort(class.members, function(a, b)
		if (a.priority < b.priority) then
			return true
		elseif (a.priority > b.priority) then
			return false
		end

		if (a.visibility == "public" and b.visibility == "private") then
			return true
		elseif (b.visibility == "public" and a.visibility == "private") then
			return false
		end

		if (a.scope == "class" and b.scope ~= "class") then
			return true
		elseif (b.scope == "class" and a.scope ~= "class") then
			return false
		end

		return a.name < b.name
	end)

	-- Handle methods and properties
	local methods_buffer = {}
	local properties_buffer = {}
	for key, member in pairs(class.members) do
		if (member.type == "method") then
			process_method(member)

			local aka_buffer = {}
			for key, alias in ipairs(member.aka) do
				process_method(alias)
				table.insert(aka_buffer, do_template(template_method_name, alias))
			end

			member.aka_string = table.concat(aka_buffer, "\n")

			table.insert(methods_buffer, do_template(template_method, member))
		elseif (member.type == "property") then
			if (#member.class > 0) then
				member.class_string = "<code>" .. member.class .. "</code>"
			else
				member.class_string = "<code>[unknown]</code>"
			end
			
			table.insert(properties_buffer, do_template(template_property, member))
		end
	end
	class.methods_string = next(methods_buffer) and table.concat(methods_buffer, "\n<hr/>\n") or class.methods_string
	class.properties_string = next(properties_buffer) and table.concat(properties_buffer, "\n<hr/>\n") or class.properties_string

	body = do_template(body, class)

	-- Replace @ClassName with a link to that class.
	body = body:gsub("@([%w_%.]+)", function(target)
		local post = ""
		if (not target:sub(-1, -1):match("[%w_]")) then
			post = target:sub(-1, -1)
			target = target:sub(1, -2)
		end

		-- Lowercase aliases are internal types, uppercase are classes.
		if (target:sub(1, 1):lower() == target:sub(1, 1)) then
			return ("<a href=\"%s\">%s</a>%s"):format(
				link_to_type(target), target,
				post
			)
		else
			return ("<a href=\"%s\">%s</a>%s"):format(
				link_to_class(class.type_aliases[target] or target), target,
				post
			)
		end
	end)

	-- Inserts shorts using !!image&arg
	body = body:gsub("!!([\\%w_]+)^?([%w_]*)", function(name, arg)
		if (name:sub(1, 1) == "\\") then
			return "!!" .. name:sub(2)
		end

		if (#arg > 0) then
			return docs.shorts[name]:format(arg) or "UNKNOWN SHORT"
		else
			return docs.shorts[name]:format(" ") or "UNKNOWN SHORT"
		end
	end)

	docs.generator.write_file_if_changed(path, body)
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

function docs.update_mkdocs()
	local handle = io.open("mkdocs.yml", "rb")
	local body = handle:read("*a")
	handle:close()

	local filename_buffer = {}
	for key, file in ipairs(docs.hand_files) do
		table.insert(filename_buffer, "- [" .. file .. "]")
	end

	-- Sort the written files really well
	table.sort(docs.files_written, function(a, b)
		a = a:match("([^/]+)%.md$")
		b = b:match("([^/]+)%.md$")

		if (a:match("^" .. b)) then
			return false
		elseif (b:match("^" .. a)) then
			return true
		else
			return a < b
		end
	end)

	for key, file in ipairs(docs.files_written) do
		table.insert(filename_buffer, ("- [%s, %s, %s]"):format(
			file, file:match("^(.+)/.-$"), file:match("([^/]+)%.md$")
		))
	end

	table.insert(filename_buffer, "- [style.css]")

	body = body:gsub("pages%:.+", "pages:\n" .. table.concat(filename_buffer, "\n"))

	handle = io.open("mkdocs.yml", "wb")
	handle:write(body)
	handle:close()
end

function docs.update()
	local out = {
		classes = {},
		files = {}
	}

	local parsed = docs.parser.directory(docs.fs_base, out)
	docs.generator.root(out)
	docs.update_mkdocs()
end

return docs