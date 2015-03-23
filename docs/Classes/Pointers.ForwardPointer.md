<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Pointers.ForwardPointer</h1>
<span class="file-link">(in [./Carbon/Pointers/ForwardPointer.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Pointers/ForwardPointer.lua))</span><br/>

Wraps primitives and forwards operators.
Use <a href="Classes/Operators">Operators</a> for comparisons to ensure compatibility.
Data pointed to by a ForwardPointer is copied.

**Inherits [none]**

## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  ForwardPointer:New(<code><a href="Types#any">any</a>? value</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Pointers.ForwardPointer">ForwardPointer</a></code></span>**

- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `value`: The value to point this ForwardPointer at.

Creates a new ForwardPointer pointing at the given value.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  ForwardPointer:Get()</h4>
**<span class="method-returns">Returns <code>any?</code></span>**



Returns an unwrapped version of the value pointed to by this pointer.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  ForwardPointer:New(<code><a href="Types#any">any</a>? value</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#void">void</a></code></span>**

- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `value`: The value to point this ForwardPointer at.

Points the ForwardPointer at the given value.


## Properties
[none]
