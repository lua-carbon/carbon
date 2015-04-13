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

--[[#method {
	object public @Vector3 Vector3:CrossMultiply(@Vector3 other, [@Vector3 out])
		required other: The Vector3 to find the cross product with.
		optional out: Where to put the resulting data.

	Calculates the cross product of two vectors, optionally putting the data into an existing @Vector3.
}]]
function Vector3:CrossMultiply(other, out)
	return self.class:PlacementNew(out,
		self[2] * other[3] - self[3] * other[2],
		self[3] * other[1] - self[1] * other[3],
		self[1] * other[2] - self[2] * other[1]
	)
end

return Vector3