--[[
	Carbon for Lua
	#class Math.CMatrix4x4
	#inherits Math.Matrix4x4

	#description {
		An FFI-backed Matrix4x4 utilizing the same API.
	}
]]

local Carbon = (...)

if (not Carbon.Support.jit) then
	return nil
end

local ffi = require("ffi")

ffi.cdef([[
typedef struct {
	double __[16];
} __C_mat4;
]])

local CMatrix4x4
CMatrix4x4 = Carbon.OOP:Class()
	:Inherits(Carbon.Math.Matrix4x4)
	:Attributes {
		EXT_LJ_Struct = "__C_mat4"
	}
	:Metatable {
		__index = function(self, key)
			return CMatrix4x4.__ext_ffi_index[key] or tonumber(key) and self.__[key - 1]
		end,

		__newindex = function(self, key, value)
			self.__[key - 1] = value
		end,

		__tostring = Carbon.Math.Matrix4x4.__metatable.__tostring
	}

function CMatrix4x4:GetNative()
	return self
end

function CMatrix4x4:ToNative()
	return self.class:New(self:GetComponents())
end

return CMatrix4x4