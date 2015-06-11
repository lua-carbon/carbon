local Callisto = (...)
local TestUtil = Callisto.TestUtil

local settings = {}

local source = [=[
local obj = {
	v = 5,
	Bang! = function(self)
		return self.v
	end,
	!Por = function(self)
		return self.v
	end,
	Help!Me = function(self)
		return self.v
	end
}

Output.a = obj:Bang!()
Output.b = obj:!Por()
Output.c = obj:Help!Me()
]=]

local good_output = {
	a = 5,
	b = 5,
	c = 5
}

return TestUtil.MakeTest(source, settings, good_output)