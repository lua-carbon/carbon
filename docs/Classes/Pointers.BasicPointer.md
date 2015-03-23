<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Pointers.BasicPointer</h1>
<span class="file-link">(in [./Carbon/Pointers/BasicPointer.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Pointers/BasicPointer.lua))</span><br/>

Wraps an object to pass it by-reference.
Creates an implicit copy barrier.

**Inherits [none]**

## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  BasicPointer:New(<code><a href="Types#any">any</a>? value</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Pointers.BasicPointer">BasicPointer</a></code></span>**

- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `value`: The value the pointer should point at.

Creates a new BasicPointer, pointing at any sort of object.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  BasicPointer:Get()</h4>
**<span class="method-returns">Returns <code><a href="Types#any">any</a>?</code></span>**



Returns the value currently pointed at by the BasicPointer.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  BasicPointer:Set(<code><a href="Types#any">any</a>? value</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#void">void</a></code></span>**



Sets a new value to be pointed at by this BasicPointer.


## Properties
[none]
