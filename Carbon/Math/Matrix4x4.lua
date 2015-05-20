--[[
	Carbon for Lua
	#class Math.Matrix4x4
	#inherits Math.Matrix3x3, Math.Matrix

	#description {
		A 4x4 row-major matrix.
	}

	#alias Quaternion Math.Quaternion
]]

local Carbon = (...)
local Vector3 = Carbon.Math.Vector3
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
	local tx = x + x
	local ty = y + y
	local tz = z + z
	
	local twx = tx * w
	local twy = ty * w
	local twz = tz * w

	local txx = tx * x
	local txy = ty * x
	local txz = tz * x

	local tyy = ty * y
	local tyz = tz * y
	local tzz = tz * z

	return 4, 4,
		1 - (tyy + tzz), txy - twz, txz + twy, 0,
		txy + twz, 1 - (txx + tzz), tyz - twx, 0,
		txz - twy, tyz + twx, 1 - (txx + tyy), 0,
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
	$constructor_init_pair(FromLooseQuaternion Matrix4x4(@loose<@Quaternion> quaternion))
		required quaternion: The quaternion to initialize the matrix with.

	Creates a new @Matrix4x4 from a @Quaternion.
}]]
function Matrix4x4:InitFromLooseQuaternion(x, y, z, w)
	return self:Init(self:NewLooseFromLooseQuaternion(x, y, z, w))
end
function Matrix4x4:NewFromLooseQuaternion(x, y, z, w)
	return self:New(self:NewLooseFromLooseQuaternion(x, y, z, w))
end

--[[#method 2 {
	$constructor_init_pair(FromQuaternion Matrix4x4(@Quaternion quaternion))
		required quaternion: The quaternion to initialize the matrix with.

	Creates a new @Matrix4x4 from a @Quaternion.
}]]
function Matrix4x4:InitFromQuaternion(quaternion)
	return self:Init(self:NewLooseFromLooseQuaternion(quaternion:GetComponents()))
end
function Matrix4x4:NewFromQuaternion(quaternion)
	return self:NewFromLoose(self:NewLooseFromLooseQuaternion(quaternion:GetComponents()))
end

--[[#method 2 {
	class public @Matrix4x4 Matrix4x4:NewOrthographic(@number l, @number r, @number t, @number b, @number near, @number far)
		required l: The left edge of the projection.
		required r: The right edge of the projection.
		required t: The top edge of the projection.
		required b: The bottom edge of the projection.
		required near: The near plane of the projection.
		required far: The far plane of the projection.

	Creates an orthographic projection matrix with the given properties
}]]
function Matrix4x4:NewOrthographic(left, right, top, bottom, near, far)
	return self:New(
		2 / (right - left), 0, 0, -((right + left)/(right - left)),
		0, 2 / (top - bottom), 0, -((top + bottom)/(top - bottom)),
		0, 0, -2 / (far - near), 0,
		0, 0, -(far + near)/(far - near), 1
	)
end

--[[#method 2 {
	class public @Matrix4x4 Matrix4x4:NewPerspective(@number fov, @number aspect, @number near, @number far)
		required fov: The field of view in radians.
		required aspect: The aspect ratio of the observer.
		required near: The near plane of the projection.
		required far: The far plane of the projection.

	Creates a perspective matrix with the given properties.
}]]
function Matrix4x4:NewPerspective(fov, aspect, near, far)
	local t = math.tan(fov / 2)

	return self:New(
		1 / (aspect * t), 0, 0, 0,
		0, 1 / t, 0, 0,
		0, 0, -(far + near)/(far - near), -1,
		0, 0, -(2 * far * near)/(far - near), 1
	)
end

--[[#method 2 {
	class public @Matrix4x4 Matrix4x4:NewLookAt(@Vector3 eye, @Vector3 center, @Vector3 up)
		required eye: The position of the observer.
		required center: The focus of the observer.
		required up: The upwards direction for the observer.

	Creates a projection to look at a point from another.
}]]
function Matrix4x4:NewLookAt(eye, center, up)
	local f = center:SubtractVector(eye):NormalizeInPlace()
	local s = f:CrossMultiply(up):NormalizeInPlace()
	local u = s:CrossMultiply(f):NormalizeInPlace()

	return self:New(
		s[1], s[2], s[3], 0,
		u[1], u[2], u[3], 0,
		-f[1], -f[2], -f[3], 0,
		-s:DotMultiply(eye), -u:DotMultiply(eye), f:DotMultiply(eye), 1
	)
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
		1, 0, 0, 0,
		0, 1, 0, 0,
		0, 0, 1, 0,
		x, y, z, 1,
		out
	)
end
function Matrix4x4:Translation(x, y, z, out)
	return Matrix4x4:PlacementNew(out,
		1, 0, 0, 0,
		0, 1, 0, 0,
		0, 0, 1, 0,
		x, y, z, 1
	)
end
function Matrix4x4:TranslateInPlace(x, y, z)
	return self:Translate(x, y, z, self)
end

--[[#method {
	class public @Matrix4x4 Matrix4x4:Rotation(@number x, @number y, @number z, [@Matrix4x4 out])
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

--[[#method {
	object public @Matrix4x4 Matrix4x4:Rotate(@number x, @number y, @number z, [@Matrix4x4 out])
		required x: The x component of the rotation.
		required y: The y component of the rotation.
		required z: The z component of the rotation.
		optional out: Where to put the data for the rotation.

	Rotates the @Matrix4x4 and outputs its data to `out`, or a new Matrix4x4 if not given.
}]]
function Matrix4x4:Rotate(x, y, z, out)
	return
		self:RotateX(x, out)
		:RotateYInPlace(y)
		:RotateZInPlace(z)
end

--[[#method {
	object public self Matrix4x4:Rotate!(@number x, @number y, @number z)
	-alias: object public self Matrix4x4:RotateInPlace(@number x, @number y, @number z)
		required x: The x component of the rotation.
		required y: The y component of the rotation.
		required z: The z component of the rotation.

	Rotates the @Matrix4x4 in place.
}]]
function Matrix4x4:RotateInPlace(x, y, z)
	return self:Rotate(x, y, z, self)
end

--[[#method 10 {
	object public @Matrix4x4 Matrix4x4:RotateX(@number t, [@Matrix4x4 out])
		required t: The amount to rotate, in radians.
		optional out: Where to put the resulting data.

	Rotates the matrix around the X axis.
}]]
function Matrix4x4:RotateX(t, out)
	return self:MultiplyLooseMatrix(self:LooseRotationX(t, out))
end

--[[#method 10 {
	object public self Matrix4x4:RotateX!(@number t)
	-alias: object public self Matrix4x4:RotateXInPlace(@number t)
		required t: The amount to rotate, in radians.

	Rotates the matrix around the X axis in place.
}]]
function Matrix4x4:RotateXInPlace(t, out)
	return self:RotateX(t, self)
end

--[[#method 10 {
	class public @loose<@Matrix4x4> Matrix4x4:LooseRotationX(@number t, ...)
		required t: The amount to rotate, in radians.
		optional ...: Data to pipe through the method.

	Returns a @loose<@Matrix4x4> representing a rotation `t` radians around the X axis.
}]]
function Matrix4x4:LooseRotationX(t, ...)
	return 4, 4,
		1, 0, 0, 0,
		0, cos(t), -sin(t), 0,
		0, sin(t), cos(t), 0,
		0, 0, 0, 1, ...
end

--[[#method 10 {
	class public @Matrix4x4 Matrix4x4:RotationX(@number t, ...)
		required t: The amount to rotate, in radians.
		optional ...: Data to pipe through the method.

	Returns a @Matrix4x4 representing a rotation `t` radians around the X axis.
}]]
function Matrix4x4:RotationX(t, out)
	return self:PlacementNewFromLoose(out, self:LooseRotationX(t))
end

--[[#method 11 {
	object public @Matrix4x4 Matrix4x4:RotateY(@number t, [@Matrix4x4 out])
		required t: The amount to rotate, in radians.
		optional out: Where to put the resulting data.

	Rotates the matrix around the Y axis.
}]]
function Matrix4x4:RotateY(t, out)
	return self:MultiplyLooseMatrix(self:LooseRotationY(t, out))
end

--[[#method 11 {
	object public self Matrix4x4:RotateY!(@number t)
	-alias: object public self Matrix4x4:RotateXInPlace(@number t)
		required t: The amount to rotate, in radians.

	Rotates the matrix around the Y axis in place.
}]]
function Matrix4x4:RotateYInPlace(t)
	return self:RotateY(t, self)
end

--[[#method 11 {
	class public @loose<@Matrix4x4> Matrix4x4:LooseRotationY(@number t, ...)
		required t: The amount to rotate, in radians.
		optional ...: Data to pipe through the method.

	Returns a @loose<@Matrix4x4> representing a rotation `t` radians around the Y axis.
}]]
function Matrix4x4:LooseRotationY(t, ...)
	return 4, 4,
		cos(t), 0, sin(t), 0,
		0, 1, 0, 0,
		-sin(t), 0, cos(t), 0,
		0, 0, 0, 1, ...
end

--[[#method 11 {
	class public @Matrix4x4 Matrix4x4:RotationY(@number t, ...)
		required t: The amount to rotate, in radians.
		optional ...: Data to pipe through the method.

	Returns a @Matrix4x4 representing a rotation `t` radians around the Y axis.
}]]
function Matrix4x4:RotationY(t, out)
	return self:PlacementNewFromLoose(out, self:LooseRotationY(t))
end

--[[#method 12 {
	object public @Matrix4x4 Matrix4x4:RotateZ(@number t, [@Matrix4x4 out])
		required t: The amount to rotate, in radians.
		optional out: Where to put the resulting data.

	Rotates the matrix around the Z axis.
}]]
function Matrix4x4:RotateZ(t, out)
	return self:MultiplyLooseMatrix(self:LooseRotationZ(t, out))
end

--[[#method 12 {
	object public self Matrix4x4:RotateZ!(@number t)
	-alias: object public self Matrix4x4:RotateXInPlace(@number t)
		required t: The amount to rotate, in radians.

	Rotates the matrix around the Z axis in place.
}]]
function Matrix4x4:RotateZInPlace(t)
	return self:RotateZ(t, self)
end

--[[#method 12 {
	class public @loose<@Matrix4x4> Matrix4x4:LooseRotationZ(@number t, ...)
		required t: The amount to rotate, in radians.
		optional ...: Data to pipe through the method.

	Returns a @loose<@Matrix4x4> representing a rotation `t` radians around the Z axis.
}]]
function Matrix4x4:LooseRotationZ(t, ...)
	return 4, 4,
		cos(t), -sin(t), 0, 0,
		sin(t), cos(t), 0, 0,
		0, 0, 1, 0,
		0, 0, 0, 1, ...
end

--[[#method 12 {
	class public @Matrix4x4 Matrix4x4:RotationZ(@number t, ...)
		required t: The amount to rotate, in radians.
		optional ...: Data to pipe through the method.

	Returns a @Matrix4x4 representing a rotation `t` radians around the Z axis.
}]]
function Matrix4x4:RotationZ(t, out)
	return self:PlacementNewFromLoose(out, self:LooseRotationZ(t))
end

--[[#method {
	class public @Matrix4x4 Matrix4x4:LooseScaling(@number x, @number y, @number z)
		required x: The amount to scale on the X axis.
		required y: The amount to scale on the Y axis.
		required z: The amount to scale on the Z axis.

	Returns a @loose<@Matrix4x4> representing a scaling transformation.
}]]
function Matrix4x4:LooseScaling(x, y, z)
	return 4, 4,
		x, 0, 0, 0,
		0, y, 0, 0,
		0, 0, z, 0,
		0, 0, 0, 1
end

--[[#method {
	class public @Matrix4x4 Matrix4x4:Scaling(@number x, @number y, @number z)
		required x: The amount to scale on the X axis.
		required y: The amount to scale on the Y axis.
		required z: The amount to scale on the Z axis.

	Returns a @Matrix4x4 representing a scaling transformation.
}]]
function Matrix4x4:Scaling(x, y, z, out)
	return self:PlacementNewFromLoose(out, self:LooseScaling(x, y, z))
end

--[[#method {
	class public @Matrix4x4 Matrix4x4:Scale(@number x, @number y, @number z, [@Matrix4x4 out])
		required x: The amount to scale on the X axis.
		required y: The amount to scale on the Y axis.
		required z: The amount to scale on the Z axis.
		optional out: Where to put the resulting data.

	Scales the Matrix4x4, optionally outputting to an existing @Matrix4x4.
}]]
function Matrix4x4:Scale(x, y, z, out)
	return self:MultiplyLooseMatrix(4, 4,
		x, 0, 0, 0,
		0, y, 0, 0,
		0, 0, z, 0,
		0, 0, 0, 1,
		out
	)
end

--[[#method {
	class public self Matrix4x4:Scale!(@number x, @number y, @number z)
	-alias: class public self Matrix4x4:ScaleInPlace(@number x, @number y, @number z)
		required x: The amount to scale on the X axis.
		required y: The amount to scale on the Y axis.
		required z: The amount to scale on the Z axis.

	Scales the Matrix4x4 in place.
}]]
function Matrix4x4:ScaleInPlace(x, y, z)
	return self:Scale(x, y, z, self)
end

--[[#method {
	object public @number Matrix4x4:GetDeterminant()

	Returns the determinant of the matrix.
}]]
function Matrix4x4:GetDeterminant()
	local
		a11, a12, a13, a14,
		a21, a22, a23, a24,
		a31, a32, a33, a34,
		a41, a42, a43, a44 = self:GetComponents()

	return
		a11*a22*a33*a44 + a11*a23*a34*a42 + a11*a24*a32*a43
		+ a12*a21*a34*a43 + a12*a23*a31*a44 + a12*a24*a33*a41
		+ a13*a21*a32*a44 + a13*a22*a34*a41 + a13*a24*a31*a42
		+ a14*a21*a33*a42 + a14*a22*a31*a43 + a14*a23*a32*a41
		- a11*a22*a34*a43 - a11*a23*a32*a44 - a11*a24*a33*a42
		- a12*a21*a33*a44 - a12*a23*a34*a41 - a12*a24*a31*a43
		- a13*a21*a34*a42 - a13*a22*a31*a44 - a13*a24*a32*a41
		- a14*a21*a32*a43 - a14*a22*a33*a41 - a14*a23*a31*a42
end

--[[#method {
	object public @Matrix4x4 Matrix4x4:GetInverse([@Matrix4x4 out])
		optional out: Where to put the data, a new matrix if not specified.

	Yields the inverse of the matrix, optionally outputting into an existing matrix.
}]]
function Matrix4x4:GetInverse(out)
	local
		a11, a12, a13, a14,
		a21, a22, a23, a24,
		a31, a32, a33, a34,
		a41, a42, a43, a44 = self:GetComponents()

	local det = self:GetDeterminant()

	if (det == 0) then
		return self:Copy()
	end

	local b11 = (a22*a33*a44 + a23*a34*a42 + a24*a32*a43 - a22*a34*a43 - a23*a32*a44 - a24*a33*a42) / det
	local b12 = (a12*a34*a43 + a13*a32*a44 + a14*a33*a42 - a12*a33*a44 - a13*a34*a42 - a14*a32*a43) / det
	local b13 = (a12*a23*a44 + a13*a24*a42 + a14*a22*a43 - a12*a24*a43 - a13*a22*a44 - a14*a23*a42) / det
	local b14 = (a12*a24*a33 + a13*a22*a34 + a14*a23*a32 - a12*a23*a34 - a13*a24*a32 - a14*a22*a33) / det

	local b21 = (a21*a34*a43 + a23*a31*a44 + a24*a33*a41 - a21*a33*a44 - a23*a34*a41 - a24*a31*a43) / det
	local b22 = (a11*a33*a44 + a13*a34*a41 + a14*a31*a43 - a11*a34*a43 - a13*a31*a44 - a14*a33*a41) / det
	local b23 = (a11*a24*a43 + a13*a21*a44 + a14*a23*a41 - a11*a23*a44 - a13*a24*a41 - a14*a21*a43) / det
	local b24 = (a11*a23*a34 + a13*a24*a31 + a14*a21*a33 - a11*a24*a33 - a13*a21*a34 - a14*a23*a31) / det

	local b31 = (a21*a32*a44 + a22*a34*a41 + a24*a31*a42 - a21*a34*a42 - a22*a31*a44 - a24*a32*a41) / det
	local b32 = (a11*a34*a42 + a12*a31*a44 + a14*a32*a41 - a11*a32*a44 - a12*a34*a41 - a14*a31*a42) / det
	local b33 = (a11*a22*a44 + a12*a24*a41 + a14*a21*a42 - a11*a24*a42 - a12*a21*a44 - a14*a22*a41) / det
	local b34 = (a11*a24*a32 + a12*a21*a34 + a14*a22*a31 - a11*a22*a34 - a12*a24*a31 - a14*a21*a32) / det

	local b41 = (a21*a33*a42 + a22*a31*a43 + a23*a32*a41 - a21*a32*a43 - a22*a33*a41 - a23*a31*a42) / det
	local b42 = (a11*a32*a43 + a12*a33*a41 + a13*a31*a42 - a11*a33*a42 - a12*a31*a43 - a13*a32*a41) / det
	local b43 = (a11*a23*a42 + a12*a21*a43 + a13*a22*a41 - a11*a22*a43 - a12*a23*a41 - a13*a21*a42) / det
	local b44 = (a11*a22*a33 + a12*a23*a31 + a13*a21*a32 - a11*a23*a32 - a12*a21*a33 - a13*a22*a31) / det

	return self.class:PlacementNew(out,
		b11, b12, b13, b14,
		b21, b22, b23, b24,
		b31, b32, b33, b34,
		b41, b42, b43, b44
	)
end

return Matrix4x4