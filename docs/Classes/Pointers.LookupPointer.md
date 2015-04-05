<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Pointers.LookupPointer</h1>
<span class="file-link">(in [./Carbon/Pointers/LookupPointer.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Pointers/LookupPointer.lua))</span><br/>

Provides an interface to referencing a data lookup.
LookupPointers themselves are copied, but the data they point to is not.

**Inherits [none]**

<hr />
## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> LookupPointer:New(<code><a href="Types#indexable">indexable</a> parent, <a href="Types#list">list</a>&lt;string&gt; path</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Pointers.LookupPointer">LookupPointer</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `parent`: The base of the lookup to be performed.
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `path`: A list of strings to navigate through the parent with.

Creates a new <a href="Classes/Pointers.LookupPointer">LookupPointer</a> pointing at the given parent with a given navigation table.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> LookupPointer:Copy()</h4>
**<span class="method-returns">Returns <code><a href="Classes/Pointers.LookupPointer">LookupPointer</a></code></span>**



Copies the <a href="Classes/Pointers.LookupPointer">LookupPointer</a> but not the data it points to.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> (<code><a href="Types#indexable">indexable</a>, <a href="Types#list">list</a>&lt;string&gt;</code>)</h4>
**<span class="method-returns">Returns <code></code></span>**



LookupPointer:Get()

Returns the current parent and navigation table.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> LookupPointer:Get(<code><a href="Types#indexable">indexable</a> parent, <a href="Types#list">list</a>&lt;string&gt; path</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#void">void</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `parent`: The base of the lookup to be performed.
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `path`: A list of strings to navigate through the parent with.

Sets a new parent and navigation table for the <a href="Classes/Pointers.LookupPointer">LookupPointer</a>.


<hr />
## Properties
[none]
