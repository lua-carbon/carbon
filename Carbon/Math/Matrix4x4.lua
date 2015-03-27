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

function Matrix4x4:RotateXInPlace(t, out)
	return self:RotateX(t, self)
end

function Matrix4x4:RotateX(t, out)
	return self:MultiplyLooseMatrix(self:LooseRotationX(t, out))
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

function Matrix4x4:RotateYInPlace(t)
	return self:RotateY(t, self)
end

function Matrix4x4:RotateY(t, out)
	return self:MultiplyLooseMatrix(self:LooseRotationY(t, out))
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

function Matrix4x4:RotateZInPlace(t)
	return self:RotateZ(t, self)
end

function Matrix4x4:RotateZ(t, out)
	return self:MultiplyLooseMatrix(self:LooseRotationZ(t, out))
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