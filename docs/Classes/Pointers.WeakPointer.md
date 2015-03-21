<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Pointers.WeakPointer</h1>
<span class="file-link">(in [./Carbon/Pointers/WeakPointer.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Pointers/WeakPointer.lua))</span><br/>

Stores a reference to an object without affecting its garbage collection.
Provides an implicit copy barrier.

**Inherits [none]**

## Methods
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  WeakPointer:New(<code>[any](Types#any)? value</code>)</h4>

- <img alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />&nbsp;&nbsp;`value`: The value to initialize the pointer with.

**Returns  [WeakPointer](Classes/Pointers.WeakPointer)**

Creates a new [WeakPointer](Classes/Pointers.WeakPointer).

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  WeakPointer:Available()</h4>



**Returns  [bool](Types#bool)**

public [bool](Types#bool) WeakPointer:Available()

Returns whether the data the WeakPointer is pointing to is still valid for access.
If this returns false, the data was probably garbage collected.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  WeakPointer:Get()</h4>



**Returns  [any](Types#any)?**

public [any](Types#any)? WeakPointer:Get()

Returns the value currently pointed to by the [WeakPointer](Classes/Pointers.WeakPointer).
Use `WeakPointer:Available()` first to make sure the data is still valid.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  WeakPointer:Set(<code>[any](Types#any)? value</code>)</h4>

- <img alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />&nbsp;&nbsp;`value`: The value to initialize the pointer with.

**Returns  [void](Types#void)**

Sets a new value for the [WeakPointer](Classes/Pointers.WeakPointer).


## Properties
[none]
