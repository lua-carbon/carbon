local Callisto = (...)
local TestUtil = Callisto.TestUtil

local settings = {
	Legacy = true
}

local source = [=[
Output.a = 5
Output.a++
]=]

local good_output = {
	a = 6
}

return TestUtil.MakeTest(source, settings, good_output)