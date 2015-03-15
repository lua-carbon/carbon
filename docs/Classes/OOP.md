# OOP
Provides object orientation features for Carbon.

**Inherits [none]**

## Methods
#### ![public][public] void OOP:RegisterAttribute(string type, string name, function method)
- ![required][required] type: The type of attribute (Class, PreInitialize, PostInitialize, or Copy).
- ![required][required] name: The name of the attribute as a class would call it.
- ![required][required] method: The class applicator. For function signatures, see below.

Registers a new custom class attribute.

- Class: `void function(class)`

	Called immediately when the attribute is added to the class.


- PreInitialize: `void function(class, instance)`

	Called after instance allocation but before the object's initializer is called.


- PostInitialize: `void function(class, instance)`

	Called after the object is fully initialized.


- Copy: `void function(original, copy)`

	Called after the copied object has been allocated and filled.


#### ![public][public] void OOP:SetAttributeInherited(string name, bool inherited)
- ![required][required] name: The name of the attribute to define a value for.
- ![required][required] inherited: Whether inheriting a class will also inherit this attribute.

Marks an attribute as inherited or not inherited explicitly.


#### ![public][public] Class OOP:Class([Class based_on])
- ![optional][optional] based_on: A class to make a direct copy of for the basis of this class.

Creates a new, empty class.


#### ![public][public] StaticClass OOP:StaticClass()


Creates a static class, enabling it to inherit from other objects without having instantiation capability.


## Properties
[none]


[required]: https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square
[public]: https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square
[optional]: https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square