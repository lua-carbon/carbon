local Carbon = (...)

local ffi = require("ffi")

ffi.cdef([[
typedef struct {
	float __[16];
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
			return CMatrix4x4[key] or self.__[key - 1]
		end,

		__newindex = function(self, key, value)
			self.__[key - 1] = value
		end,

		__tostring = Carbon.Math.Matrix4x4.__metatable.__tostring
	}

function CMatrix4x4:NewZero()
	self = self:New(
		0, 0, 0, 0,
		0, 0, 0, 0,
		0, 0, 0, 0,
		0, 0, 0, 0
	)

	return self
end

return CMatrix4x4