--[[
	badges.lua

	A simple API to generate badges and place them in Markdown-driven readme files automatically.
]]

local badges = {
	readme_paths = {"readme.md"},

	shields = {
		build = "[shield_build]: https://img.shields.io/badge/build-%s-%s.svg?style=flat-square",
		tests = "[shield_tests]: https://img.shields.io/badge/tests-%s/%s-%s.svg?style=flat-square",
		dev_version = "[shield_dev_version]: https://img.shields.io/badge/development-%s-orange.svg?style=flat-square"
	},

	updaters = {
		-- Unit test results
		function(self, body, data)
			local tests = data.Tests or {}
			local pass = tests.Passes or 0
			local fail = tests.Fails or 0

			local pass_word = "unknown"
			local pass_color = "lightgrey"
			if (fail == 0 and pass > 0) then
				pass_word = "passing"
				pass_color = "brightgreen"
			elseif (fail > 0) then
				pass_word = "failing"
				pass_color = "red"
			end

			local total = pass + fail
			local ratio = pass / total
			local tests_color =
				ratio ~= ratio and "lightgrey" or -- NaN: zero tests
				ratio == 1.0 and "brightgreen" or
				ratio >= 0.5 and "yellow" or
				"red"

			return body
				:gsub("%[shield_build%]:[^\n]*", self.shields.build:format(pass_word, pass_color))
				:gsub("%[shield_tests%]:[^\n]*", self.shields.tests:format(pass, total, tests_color))
		end,

		-- Current dev version
		--[[
		function(self, body, data)
			return body
				:gsub("%[shield_dev_version%]:[^\n]*", self.shields.dev_version:format((data.Version:gsub("%-", "--"))))
		end
		]]
	}
}

function badges:update_readme_body(body, data)
	for i, updater in ipairs(self.updaters) do
		body = updater(self, body, data)
	end

	return body
end

--[[
	Updates readme with all results from testing and the likes.
	status structure:
		Tests (table):
			Passes (number)
			Fail (number)
		Version (string)
]]
function badges:update_readme(data)
	for i, path in ipairs(self.readme_paths) do
		local handle = assert(io.open(path, "r"))
		local body = handle:read("*a")
		handle:close()

		local updated = self:update_readme_body(body, data)

		local handle = assert(io.open(path, "w"))
		handle:write(updated)
		handle:close()
	end
end

return badges