local badges = require("tools.badges")
local docs = require("tools.docs")

local function main()
	local Carbon = require("Carbon")

	print("Test Suite for Carbon " .. Carbon.VersionString)

	local pass, fail = 0, 0

	local Testing = Carbon.Testing
	Testing:RunAllTests()
	local result = Testing:GetResults()

	print("Tests complete!")

	print(result:Report())


	print("Updating README...")
	badges:update_readme {
		Tests = result,
		Version = Carbon.VersionString
	}
	print("README updated!")

	print("Generating documentation...")
	docs.update()
	print("Documentation generated!")
end

main()