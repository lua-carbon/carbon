<link href="style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Pointers.BasicPointer</h1>
<span class="file-link">(in [./Carbon/Pointers/BasicPointer.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Pointers/BasicPointer.lua))</span><br/>
Wraps an object to pass it by-reference.
Creates an implicit copy barrier.

**Inherits [none]**

## Methods
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) BasicPointer:New(<code>any? value</code>)
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`value`: The value the pointer should point at.

**Returns  BasicPointer**

Creates a new BasicPointer, pointing at any sort of object.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) BasicPointer:Get()


**Returns  any?**

Returns the value currently pointed at by the BasicPointer.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) BasicPointer:Set(<code>any? value</code>)


**Returns  void**

Sets a new value to be pointed at by this BasicPointer.


## Properties
[none]
