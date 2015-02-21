--[[
	Carbon for Lua
	Nanotube Class

	Funnels events and provides an event loop.

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
local OOP = Carbon.OOP
local Time = Carbon.Time
local ForwardPointer = Carbon.ForwardPointer

local Nanotube = OOP:Class()
	:Members {
		UseSleep = true,
		StepPeriod = 0.1,

		__time = 0,
		__timed_events = {},
		__every_events = {},
		__events = {}
	}

function Nanotube:_init()
	self.__time = Time.Get()
end

local function compare_hooks(a, b)
	return a[2] < b[2]
end

--[[
	Hook up to an event with a method.
]]
function Nanotube:On(name, method, priority)
	return self:Hook(name, method, priority)
end

--[[
	Hook up to an event with a method called only once.
]]
function Nanotube:Once(name, method, priority)
	return self:Hook(name, method, priority, true)
end

--[[
	Call the method after a number of seconds have elapsed.
]]
function Nanotube:After(time, method)
	table.insert(self.__timed_events, {method, Time.Get() + time})
end

--[[
	Call the method at an exact time.
]]
function Nanotube:At(time, method)
	table.insert(self.__timed_events, {method, time})
end

--[[
	Call the method every time this number of seconds have elapsed.
]]
function Nanotube:Every(period, method)
	table.insert(self.__every_events, {method, period, Time.Get() + period})
end

--[[
	Generic hook method used by Once and On.
]]
function Nanotube:Hook(name, method, priority, once)
	local container = self.__events[name]

	if (not container) then
		container = {}
		self.__events[name] = container
	end

	priority = priority or 0

	table.insert(container, {method, priority, once})
	table.sort(container, compare_hooks)
end

--[[
	Fire an event by name and pass parameters.
]]
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

--[[
	Step the loop forward a single iteration.
]]
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
end

--[[
	Break out of a loop started by Nanotube:Loop()
]]
function Nanotube:Stop()
	self.__stop = true
end

--[[
	Start a loop that can be broken out of.
]]
function Nanotube:Loop()
	self.__stop = false

	self:Fire("Start")

	while (not self.__stop) do
		self:Step()

		if (self.UseSleep) then
			Carbon.Sleep(self.StepPeriod)
		end
	end

	self:Fire("Stop")
end

-- Singleton instance through a ForwardPointer
Nanotube.Global = ForwardPointer:New(Nanotube:New())

return Nanotube