local Callisto = (...)
local TestUtil = Callisto.TestUtil

local settings = {}

local source = [=[
Output.a = 5
Output.a += 5

Output.b = 5
Output.b -= 5

Output.c = 5
Output.c *= 5

Output.d = 5
Output.d /= 5

Output.e = 5
Output.e ^= 2

Output.f = "abc"
Output.f ..= "def"
]=]

local good_output = {
	a = 10,
	b = 0,
	c = 25,
	d = 1,
	e = 25,
	f = "abcdef"
}

return TestUtil.MakeTest(source, settings, good_output)