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

function Matrix4x4:Translate(x, y, z, out)
	-- todo: requires MultiplyLooseMatrix implementation
end

function Matrix4x4:Translation(x, y, z, out)
	return Matrix4x4:PlacementNew(out,
		1, 0, 0, x,
		0, 1, 0, y,
		0, 0, 1, z,
		0, 0, 0, 1
	)
end

function Matrix4x4:Rotation(x, y, z, out)
	-- todo: requires MultiplyLooseMatrix implementation
end

function Matrix4x4:Rotate(x, y, z, out)
	-- todo: requires MultiplyLooseMatrix implementation
end

function Matrix4x4:RotateX(t, out)
	-- todo: requires MultiplyLooseMatrix implementation
end

function Matrix4x4:LooseRotationX(t)
	return
	1, 0, 0, 0,
	0, cos(t), -sin(t), 0,
	0, sin(t), cos(t), 0,
	0, 0, 0, 1
end

function Matrix4x4:RotationX(t, out)
	return self:PlacementNew(out, self:LooseRotationX(t))
end

function Matrix4x4:RotateY(t, out)
	-- todo: requires MultiplyLooseMatrix implementation
end

function Matrix4x4:LooseRotationY(t)
	return
	cos(t), 0, sin(t), 0,
	0, 1, 0, 0,
	-sin(t), 0, cos(t), 0,
	0, 0, 0, 1
end

function Matrix4x4:RotationY(t, out)
	return self:PlacementNew(out, self:LooseRotationY(t))
end

function Matrix4x4:RotateZ(t, out)
	-- todo: requires MultiplyLooseMatrix implementation
end

function Matrix4x4:LooseRotationZ(t)
	return
	cos(t), -sin(t), 0, 0,
	sin(t), cos(t), 0, 0,
	0, 0, 1, 0,
	0, 0, 0, 1
end

function Matrix4x4:RotationZ(t, out)
	return self:PlacementNew(out, self:LooseRotationZ(t))
end

return Matrix4x4