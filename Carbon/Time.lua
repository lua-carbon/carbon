--[[
	Carbon for Lua
	Time Utilities

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

-- Discover a sleep function for us to use
if (love and love.timer) then
	Time.Sleep = love.timer.sleep
elseif (ffi) then
	if (ffi.os == "Windows") then
		ffi.cdef([[
		void Sleep(unsigned long milliseconds);
		unsigned int timeBeginPeriod(unsigned int uperiod);
		]])

		ffi.load("winmm.dll").timeBeginPeriod(1)

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
	Time.Sleep = function(s)
		socket.select(nil, nil, s)
	end
else
	Time.Sleep = function(s)
	end
end

-- Discover the timer with the higest resolution
if (love and love.timer) then
	Time.GetTime = love.timer.getTime
elseif (socket) then
	Time.GetTime = socket.gettime
else
	Time.GetTime = os.clock
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