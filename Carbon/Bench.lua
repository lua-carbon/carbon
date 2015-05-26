--[[
	Carbon for Lua
	#class Bench

	#description {
		Helps to benchmark things!
	}
]]

local Carbon = (...)
local OOP = Carbon.OOP
local Time = Carbon.Time

local Bench = OOP:Class()
	:Members {
		__description = nil,
		__marks = {},
		__times = {}
	}

--[[#method {
	object public self Bench:Add(@string name, @function method)
		required name: The name of the benchmark to add.
		required method: A single iteration of the benchmark.

	Adds a benchmark to be tested with this benchmark.
}]]
function Bench:Add(name, method)
	table.insert(self.__marks, {
		name = name,
		method = method,
		start = 0,
		finish = 0,
		time = 0
	})

	return self
end

--[[#method {
	object public self Bench:Describe(@string desc)
		required desc: The description of the bench.

	Adds a description to this @Bench to be used when showing results.
}]]
function Bench:Describe(desc)
	self.__description = desc

	return self
end

--[[#method {
	object public self Bench:Run(@unumber iterations)
		required iterations: The number of iterations to run the bench for.

	Runs all registered benchmarks on this @Bench.
}]]
function Bench:Run(iterations)
	for key, test in ipairs(self.__marks) do
		collectgarbage()
		collectgarbage()

		if (jit) then
			jit.flush()
		end

		local method = test.method
		test.start = Time.Get()

		for i = 1, iterations do
			method()
		end

		test.finish = Time.Get()
		test.time = test.finish - test.start
	end

	return self
end

--[[#method {
	object public @string Bench:Results()

	Returns the results of the benchmark; only valid after calling `Bench:Run()`.
}]]
function Bench:Results()
	if (#self.__marks == 0) then
		return "No benchmarks run."
	end

	local results_buffer = {self.__description}

	local ver = jit and jit.version or _VERSION

	table.insert(results_buffer, ver)

	if (jit) then
		table.insert(results_buffer, "JIT " .. ((jit.status()) and "on" or "off"))
	end

	table.sort(self.__marks, function(a, b)
		return #a.name > #b.name
	end)

	local len_names = #self.__marks[1].name + 1

	table.sort(self.__marks, function(a, b)
		return a.time < b.time
	end)

	local best_time = self.__marks[1].time

	for key, mark in ipairs(self.__marks) do
		table.insert(results_buffer,
			("%-" .. len_names .. "s %5fs (%4.fx  best or  %4.f%%)"):format(
				mark.name, mark.time,
				mark.time / best_time,
				100 * mark.time / best_time
			)
		)
	end

	return table.concat(results_buffer, "\n")
end

return Bench