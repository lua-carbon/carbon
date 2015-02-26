--[[
	Carbon for Lua
	Testing Core

	Manages execution of tests for the engine.

	Copyright (c) 2014 Lucien Greathouse (LPGhatguy)

	This software is provided 'as-is', without any express or implied warranty.
	In no event will the authors be held liable for any damages arising from the
	use of this software.

	Permission is granted to anyone to use this software for any purpose, including
	commercial applications, and to alter it and redistribute it freely, subject to
	the following restrictions:

	1. The origin of this software must not be misrepresented; you must not claim
	that you wrote the original software. If you use this software in a product, an
	acknowledgment in the product documentation would be appreciated but is not required.

	2. Altered source versions must be plainly marked as such, and must not be misrepresented
	as being the original software.

	3. This notice may not be removed or altered from any source distribution.
]]

local Carbon = (...)

local Graphene = Carbon:GetGraphene()
local TestResult = Carbon.Testing.TestResult

local Testing = {
	__tests = Carbon.Testing.Tests:FullyLoad(),
	__results = {},
	__names = {}
}

local function array_append(from, to)
	to = to or {}

	for key, value in ipairs(from) do
		table.insert(to, value)
	end

	return to
end

local function test_report(self)
	local messages = table.concat(self.AllMessages, "\n")
	return ("%-3d Passes\n%-3d Failures\n%-3d Total Tests\nResult: %s (%.2f%% passed)\nMessages:%s%s"):format(
		self.Passes,
		self.Fails,
		self.Passes + self.Fails,
		self.Fails == 0 and "PASS" or "FAIL",
		100 * self.Passes / (self.Passes + self.Fails),
		#messages > 0 and "\n" or "",
		messages
	)
end

--[[
	void Testing:Prerequisite(Test test)
		test: The test to mark.

	Marks that a given test is a prerequisite of this test.
	Should only be used within tests.
]]
function Testing:Prerequisite(test)
	return self:RunTest(test)
end

--[[
	void Testing:RunTest(Test test)
		test: The test to run.

	Runs a test if it has not been run already.
]]
function Testing:RunTest(test)
	if (not self.__results[test]) then
		self.__results[test] = true

		if (test.IsDirectory) then
			self:RunAllTests(test)
		else
			local result = TestResult:New(test)
			test:Run(result)

			if (result.__fails == 0 and result.__passes == 0) then
				result:Pass()
			end

			self.__results[test] = result
		end
	end
end

--[[
	void Testing:RunAllTests(table test)
		test: The test container to run.

	Runs a list or dictionary full of tests.
]]
function Testing:RunAllTests(source)
	source = source or self.__tests

	for key, test in pairs(source) do
		if (type(test) == "table" and test.Run) then
			self:RunTest(test)
		end
	end
end

--[[
	table Testing:GetResults()

	Aggregates and returns the overall results for the tests that have been run.
]]
function Testing:GetResults()
	local result = {
		Passes = 0,
		Fails = 0,
		AllMessages = {},
		Messages = {},
		Errors = {},
		Warnings = {},
		Report = test_report
	}

	for key, value in pairs(self.__results) do
		result.Passes = result.Passes + value.__passes
		result.Fails = result.Fails + value.__fails

		local metadata = Graphene:GetMetadata(value.__test)
		local name = metadata and metadata.Path or "Unnamed"

		for i, message in ipairs(value.__messages) do
			table.insert(result.Messages, ("MESSAGE %s: %s"):format(name, message))
		end

		for i, error in ipairs(value.__errors) do
			table.insert(result.Errors, ("ERROR %s: %s"):format(name, error))
		end

		for i, warning in ipairs(value.__warnings) do
			table.insert(result.Warnings, ("WARNING %s: %s"):format(name, warning))
		end
	end

	array_append(result.Errors, result.AllMessages)
	array_append(result.Warnings, result.AllMessages)
	array_append(result.Messages, result.AllMessages)

	return result
end

return Testing