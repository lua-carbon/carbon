local Callisto = (...)
local Compiler = Callisto.Compiler

local TestUtil = {}

function TestUtil.ACopy(t)
	local o = {}
	for key, value in ipairs(t) do
		o[key] = value
	end
	return o
end

function TestUtil.Compare(a, b, path)
	path = path or {"output"}

	if (type(a) ~= type(b)) then
		return false, ("failure at %s: got type %q, expected type %q"):format(
			table.concat(path, "."),
			type(a), type(b)
		)
	end

	for key, value in pairs(a) do
		if (type(value) ~= type(b[key])) then
			table.insert(path, key)

			return false, ("failure at %s: got type %q, expected type %q"):format(
				table.concat(path, "."),
				type(value), type(b[key])
			)
		end

		if (type(value) == "table") then
			local npath = TestUtil.ACopy(path)
			table.insert(npath, key)

			local success, err = TestUtil.Compare(value, b[key], npath)

			if (not success) then
				return false, err
			end
		elseif (type(value) == "userdata" or type(value) == "function") then
		else
			if (value ~= b[key]) then
				table.insert(path, key)

				return false, ("failure at %s: got %q, expected %q"):format(
					table.concat(path, "."),
					tostring(value), tostring(b[key])
				)
			end
		end
	end

	return true
end

function TestUtil.DoTest(source, settings, good_output)
	local env = {
		Callisto = Callisto,
		Output = {}
	}

	local source, sourcemap = Compiler.Transform(source, settings)

	if (not source) then
		return false, sourcemap
	end

	local chunk, err = Compiler.LoadString(source, sourcemap, "Test", env)

	if (not chunk) then
		return false, err
	end

	local success, err = pcall(chunk)

	if (not success) then
		return false, err
	end

	local good, err = TestUtil.Compare(good_output, env.Output)

	if (not good) then
		return false, err
	end

	return true
end

function TestUtil.MakeTest(source, settings, good_output)
	return {
		Run = function()
			return TestUtil.DoTest(source, settings, good_output)
		end
	}
end

return TestUtil