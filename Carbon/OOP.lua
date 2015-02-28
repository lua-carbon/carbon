--[[
	Carbon for Lua
	Object Orientation System
]]

local Carbon = (...)

local ok, ffi = pcall(require, "ffi")

if (not ok) then
	ffi = nil
end

local Dictionary = Carbon.Collections.Dictionary
local OOP = {
	__attribute_inheritance = {
		-- Inherited attributes
		InstanceIndirection = true,
		InstancedMetatable = true,
		TemplateHandler = true, -- proposed
		TemplateRequired = true, -- proposed

		-- Not inherited attributes
		SparseInstances = false,
		PooledInstantiation = false,
		PoolSize = false,
		Abstract = false,
		ExplicitInitialization = false,
		EXT_LJ_Struct = false,
	}
}

-- Default attributes for classes and static classes
local default_attributes = {
}

local default_static_attributes = {
}

-- Utility methods
local function handle_indirection(class, instance)
	if (class.__attributes.InstanceIndirection) then
		local internal = instance
		instance = newproxy(true)

		local meta = getmetatable(instance)
		meta.__index = meta.__index or internal
		meta.__newindex = meta.__newindex or internal
		meta.__pairs = meta.__pairs or internal
		meta.__ipairs = meta.__ipairs or internal
	end

	return instance
end

local function apply_metatable(class, instance)
	if (class.__attributes.InstanceIndirection) then
		-- If we wrapped the object in a userdata, we need to apply metatables a little differently.
		Dictionary.ShallowCopy(class.__metatable, getmetatable(instance))
	else
		-- The InstancedMetatable attribute determines whether the metatable
		-- is class-specific or instance-specific.
		if (class.__attributes.InstancedMetatable) then
			setmetatable(instance, Dictionary.ShallowCopy(class.__metatable, Dictionary.ShallowCopy(getmetatable(instance))))
		else
			setmetatable(instance, class.__metatable)
		end
	end
end

OOP.Attributes = {
	Class = {},
	PreInitialize = {},
	PostInitialize = {},
	Copy = {}
}

--[[
	void OOP:RegisterAttribute(string type, string name, function method)
		type: The type of attribute (Class, PreInitialize, PostInitialize, or Copy).
		name: The name of the attribute as a class would call it.
		method: The class applicator. For function signatures, see below.

	Registers a new custom class attribute.

	Class:
		void function(class)

		Called immediately when the attribute is added to the class.

	PreInitialize:
		void function(class, instance)

		Called after instance allocation but before the object's initializer is called.

	PostInitialize:
		void function(class, instance)

		Called after the object is fully initialized.

	Copy:
		void function(original, copy)

		Called after the copied object has been allocated and filled.
]]
function OOP:RegisterAttribute(type, name, method)
	local typeset = self.Attributes[type]

	if (not typeset) then
		error(("Could not register attribute of type %q: unknown attribute type"):format(type), 2)
	end

	local out
	for i, attribute in ipairs(typeset) do
		if (attribute[1] == name) then
			out = attribute
			break
		end
	end

	if (not out) then
		out = {name}
		table.insert(typeset, out)
	end

	out[2] = method
end

--[[
	void OOP:SetAttributeInherited(string name, bool inherited)
		name: The name of the attribute to define a value for.
		inherited: Whether inheriting a class will also inherit this attribute.

	Marks an attribute as inherited or not inherited explicitly.
]]
function OOP:SetAttributeInherited(name, inherited)
	self.__attribute_inheritance[name] = not not inherited
end

-- PooledInstantiation attribute
-- The rest of the functionality is defined inline, since it modifies allocation behavior.
OOP:RegisterAttribute("Class", "PooledInstantiation",
	function(class)
		class.__pool = {}
		class.__pool_destructor = function(instance)
			local pool = class.__pool
			if (#pool < (class.__attributes.PoolSize or 20)) then
				table.insert(pool, instance)
			end
		end

		class.__members.Destroy = class.__members.Destroy or class.__pool_destructor
		class.__metatable.__gc = class.__metatable.__gc or class.__pool_destructor
	end
)

OOP:RegisterAttribute("Class", "SparseInstances",
	function(class)
		local box = Dictionary.DeepCopy(class.__base_members)
		setmetatable(box, {__index = class.__members})
		
		class:Metatable {
			__index = box
		}
	end
)

--[[
	Body for both Class and StaticClass base classes.

	__members: Holds user-defined class members.
	__base_members: Holds base class members so they can be overridden effectively.
	__metatable: Holds metatable to be applied to instances.
	__attributes: Holds class attributes.
	__typecheck: The typecheck object for this class.
]]
OOP.BaseClass = {
	__members = {},
	__base_members = {},
	__metatable = {},
	__attributes = {},
	__typecheck = {}
}

--[[
	Class BaseClass:Inherits(...)

	Inherits from classes, taking on their attributes, members, metatables, and type information.
]]
function OOP.BaseClass:Inherits(...)
	for i = 1, select("#", ...) do
		local object = select(i, ...)

		if (type(object) ~= "table" or not object.__members) then
			error(("Carbon.OOP: Cannot inherit from object #%d, not a class: %s"):format(i, object), 2)
		end

		Dictionary.DeepCopyMerge(object.__members, self.__members)
		Dictionary.DeepCopyMerge(object.__metatable, self.__metatable)
		Dictionary.ShallowMerge(object.__typecheck, self.__typecheck)

		for key, value in pairs(object.__attributes) do
			if (OOP.__attribute_inheritance[key]) then
				self.__attributes = Dictionary.DeepCopy(value)
			end
		end

		for i, attribute in ipairs(OOP.Attributes.Class) do
			if (object.__attributes[attribute[1]]) then
				attribute[2](self)
			end
		end
	end

	return self
end

--[[
	Class BaseClass:Attributes(table attributes)
		attributes: The attributes to give to the object.

	Adds attributes to the class. Overwrites existing attributes.
	The attributes parameter is only shallow copied, keep this in mind.
]]
function OOP.BaseClass:Attributes(attributes)
	Dictionary.ShallowCopy(attributes, self.__attributes)

	for i, attribute in ipairs(OOP.Attributes.Class) do
		if (attributes[attribute[1]]) then
			attribute[2](self)
		end
	end

	return self
end

--[[
	Class BaseClass:Metatable(table metatable)
		metatable: The metatable to give to instances of this class.

	Adds metatables to the class. Overwrites existing metatable entries.
	The metatable parameter is only shallow copied, keep this in mind.
]]
function OOP.BaseClass:Metatable(metatable)
	Dictionary.ShallowCopy(metatable, self.__metatable)

	return self
end

--[[
	Class BaseClass:Metatable(table member)
		member: The member to give to instances of this class.

	Adds members to the class. Overwrites existing member entries.
	The members parameter is only shallow copied, keep this in mind.
]]
function OOP.BaseClass:Members(members)
	Dictionary.ShallowCopy(members, self.__members)

	return self
end

-- The base object for all non-singleton objects
OOP.Object = Dictionary.DeepCopy(OOP.BaseClass)
	:Attributes(default_attributes)

OOP.Object.__members.class = newproxy(true)
getmetatable(OOP.Object.__members.class).__index = OOP.Object

OOP.Object.__typecheck[OOP.Object] = true
OOP.Object.Is = OOP.Object.typecheck

--[[
	Object Class:PlacementNew(indexable target?, ...)
		target: Where to place the instance, will be provided if not given.

	Creates a new object and puts it into a given indexable object.
]]
function OOP.Object:PlacementNew(instance, ...)
	if (self.__attributes.Abstract) then
		error("Cannot create instance of abstract class!", 2)
	end

	if (not instance) then
		if (self.__attributes.PooledInstantiation) then
			instance = table.remove(self.__pool, #self.__pool) or {}
		elseif (ffi and self.__attributes.EXT_LJ_Struct) then
			if (not self.__ext_ffi_metatype) then
				local index = Dictionary.ShallowCopy(self.__base_members)
				Dictionary.ShallowCopy(self.__members, index)

				self.__ext_ffi_metatype = {
					__index = index
				}
				Dictionary.ShallowCopy(self.__metatable, self.__ext_ffi_metatype)
				ffi.metatype(self.__attributes.EXT_LJ_Struct, self.__ext_ffi_metatype)
			end

			if (not self.__ext_ffi_constructor) then
				self.__ext_ffi_constructor = ffi.typeof(self.__attributes.EXT_LJ_Struct)
			end

			instance = self.__ext_ffi_constructor()
		else
			instance = {}
		end
	end

	if (not (self.__attributes.SparseInstances or self.__attributes.ExplicitInitialization or self.__attributes.EXT_LJ_Struct)) then
		Dictionary.DeepCopy(self.__base_members, instance)
		Dictionary.DeepCopy(self.__members, instance)
	end

	if (not self.__attributes.EXT_LJ_Struct) then
		instance.self = instance.self or instance

		instance.class = newproxy(true)
		getmetatable(instance.class).__index = self

		-- We wrap the typechecking in a userdata so it doesn't get copied when our instance does.
		instance.Is = newproxy(true)
		getmetatable(instance.Is).__index = self.__typecheck

		-- InstanceIndirection attribute wraps the object in a userdata
		-- This allows a __gc metamethod with Lua 5.1 and LuaJIT.
		-- As a side effect, 'self' becomes a userdata
		-- Get the internal table with self.self
		instance = handle_indirection(self, instance)
		apply_metatable(self, instance)
	end

	for i, attribute in ipairs(OOP.Attributes.PreInitialize) do
		if (self.__attributes[attribute[1]]) then
			attribute[2](self, instance)
		end
	end

	if (self.__attributes.EXT_LJ_Struct) then
		if (self.__members._init) then
			self.__members._init(instance, ...)
		end
	else
		-- Call the defined constructor
		if (instance._init) then
			instance._init(instance, ...)
		end
	end

	for i, attribute in ipairs(OOP.Attributes.PostInitialize) do
		if (self.__attributes[attribute[1]]) then
			attribute[2](self, instance)
		end
	end

	return instance
end

--[[
	Object Class:New(...)

	Creates a new object and passes parameters to its initializer.
]]
function OOP.Object:New(...)
	return self:PlacementNew(nil, ...)
end

--[[
	Object Object:Copy()

	Copies the given object.
]]
OOP.Object.__base_members.Copy = function(self)
	local class = self.class
	local target

	if (class.__attributes.PooledInstantiation) then
		target = table.remove(class.__pool, #class.__pool) or {}
	end

	local copy = Dictionary.DeepCopy(self.self, target)

	if (class.__attributes.SparseInstances) then
		setmetatable(copy, {__index = class.__members})
	end

	copy = handle_indirection(class, copy)
	apply_metatable(class, copy)

	for i, attribute in ipairs(OOP.Attributes.Copy) do
		if (self.__attributes[attribute[1]]) then
			attribute[2](self, copy)
		end
	end

	return copy
end

-- StaticObject, the base class for all singleton classes.
OOP.StaticObject = Dictionary.DeepCopy(OOP.BaseClass)
	:Attributes(default_static_attributes)

OOP.StaticObject.__members.class = newproxy(true)
getmetatable(OOP.StaticObject.__members.class).__index = OOP.StaticObject

OOP.StaticObject.__typecheck[OOP.StaticObject] = true
OOP.StaticObject.Is = OOP.StaticObject.__typecheck

--[[
	Class OOP:Class()

	Creates a new, empty class.
]]
function OOP:Class()
	local class = Dictionary.DeepCopy(self.Object)

	class.__typecheck[class] = true

	setmetatable(class, {
		__newindex = class.__members,
		__index = class.__members
	})

	return class
end

--[[
	StaticClass OOP:StaticClass()

	Creates a static (singleton) class.
	Also works for abstract classes, see the alias below to OOP:AbstractClass()
]]
function OOP:StaticClass()
	local class = Dictionary.DeepCopy(self.StaticObject)

	class.__typecheck[class] = true

	setmetatable(class, {
		__newindex = class.__members,
		__index = class.__members
	})

	return class
end

OOP.AbstractClass = OOP.StaticClass

return OOP