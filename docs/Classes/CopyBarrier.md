<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">CopyBarrier</h1>
<span class="file-link">(in [./Carbon/CopyBarrier.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/CopyBarrier.lua))</span><br/>

Prevents copying of the data it points to.
Forwards indexes and newindexes to target.

**Inherits [OOP.Object](Classes/OOP.Object)**

## Methods
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) CopyBarrier:New(<code>[any](Types#any)? value</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`value`: The value to point at.

**Returns  [CopyBarrier](Classes/CopyBarrier)**

Creates a new [CopyBarrier](Classes/CopyBarrier) pointing at the given value.

<hr/>
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) CopyBarrier:Copy()


**Returns  self**

A stub that simply returns itself to prevent copying methods from copying this.

<hr/>
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) CopyBarrier:Get()


**Returns  [any](Types#any)?**

Returns the value pointed to by the [CopyBarrier](Classes/CopyBarrier).

<hr/>
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) CopyBarrier:Set(<code>[any](Types#any)? value</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`value`: The new value for the [CopyBarrier](Classes/CopyBarrier).

**Returns  [void](Types#void)**

Sets a new value for the [CopyBarrier](Classes/CopyBarrier).


## Properties
[none]
