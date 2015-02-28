--[[
	Carbon for Lua
	Sets

	Contains pregenerated list-form sets of various types of data.
	Used as standards for testing.
]]

local Sets = {}

-- Set of 64 0 values
Sets.Zeros = {
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0
}

-- Set of 64 random numbers on [1, 2^16]
Sets.Numbers = {
	52050, 45800, 38674, 49364, 5307, 43327, 22239, 48218,
	27964, 37264, 7502, 3598, 63843, 46229, 11532, 63885,
	18150, 23207, 30957, 44500, 37693, 52228, 29606, 11929,
	43254, 13840, 39107, 9445, 54390, 38228, 1625, 54815,
	3252, 54368, 41059, 54182, 11846, 16744, 60369, 20773,
	5149, 23256, 60359, 1641, 44363, 48793, 36261, 7719,
	8755, 2174, 32723, 45173, 33197, 56070, 9145, 19206,
	57510, 50168, 45586, 42532, 54976, 688, 3536, 50403
}

-- Set of 64 random primes on [1, 2^16]
Sets.Primes = {
	23827, 62539, 64577, 22511, 16661, 15233, 57073, 62219,
	36629, 48163, 2789, 21107, 39877, 61561, 47563, 4969,
	9311, 2273, 12163, 7603, 25469, 37223, 15199, 52889,
	16063, 10867, 7723, 48857, 2281, 51361, 43159, 7481,
	60773, 51673, 22669, 50849, 3119, 42727, 32203, 51043,
	3389, 31259, 43783, 33589, 4729, 40639, 3413, 10723,
	51511, 42773, 65033, 42019, 52937, 63977, 21379, 21019,
	61291, 61603, 52379, 55579, 42463, 40819, 33083, 57131
}

-- Set of 64 random letters in [a-zA-Z]
Sets.Letters = {
	"V", "C", "S", "A", "E", "d", "i", "p",
	"y", "R", "K", "P", "U", "m", "d", "r",
	"b", "B", "P", "P", "K", "D", "x", "q",
	"o", "H", "O", "q", "X", "p", "h", "O",
	"q", "r", "T", "u", "o", "d", "p", "A",
	"c", "t", "P", "a", "f", "R", "U", "t",
	"u", "A", "N", "C", "U", "a", "x", "R",
	"w", "H", "c", "C", "P", "h", "q", "v"
}

-- Set of 64 random strings of length 3-8
Sets.Words = {
	"cwzpMR", "SOKLz", "KZD", "WKcBvA", "awJqvhQ", "IAs", "OClT", "hVjdCj",
	"jxG", "KeoPGQ", "jFYmFO", "APUdf", "QZVLXz", "Gjg", "xxEW", "SiwDw",
	"VJYqjK", "SRKIR", "xUXxt", "JzblPIy", "fnNFPkD", "uaBYVGi", "tgbdnjlY", "oqDGnINo",
	"WLt", "XhrKLqPi", "azmQkwcl", "nlhBs", "vsdv", "sbZwLJ", "plHFWzz", "vmdhxV",
	"ADHJ", "GMoavNC", "XFptujq", "cqn", "scR", "BkqW", "OPWZISmX", "UPUqiza", "iUFhqM",
	"PyRVV", "ehbFum", "mcsxHEQS", "wEHVlSqT", "PgGAzcEH", "bepPJfR", "TdGSbIg",
	"ybY", "OmIWIjkI", "nrAJ", "FYodyS", "qlaUqr", "fLzqFpJh", "Znlm", "JkANrppN",
	"jtu", "djPeNZ", "AQcwfUS", "EQib", "JzRTu", "AJuI", "iHXb", "FoyFi"
}

-- Set of 64 pairs of random numbers on [1, 64]
-- Uses all 64 entries at least twice
Sets.Match2 = {
	{51, 45}, {38, 49}, {6, 43}, {22, 48}, {28, 37}, {8, 4}, {63, 46}, {12, 63},
	{18, 23}, {31, 44}, {37, 52}, {29, 12}, {43, 14}, {39, 10}, {54, 38}, {2, 54},
	{4, 54}, {41, 53}, {12, 17}, {59, 21}, {6, 23}, {59, 2}, {44, 48}, {36, 8},
	{9, 3}, {32, 45}, {33, 55}, {9, 19}, {57, 49}, {45, 42}, {54, 1}, {4, 50},
	{26, 62}, {64, 25}, {19, 18}, {57, 62}, {38, 49}, {4, 24}, {42, 61}, {48, 7},
	{12, 4}, {15, 10}, {28, 39}, {18, 53}, {19, 13}, {10, 50}, {4, 52}, {45, 10},
	{60, 52}, {25, 51}, {5, 44}, {34, 52}, {5, 33}, {45, 36}, {7, 42}, {5, 13},
	{52, 44}, {64, 44}, {53, 63}, {24, 24}, {61, 61}, {53, 56}, {44, 42}, {35, 57}
}

for key, value in pairs(Sets) do
	local proxy = newproxy(true)
	getmetatable(proxy).__index = function(self, key)
		assert(type(key) == "number", "index must be a number")
		return value[(key - 1) % #value + key]
	end

	Sets[key] = proxy
end

return Sets