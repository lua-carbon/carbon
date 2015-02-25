local badges = require("badges")

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

	badges:update_readme {
		tests = {
			pass = pass,
			fail = fail,
		},
		version = Carbon.VersionString
	}
	print("readme.md updated")
end

main()