--[[
	Carbon for Lua
	#class Math.Vector3
	#inherits Math.Vector<3>

	#description {
		A 3-length vector.

		The loose form of a @Vector3, `@loose<@Vector3>` is of the form `(x, y, z)`.
	}
]]

local Carbon = (...)

local Vector3, except = Carbon.Math.Vector:Generate(3)

if (not Vector3) then
	if (except.Is[Carbon.Exceptions.CodeGenerationException]) then
		print(except.GeneratedCode)
	end
	
	Carbon.Error(except)
end

function Vector3:CrossProduct(other, out)
	self.class:PlacementNew(out,
		self[2] * other[3] - self[3] * other[2],
		self[3] * other[1] - self[1] * other[3],
		self[1] * other[2] - self[2] * other[1]
	)
end

return Vector3