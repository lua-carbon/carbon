<h1 class="class-title">Pointers.LookupPointer</h1>
<span class="file-link">(in [./Carbon/Pointers/LookupPointer.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Pointers/LookupPointer.lua))</span><br/>
Provides an interface to referencing a data lookup.
LookupPointers themselves are copied, but the data they point to is not.

**Inherits [none]**

## Methods
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) LookupPointer:New(<code>indexable parent, string[] path</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`parent`: The base of the lookup to be performed.
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`path`: A list of strings to navigate through the parent with.

**Returns  LookupPointer**

Creates a new LookupPointer pointing at the given parent with a given navigation table.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) LookupPointer:Get()


**Returns  (indexable, string[])**

Returns the current parent and navigation table.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) LookupPointer:Get(<code>indexable parent, string[] path</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`parent`: The base of the lookup to be performed.
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`path`: A list of strings to navigate through the parent with.

**Returns  void**

Sets a new parent and navigation table for the LookupPointer.


## Properties
[none]
