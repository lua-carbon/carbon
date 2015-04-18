--[[
	Carbon for Lua
	#class Nanotube

	#description {
		Funnels events and provides an event loop.
	}
]]

local Carbon, self = ...
local OOP = Carbon.OOP
local Time = Carbon.Time
local CopyBarrier = Carbon.CopyBarrier

--[[
	#property public @bool Nanotube.UseSleep {
		Whether this instance should use Time.Sleep to prevent overutilization of the CPU.
	}

	#property public @bool Nanotube.StepPeriod {
		How long this instance should sleep between steps, in seconds. Only used if `UseSleep` is enabled.
	}
]]
local Nanotube = OOP:Class()
	:Members {
		UseSleep = true,
		StepPeriod = 0.1,

		__time = 0,
		__timed_events = {},
		__every_events = {},
		__events = {}
	}

--[[#method 1 {
	$typical_constructor(Nanotube())

	Creates or initializes a @Nanotube object.
}]]
function Nanotube:Init()
	self.__time = Time.Get()
end

local function compare_hooks(a, b)
	return a[2] < b[2]
end

--[[#method 2 {
	object public self Nanotube:On(@string name, @function method, [@number priority])
		required name: The name of the event to hook to.
		required method: The @function to call when the event fires.
		optional priority: The priority for this function call.

	Hook up to an event with a method. An alias to `Hook`.
}]]
function Nanotube:On(name, method, priority)
	return self:Hook(name, method, priority)
end

--[[#method 2 {
	object public self Nanotube:Once(@string name, @function method, [@number priority])
		required name: The name of the event to hook to.
		required method: The @function to call when the event fires.
		optional priority: The priority for this function call.

	Hook up to an event with a method called only once.
}]]
function Nanotube:Once(name, method, priority)
	return self:Hook(name, method, priority, true)
end

--[[#method 2.1 {
	object public self Nanotube:After(@unumber seconds, @function method)
		required seconds: The seconds to wait before firing the method.
		required method: The method to call.

	Call the method once after a number of seconds have elapsed.
}]]
function Nanotube:After(seconds, method)
	table.insert(self.__timed_events, {method, Time.Get() + seconds})

	return self
end

--[[#method 2.1 {
	object public self Nanotube:At(@unumber time, @function method)
		required time: The time to fire the method at.
		required method: The method to call.

	Call the method once at an exact time relative to the application timer.
}]]
function Nanotube:At(seconds, method)
	table.insert(self.__timed_events, {method, seconds})

	return self
end

--[[#method 2.2 {
	object public self Nanotube:Every(@unumber period, @function method)
		required period: How many seconds should elapse between callings of the method.
		required method: The method to call.

	Call the method every time a number of seconds have elapsed.
}]]
function Nanotube:Every(period, method)
	table.insert(self.__every_events, {method, period, Time.Get() + period})

	return self
end

--[[#method {
	object public self Nanotube:Hook(@string name, @function method, [@number priority])
		required name: The name of the event to hook to.
		required method: The @function to call when the event fires.
		optional priority: The priority for this function call.

	Generic hook method used by `Once` and `On`.
}]]
function Nanotube:Hook(name, method, priority, once)
	local container = self.__events[name]

	if (not container) then
		container = {}
		self.__events[name] = container
	end

	priority = priority or 0

	table.insert(container, {method, priority, once})
	table.sort(container, compare_hooks)

	return self
end

--[[#method 1.1 {
	object public @unumber Nanotube:Fire(@string name, ...)
		required name: The name of the event to fire.
		optional ...: The arguments to pass to handlers for this event.

	Fires an event by name and passes parameters to the handlers registered to it.

	Returns the number of handlers that were triggered by this event.
}]]
function Nanotube:Fire(name, ...)
	local container = self.__events[name]

	if (not container) then
		return 0
	end

	local count = 0
	local remove = {}
	for key, hooked in ipairs(container) do
		local result = hooked[1](...)
		count = count + 1

		if (hooked[3] or result == "unhook") then
			table.insert(remove, key)
		end
	end

	for i, key in ipairs(remove) do
		table.remove(container, key)
	end

	return count
end

--[[#method {
	object public self Nanotube:Step(...)
		required ...: Arguments to pass to the "Step" event

	Step the loop forward a single iteration and calls any outstanding events.
}]]
function Nanotube:Step(...)
	self:Fire("Step", ...)
	local t = Time.Get()

	local remove = {}
	for key, hooked in ipairs(self.__timed_events) do
		if (t >= hooked[2]) then
			hooked[1](...)

			table.insert(remove, key)
		end
	end

	for i, key in ipairs(remove) do
		table.remove(self.__timed_events, key)
	end

	remove = {}
	for key, hooked in ipairs(self.__every_events) do
		if (t >= hooked[3]) then
			hooked[3] = t + hooked[2]
			local result = hooked[1](...)

			if (result == "unhook") then
				table.insert(remove, key)
			end
		end
	end

	for i, key in ipairs(remove) do
		table.remove(self.__every_events, key)
	end

	return self
end

--[[#method {
	object public self Nanotube:Stop()

	Break out of a loop started by Nanotube:Loop()
}]]
function Nanotube:Stop()
	self.__stop = true

	return self
end

--[[#method {
	object public self Nanotube:Loop()

	Starts an event loop that automatically calls events.
}]]
function Nanotube:Loop()
	self.__stop = false

	self:Fire("Start")

	while (not self.__stop) do
		self:Step()

		if (self.UseSleep) then
			Carbon.Time.Sleep(self.StepPeriod)
		end
	end

	self:Fire("Stop")

	return self
end

--[[#property public @Nanotube Nanotube.Global {
	A global Nanotube instance for use as a singleton.
}]]
Nanotube.Global = CopyBarrier:New(Nanotube:New())

Carbon.Metadata:RegisterMethods(Nanotube, self)

return Nanotube