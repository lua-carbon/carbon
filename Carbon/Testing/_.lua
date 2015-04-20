--[[
	Carbon for Lua
	#class Testing

	#description {
		Manages execution of tests for Carbon.
	}
]]

local Carbon = (...)

local Graphene = Carbon:GetGraphene()
local TestResult = Carbon.Testing.TestResult

local Testing = {
	__loaded = false,
	__test_fors = {},
	__tests = nil,
	__results = {},
	__ran = {},
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

--[[#method {
	public void Testing:TestFor(any module, Test test)
		required module: The module to associate a test wtith.
		required test: The test to associate with this module.

	Associates a test as necessary to prove functionality of a module.
}]]
function Testing:TestFor(module, test)
	self.__test_fors[module] = test
end

--[[#method {
	public void Testing:Requires(any module)
		required module: The module to test before this one.

	Denotes that this module will not test correcly if another module failed any tests.
}]]
function Testing:Requires(module)
	if (self.__test_fors[module]) then
		self:RunTest(self.__test_fors[module])
	end
end

--[[#method {
	public void Testing:Prerequisite(Test test)
		required test: The test to mark.

	Marks that a given test is a prerequisite of this test.
	Should only be used within tests.
}]]
function Testing:Prerequisite(test)
	return self:RunTest(test)
end

--[[#method {
	public void Testing:RunTest(Test test)
		required test: The test to run.

	Runs a test if it has not been run already.
}]]
function Testing:RunTest(test)
	if (not self.__ran[test]) then
		self.__ran[test] = true

		if (test.IsDirectory) then
			self:RunTestList(test)
		elseif (test.Run) then
			local result = TestResult:New(test)
			local ok, err = pcall(test.Run, test, result)

			if (ok) then
				if (result.__fails == 0 and result.__passes == 0) then
					result:Pass()
				end
			else
				result:Fail("Test threw an error: " .. tostring(err))
			end

			self.__results[test] = result
		end
	end
end

--[[#method {
	public void Testing:RunTestList(table test)
		required test: The test container to run.

	Runs a list or dictionary full of tests.
}]]
function Testing:RunTestList(source)
	source = source or self.__tests

	for key, test in pairs(source) do
		if (type(test) == "table") then
			self:RunTest(test)
		end
	end
end

--[[#method {
	public void Testing:RunAllTests()

	Runs all the tests.
}]]
function Testing:RunAllTests()
	self.__tests = self.__tests or Carbon.Testing.Tests:FullyLoad()
	return self:RunTestList(self.__tests)
end

--[[#method {
	public table Testing:GetResults()

	Aggregates and returns the overall results for the tests that have been run.
}]]
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

		local metadata = Graphene.Metadata:Get(value.__test)
		local name = metadata and metadata.Path or "Unnamed"

		for i, message in ipairs(value.__notes) do
			if (message[1] == "Message") then
				table.insert(result.Messages, ("MESSAGE %s: %s"):format(name, message[2]))
				table.insert(result.AllMessages, result.Messages[#result.Messages])
			elseif (message[1] == "Error") then
				table.insert(result.Errors, ("ERROR %s: %s"):format(name, message[2]))
				table.insert(result.AllMessages, result.Errors[#result.Errors])
			elseif (message[1] == "Warning") then
				table.insert(result.Warnings, ("WARNING %s: %s"):format(name, message[2]))
				table.insert(result.AllMessages, result.Warnings[#result.Warnings])
			end
		end
	end

	return result
end

return Testing