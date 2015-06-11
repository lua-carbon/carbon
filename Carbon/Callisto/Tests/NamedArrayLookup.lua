local Callisto = (...)
local TestUtil = Callisto.TestUtil

local settings = {}

local source = [=[
local vec = {1, 2, 3, 4}

Output.a = {vec->xyzw}
Output.b = {vec->wzyx}

Output.c = vec->x + vec->y + vec->z + vec->w

local x, y, z, w = vec->xywz * 2
Output.d = x + y + z + w

local b = {vec->xyzw + 1}
Output.e = b->x + b->y + b->z + b->w
]=]

local good_output = {
	a = {1, 2, 3, 4},
	b = {4, 3, 2, 1},
	c = 10,
	d = 20,
	e = 14
}

return TestUtil.MakeTest(source, settings, good_output)