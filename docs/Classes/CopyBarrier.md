<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">CopyBarrier</h1>
<span class="file-link">(in [./Carbon/CopyBarrier.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/CopyBarrier.lua))</span><br/>

Prevents copying of the data it points to.
Forwards indexes and newindexes to target.

**Inherits [OOP.Object](Classes/OOP.Object)**

## Methods
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  CopyBarrier:New(<code>[any](Types#any)? value</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`value`: The value to point at.

**Returns  [CopyBarrier](Classes/CopyBarrier)**

Creates a new [CopyBarrier](Classes/CopyBarrier) pointing at the given value.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  CopyBarrier:Copy()</h4>



**Returns  self**

public self CopyBarrier:Copy()

A stub that simply returns itself to prevent copying methods from copying this.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  CopyBarrier:Get()</h4>



**Returns  [any](Types#any)?**

public [any](Types#any)? CopyBarrier:Get()

Returns the value pointed to by the [CopyBarrier](Classes/CopyBarrier).

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  CopyBarrier:Set(<code>[any](Types#any)? value</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`value`: The new value for the [CopyBarrier](Classes/CopyBarrier).

**Returns  [void](Types#void)**

Sets a new value for the [CopyBarrier](Classes/CopyBarrier).


## Properties
[none]
