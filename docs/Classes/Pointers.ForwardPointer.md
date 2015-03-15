# Pointers.ForwardPointer
Wraps primitives and forwards operators.
Use [Operators](Classes/Operators) for comparisons to ensure compatibility.
Data pointed to by a ForwardPointer is copied.

**Inherits [none]**

## Methods
#### ![public][public] ForwardPointer ForwardPointer:New(any? value)
- ![optional][optional] value: The value to point this ForwardPointer at.

Creates a new ForwardPointer pointing at the given value.


#### ![public][public] any? ForwardPointer:Get()


Returns an unwrapped version of the value pointed to by this pointer.


#### ![public][public] void ForwardPointer:New(any? value)
- ![optional][optional] value: The value to point this ForwardPointer at.

Points the ForwardPointer at the given value.


## Properties
[none]


[public]: https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square
[optional]: https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square