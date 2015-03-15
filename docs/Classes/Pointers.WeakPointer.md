# Pointers.WeakPointer
Stores a reference to an object without affecting its garbage collection.
Provides an implicit copy barrier.

**Inherits [none]**

## Methods
#### ![public][public] WeakPointer WeakPointer:New(any? value)
- ![optional][optional] value: The value to initialize the pointer with.

Creates a new WeakPointer.


#### ![public][public] any? WeakPointer:Get()


Returns the value currently pointed to by the WeakPointer.
Use `WeakPointer:Available()` first to make sure the data is still valid.


#### ![public][public] void WeakPointer:Set(any? value)
- ![optional][optional] value: The value to initialize the pointer with.

Sets a new value for the WeakPointer.


#### ![public][public] bool WeakPointer:Available()


Returns whether the data the WeakPointer is pointing to is still valid for access.
If this returns false, the data was probably garbage collected.


## Properties
[none]


[public]: https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square
[optional]: https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square