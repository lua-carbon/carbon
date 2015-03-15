# Pointers.BasicPointer
Wraps an object to pass it by-reference.
Creates an implicit copy barrier.

**Inherits [none]**

## Methods
#### ![public][public] BasicPointer BasicPointer:New(any? value)
- ![optional][optional] value: The value the pointer should point at.

Creates a new BasicPointer, pointing at any sort of object.


#### ![public][public] any? BasicPointer:Get()


Returns the value currently pointed at by the BasicPointer.


#### ![public][public] void BasicPointer:Set(any? value)


Sets a new value to be pointed at by this BasicPointer.


## Properties
[none]


[public]: https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square
[optional]: https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square