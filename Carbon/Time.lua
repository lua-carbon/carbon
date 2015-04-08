--[[
	Carbon for Lua
	#class Time

	#description {
		Provides utilities for working with time.
	}
]]

local Carbon = (...)
local Time = {}

-- Check for LOVE support via Graphene (0.9.0+)
local G = Carbon:GetGrapheneCore()
local love = G.Support.love and love

local ok, ffi = pcall(require, "ffi")
if (not ok) then
	ffi = nil
end

local ok, socket = pcall(require, "socket")
if (not ok) then
	socket = nil
end

-- Discover a timer and sleep function
--[[
	#method 1 {
		class public @void Time.Sleep(@unumber seconds)
			required seconds: The number of seconds to sleep.

		Sleeps using the system timer.
		If no timer providers are available, will not do anything.
	}

	#method 0.9 {
		class public @unumber Time.Get()

		Returns a benchmarking time using the highest precision internal timer.
	}
]]
if (love and love.timer) then
	Time.Sleep = love.timer.sleep
	Time.Get = love.timer.getTime
elseif (ffi) then
	if (ffi.os == "Windows") then
		ffi.cdef([[
		int __stdcall QueryPerformanceFrequency(int64_t* lpFrequency);
		int __stdcall QueryPerformanceCounter(int64_t* lpPerformanceCount);
		uint32_t __stdcall GetTickCount();

		void Sleep(unsigned long milliseconds);
		unsigned int timeBeginPeriod(unsigned int uperiod);
		]])

		ffi.load("winmm.dll").timeBeginPeriod(1)

		local s_frequency = ffi.new("int64_t[1]")
		local s_use_qpc = ffi.C.QueryPerformanceFrequency(s_frequency) ~= 0
		local now = ffi.new("int64_t[1]")

		if (s_use_qpc) then
			Time.Get = function()
				ffi.C.QueryPerformanceFrequency(s_frequency)
				ffi.C.QueryPerformanceCounter(now)
				return tonumber(now[0]) / tonumber(s_frequency[0])
			end
		else
			Time.Get = function()
				return ffi.C.GetTickCount()
			end
		end

		Time.Sleep = function(s)
			ffi.C.Sleep(s * 1000)
		end
	else
		ffi.cdef([[
		int usleep(unsigned int usec);
		int sleep(unsigned int sec);
		]])

		Time.Sleep = function(s)
			local whole, fract = math.modf(s)
			ffi.C.sleep(whole)
			ffi.C.usleep(fract * 1000000)
		end
	end
elseif (socket) then
	Time.Get = socket.gettime
	Time.Sleep = function(s)
		socket.select(nil, nil, s)
	end
else
	Time.Sleep = function(s)
	end

	Time.Get = os.clock
end

--[[#method {
	class public @unumber Time.Weeks(@unumber weeks)

	Converts the given number of weeks to seconds.
}]]
function Time.Weeks(w)
	return w * 604800
end

--[[#method {
	class public @unumber Time.Days(@unumber days)

	Converts the given number of days to seconds.
}]]
function Time.Days(d)
	return d * 86400
end

--[[#method {
	class public @unumber Time.Hours(@unumber hours)

	Converts the given number of hours to seconds.
}]]
function Time.Hours(h)
	return h * 3600
end

--[[#method {
	class public @unumber Time.Minutes(@unumber minutes)

	Converts the given number of minutes to seconds.
}]]
function Time.Minutes(m)
	return m * 60
end

--[[#method {
	class public @unumber Time.Seconds(@unumber seconds)

	Converts the given number of seconds to seconds.
	Not very useful.
}]]
function Time.Seconds(s)
	return s
end

--[[#method {
	class public @unumber Time.Milliseconds(@unumber milliseconds)

	Converts the given number of milliseconds to seconds.
}]]
function Time.Milliseconds(ms)
	return ms / 1000
end

--[[#method {
	class public @unumber Time.Nanoseconds(@unumber nanoseconds)

	Converts the given number of nanoseconds to seconds.
}]]
function Time.Nanoseconds(ns)
	return ns / 1000000
end

return Time