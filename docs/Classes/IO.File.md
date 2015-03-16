<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">IO.File</h1>
<span class="file-link">(in [./Carbon/IO.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/IO.lua))</span><br/>
Represents a Carbon file I/O handle. See [IO](Classes/IO) for more documentation on the object.

**Inherits [none]**

## Methods
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) File:Close()


**Returns  [void](Types#void)**

Closes the file.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) File:Read()


**Returns  [string](Types#string)**

Reads the entire file.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) File:Write(<code>[string](Types#string) contents</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`contents`: The contents to write to the file.

**Returns  [void](Types#void)**

Writes a contents to the file.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) File:ReadBufferAsync(<code>[[list](Types#list)<[string](Types#string)> into]</code>)
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`into`: An existing buffer to read the file's contents into.

**Returns  [Promise](Classes/Promise)<[list](Types#list)<[string](Types#string)>>**

Reads the entire file into a buffer.


## Properties
[none]
