<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Pointers.BasicPointer</h1>
<span class="file-link">(in [./Carbon/Pointers/BasicPointer.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Pointers/BasicPointer.lua))</span><br/>

Wraps an object to pass it by-reference.
Creates an implicit copy barrier.

**Inherits [none]**

## Methods
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  BasicPointer:New(<code>[any](Types#any)? value</code>)</h4>

- <img alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />&nbsp;&nbsp;`value`: The value the pointer should point at.

**Returns  [BasicPointer](Classes/Pointers.BasicPointer)**

Creates a new BasicPointer, pointing at any sort of object.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  BasicPointer:Get()</h4>



**Returns  [any](Types#any)?**

public [any](Types#any)? BasicPointer:Get()

Returns the value currently pointed at by the BasicPointer.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  BasicPointer:Set(<code>[any](Types#any)? value</code>)</h4>



**Returns  [void](Types#void)**

public [void](Types#void) BasicPointer:Set([any](Types#any)? value)

Sets a new value to be pointed at by this BasicPointer.


## Properties
[none]
