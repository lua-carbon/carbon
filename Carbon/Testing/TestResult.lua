--[[
	Carbon for Lua
	#class Testing.TestResult

	#description {
		An object to signal success and failure conditions to the test engine.
	}
]]

local Carbon = (...)

-- We don't know that the built-in shallow copy works yet, technically
local function shallow_copy(from, to)
	to = to or {}

	for key, value in pairs(from) do
		to[key] = value
	end

	return to
end

local TestResult = {
	__passes = 0,
	__fails = 0,
	__warnings = 0,
	__passed = true,
	__messages = {},
	__errors = {},
	__warnings = {},
	__notes = {}
}

--[[#method 1 {
	public TestResult TestResult:New(Test test)
		required test: The test that will use this TestResult.

	Creates a new TestResult object for unit tests to fill.
}]]
function TestResult:New(test)
	local new = shallow_copy(self)

	new.__test = test
	new.__errors = {}
	new.__warnings = {}
	new.__messages = {}
	new.__notes = {}

	return new
end

--[[#method {
	public self TestResult:Pass()

	Marks that a component of the TestResult has passed.
}]]
function TestResult:Pass()
	self.__passes = self.__passes + 1

	return self
end

--[[#method {
	public self TestResult:Message(string message)
		required message: A message to record.

	Records a message about the test without failing the test.
}]]
function TestResult:Message(message)
	table.insert(self.__messages, message)
	table.insert(self.__notes, {"Message", message})

	return self
end

--[[#method {
	public self TestResult:Warn(string message)
		required message: A warning to issue.

	Issues a warning without failing the test.
}]]
function TestResult:Warn(message)
	table.insert(self.__warnings, message)
	table.insert(self.__notes, {"Warning", message})

	return self
end

--[[#method {
	public self TestResult:Fail(string message)
		required message: The error message to store.

	Marks the test as a failure and increments the failure counter.
}]]
function TestResult:Fail(message)
	self.__fails = self.__fails + 1
	self.__passed = false
	table.insert(self.__errors, message)
	table.insert(self.__notes, {"Error", message})

	return self
end

--[[#method {
	public bool TestResult:Assert(bool condition, string message)
		required condition: Condition to check.
		required message: Message to report on failure.

	Checks the given condition and adds a pass if it is true, or fails with the given message.
}]]
function TestResult:Assert(condition, message)
	if (condition) then
		self:Pass()
	else
		self:Fail(message)
	end

	return condition
end

return TestResult