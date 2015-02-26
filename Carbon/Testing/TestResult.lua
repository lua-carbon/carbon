--[[
	Carbon for Lua
	Test Result Container

	An object to signal success and failure conditions to the test engine.

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
	__warnings = {}
}

--[[
	TestResult TestResult:New(Test test)
		test: The test that will use this TestResult.

	Creates a new TestResult object for unit tests to fill.
]]
function TestResult:New(test)
	local new = shallow_copy(self)

	new.__test = test
	new.__errors = {}
	new.__warnings = {}
	new.__messages = {}

	return new
end

--[[
	self TestResult:Pass()

	Marks that a component of the TestResult has passed.
]]
function TestResult:Pass()
	self.__passes = self.__passes + 1

	return self
end

--[[
	self TestResult:Message(string message)
		message: A message to record.

	Records a message about the test without failing the test.
]]
function TestResult:Message(message)
	table.insert(self.__messages, message)

	return self
end

--[[
	self TestResult:Warn(string message)
		message: A warning to issue.

	Issues a warning without failing the test.
]]
function TestResult:Warn(message)
	table.insert(self.__warnings, message)

	return self
end

--[[
	self TestResult:Fail(string message)
		message: The error message to store.

	Marks the test as a failure and increments the failure counter.
]]
function TestResult:Fail(message)
	self.__fails = self.__fails + 1
	self.__passed = false
	table.insert(self.__errors, message)

	return self
end

return TestResult