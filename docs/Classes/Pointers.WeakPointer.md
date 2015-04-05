<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Pointers.WeakPointer</h1>
<span class="file-link">(in [./Carbon/Pointers/WeakPointer.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Pointers/WeakPointer.lua))</span><br/>

Stores a reference to an object without affecting its garbage collection.
Provides an implicit copy barrier.

**Inherits [none]**

<hr />
## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> WeakPointer:New(<code><a href="Types#any">any</a>? value</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Pointers.WeakPointer">WeakPointer</a></code></span>**

- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `value`: The value to initialize the pointer with.

Creates a new <a href="Classes/Pointers.WeakPointer">WeakPointer</a>.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> WeakPointer:Copy()</h4>
**<span class="method-returns">Returns <code><a href="Classes/Pointers.WeakPointer">WeakPointer</a></code></span>**



Copies the WeakPointer, but not the data it points to.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> WeakPointer:Available()</h4>
**<span class="method-returns">Returns <code><a href="Types#bool">bool</a></code></span>**



Returns whether the data the WeakPointer is pointing to is still valid for access.
If this returns false, the data was probably garbage collected.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> WeakPointer:Get()</h4>
**<span class="method-returns">Returns <code><a href="Types#any">any</a>?</code></span>**



Returns the value currently pointed to by the <a href="Classes/Pointers.WeakPointer">WeakPointer</a>.
Use <code>WeakPointer:Available()</code> first to make sure the data is still valid.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> WeakPointer:Set(<code><a href="Types#any">any</a>? value</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#void">void</a></code></span>**

- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `value`: The value to initialize the pointer with.

Sets a new value for the <a href="Classes/Pointers.WeakPointer">WeakPointer</a>.


<hr />
## Properties
[none]
