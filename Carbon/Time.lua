--[[
	Carbon for Lua
	Time Utilities
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
			local whole = math.floor(s)
			local fract = s - whole
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

-- Convert weeks to seconds
function Time.Weeks(w)
	return w * 604800
end

-- Convert days to seconds
function Time.Days(d)
	return d * 86400
end

-- Convert hours to seconds
function Time.Hours(h)
	return h * 3600
end

-- Convert minutes to seconds
function Time.Minutes(m)
	return m * 60
end

-- Convert seconds to seconds
-- This isn't very useful, is it?
function Time.Seconds(s)
	return s
end

-- Convert milliseconds to seconds
function Time.Milliseconds(s)
	return s / 1000
end

-- Convert nanoseconds to seconds
function Time.Nanoseconds(s)
	return s / 1000000
end

return Time