local shield_build = "[shield_build]: https://img.shields.io/badge/build-%s-%s.svg?style=flat-square"
local shield_tests = "[shield_tests]: https://img.shields.io/badge/tests-%s/%s-%s.svg?style=flat-square"
local shield_dev_version = "[shield_dev_version]: https://img.shields.io/badge/development-%s-orange.svg?style=flat-square"

--[[
	Updates readme with test result.
	tests needs the following keys:
		pass: tests passed
		fail: tests failed
]]
local function change_test_status(body, tests)
	local pass = tests.pass or 0
	local fail = tests.fail or 0

	local pass_word = "unknown"
	local pass_color = "lightgrey"
	if (fail == 0 and pass > 0) then
		pass_word = "passing"
		pass_color = "green"
	elseif (fail > 0) then
		pass_word = "failing"
		pass_color = "red"
	end

	local pass = tests.pass or 0
	local fail = tests.fail or 0
	local total = pass + fail
	local ratio = pass / total
	local tests_color =
		ratio ~= ratio and "lightgrey" or -- NaN: zero tests
		ratio == 1.0 and "brightgreen" or
		ratio >= 0.5 and "yellow" or
		"red"

	return body
		:gsub("%[shield_build%]: [^\n]+", shield_build:format(pass_word, pass_color))
		:gsub("%[shield_tests%]: [^\n]+", shield_tests:format(pass, total, tests_color))
end

local function set_dev_version(body, version)
	return body
		:gsub("%[shield_dev_version%]: [^\n+]+", shield_dev_version:format((version:gsub("%-", "--"))))
end

--[[
	Updates readme with all results from testing and the likes.
	status structure:
		tests (table):
			pass (number)
			fail (number)
		version (string)
]]
local function update_readme(status)
	local handle = assert(io.open("readme.md", "r"))
	local body = handle:read("*a")
	handle:close()

	body = change_test_status(body, status.tests)
	body = set_dev_version(body, status.version)

	local handle = assert(io.open("readme.md", "w"))
	handle:write(body)
	handle:close()
end

local function main()
	local Carbon = require("Carbon")

	print("Carbon Test Suite for Carbon " .. Carbon.VersionString)

	local pass, fail = 0, 0

	-- todo: actually run tests?

	print("Tests complete!")

	print(("Result:\n%-2d pass\n%-2d fail\noverall: %s"):format(
		pass,
		fail,
		fail == 0 and "PASS" or "FAIL"
	))

	update_readme {
		tests = {
			pass = pass,
			fail = fail,
		},
		version = Carbon.VersionString
	}
	print("readme.md updated")
end

main()