--[[
	Carbon for Lua
	#class Math.Matrix4x4
	#inherits Math.Matrix3x3, Math.Matrix

	#description {
		A 4x4 row-major matrix.
	}
]]

local Carbon = (...)
local Quaternion = Carbon.Math.Quaternion

local Matrix4x4, except = Carbon.Math.Matrix:Generate(4, 4)

local sin, cos = math.sin, math.cos

if (not Matrix4x4) then
	if (except.Is[Carbon.Exceptions.CodeGenerationException]) then
		print(except.GeneratedCode)
	end
	
	Carbon.Error(except)
end

-- We want all the methods from Matrix3x3 too, since they're reusable.
Matrix4x4:Inherits(Carbon.Math.Matrix3x3)

--[[#method 2 {
	class public @loose<Matrix4x4> Matrix4x4:NewLooseFromLooseQuaternion(@loose<@Quaternion> quaternion)
		required quaternion: The quaternion, in loose form, to convert.

	Takes a loose @Quaternion and returns a loose rotation matrix from it.
}]]
function Matrix4x4:NewLooseFromLooseQuaternion(x, y, z, w)
	return
		w^2+x^2-y^2-z^2, 2*x*y-2*w*z, 2*x*z+2*w*y, 0,
		2*x*y+2*w*z, w^2-x^2+y^2-z^2, 2*y*z+2*w*z, 0,
		2*x*z-2*w*y, 2*y*z-2*w*z, w^2-x^2-y^2+z^2, 0,
		0, 0, 0, 1
end

--[[#method 2 {
	class public @loose<Matrix4x4> Matrix4x4:NewLooseFromQuaternion(@Quaternion quaternion)
		required quaternion: The quaternion to convert.

	Takes a @Quaternion and returns a loose rotation matrix from it.
}]]
function Matrix4x4:NewLooseFromQuaternion(quaternion)
	return self:NewLooseFromLooseQuaternion(quaternion[1], quaternion[2], quaternion[3], quaternion[4])
end

--[[#method 2 {
	class public @Matrix4x4 Matrix4x4:NewFromLooseQuaternion(@loose<@Quaternion> quaternion)
	-alias: class public @Matrix4x4 Matrix4x4:PlacementNewFromLooseQuaternion(@Matrix4x4? out, @loose<@Quaternion> quaternion)
	-alias: object public @Matrix4x4 Matrix4x4:InitFromLooseQuaternion(@loose<@Quaternion> quaternion)
	-alias: class public @Matrix4x4 Matrix4x4:InitFromQuaternion(@Quaternion quaternion)
	-alias: class public @Matrix4x4 Matrix4x4:PlacementNewFromQuaternion(@Matrix4x4? out, @Quaternion quaternion)
	-alias: object public @Matrix4x4 Matrix4x4:InitFromQuaternion(@Quaternion quaternion)
		required quaternion: The quaternion to initialize the matrix with.

	Creates a new @Matrix4x4
}]]
function Matrix4x4:InitFromLooseQuaternion(x, y, z, w)
	return self:Init(self:NewLooseFromLooseQuaternion(x, y, z, w))
end
function Matrix4x4:NewFromLooseQuaternion(x, y, z, w)
	return self:New(self:NewLooseFromLooseQuaternion(x, y, z, w))
end
function Matrix4x4:PlacementNewFromLooseQuaternion(out, x, y, z, w)
	return self:PlacementNew(out, self:NewLooseFromLooseQuaternion(x, y, z, w))
end

function Matrix4x4:InitFromQuaternion(quaternion)
	return self:Init(self:NewLooseFromLooseQuaternion(quaternion:GetComponents()))
end
function Matrix4x4:NewFromQuaternion(quaternion)
	return self:New(self:NewLooseFromLooseQuaternion(quaternion:GetComponents()))
end
function Matrix4x4:PlacementNewFromQuaternion(out, quaternion)
	return self:PlacementNew(out, self:NewLooseFromLooseQuaternion(quaternion:GetComponents()))
end

--[[#method {
	class public @Matrix4x4 Matrix4x4:Translation(@number x, @number y, @number z, [@Matrix4x4 out])
	-alias: object public @Matrix4x4 Matrix4x4:Translate(@number x, @number y, @number z, [@Matrix4x4 out])
		required x: The x coordinate of the translation.
		required y: The y coordinate of the translation.
		required z: The z coordinate of the translation.
		optional out: Where to put the data for the translation.

	Creates a translation matrix.
	The `Translate` form offsets from an existing matrix.
}]]
function Matrix4x4:Translate(x, y, z, out)
	return self:MultiplyLooseMatrix(4, 4,
		1, 0, 0, x,
		0, 1, 0, y,
		0, 0, 1, z,
		0, 0, 0, 1,
		out
	)
end
function Matrix4x4:Translation(x, y, z, out)
	return Matrix4x4:PlacementNew(out,
		1, 0, 0, x,
		0, 1, 0, y,
		0, 0, 1, z,
		0, 0, 0, 1
	)
end

--[[#method {
	class public @Matrix4x4 Matrix4x4:Rotation(@number x, @number y, @number z, [@Matrix4x4 out])
	-alias: object public @Matrix4x4 Matrix4x4:Rotate(@number x, @number y, @number z, [@Matrix4x4 out])
	-alias: object public self Matrix4x4:Rotate!(@number x, @number y, @number z)
		required x: The x component of the rotation.
		required y: The y component of the rotation.
		required z: The z component of the rotation.
		optional out: Where to put the data for the rotation.

	Creates a rotation matrix with the given Euler angles.
}]]
function Matrix4x4:Rotation(x, y, z, out)
	return
		self:RotationX(x, out)
		:RotateYInPlace(y)
		:RotateZInPlace(z)
end
function Matrix4x4:Rotate(x, y, z, out)
	return
		self:RotationX(x, out)
		:RotateYInPlace(y)
		:RotateZInPlace(z)
end

function Matrix4x4:RotateInPlace(x, y, z)
	return self:Rotate(x, y, z, self)
end

function Matrix4x4:RotateX(t, out)
	return self:MultiplyLooseMatrix(self:LooseRotationX(t, out))
end

function Matrix4x4:RotateXInPlace(t, out)
	return self:RotateX(t, self)
end

function Matrix4x4:LooseRotationX(t, ...)
	return 4, 4,
		1, 0, 0, 0,
		0, cos(t), -sin(t), 0,
		0, sin(t), cos(t), 0,
		0, 0, 0, 1, ...
end

function Matrix4x4:RotationX(t, out)
	return self:PlacementNewFromLoose(out, self:LooseRotationX(t))
end

function Matrix4x4:RotateY(t, out)
	return self:MultiplyLooseMatrix(self:LooseRotationY(t, out))
end

function Matrix4x4:RotateYInPlace(t)
	return self:RotateY(t, self)
end

function Matrix4x4:LooseRotationY(t, ...)
	return 4, 4,
		cos(t), 0, sin(t), 0,
		0, 1, 0, 0,
		-sin(t), 0, cos(t), 0,
		0, 0, 0, 1, ...
end

function Matrix4x4:RotationY(t, out)
	return self:PlacementNewFromLoose(out, self:LooseRotationY(t))
end

function Matrix4x4:RotateZ(t, out)
	return self:MultiplyLooseMatrix(self:LooseRotationZ(t, out))
end

function Matrix4x4:RotateZInPlace(t)
	return self:RotateZ(t, self)
end

function Matrix4x4:LooseRotationZ(t, ...)
	return 4, 4,
		cos(t), -sin(t), 0, 0,
		sin(t), cos(t), 0, 0,
		0, 0, 1, 0,
		0, 0, 0, 1, ...
end

function Matrix4x4:RotationZ(t, out)
	return self:PlacementNewFromLoose(out, self:LooseRotationZ(t))
end

function Matrix4x4:LooseScaling(x, y, z)
	return 4, 4,
		x, 0, 0, 0,
		0, y, 0, 0,
		0, 0, z, 0,
		0, 0, 0, 1
end

function Matrix4x4:Scaling(x, y, z, out)
	return self:PlacementNewFromLoose(out, self:LooseScaling(x, y, z))
end

function Matrix4x4:Scale(x, y, z, out)
	return self:MultiplyLooseMatrix(4, 4,
		x, 0, 0, 0,
		0, y, 0, 0,
		0, 0, z, 0,
		0, 0, 0, 0,
		out
	)
end

return Matrix4x4