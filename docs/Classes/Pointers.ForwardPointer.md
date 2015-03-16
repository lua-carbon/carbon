<link href="style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Pointers.ForwardPointer</h1>
<span class="file-link">(in [./Carbon/Pointers/ForwardPointer.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Pointers/ForwardPointer.lua))</span><br/>
Wraps primitives and forwards operators.
Use [Operators](Classes/Operators) for comparisons to ensure compatibility.
Data pointed to by a ForwardPointer is copied.

**Inherits [none]**

## Methods
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) ForwardPointer:New(<code>any? value</code>)
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`value`: The value to point this ForwardPointer at.

**Returns  ForwardPointer**

Creates a new ForwardPointer pointing at the given value.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) ForwardPointer:Get()


**Returns  any?**

Returns an unwrapped version of the value pointed to by this pointer.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) ForwardPointer:New(<code>any? value</code>)
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`value`: The value to point this ForwardPointer at.

**Returns  void**

Points the ForwardPointer at the given value.


## Properties
[none]
