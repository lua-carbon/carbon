<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">OOP.Object</h1>
<span class="file-link">(in [./Carbon/OOP.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/OOP.lua))</span><br/>

The base object for all instancable classes.

**Inherits <a href="Classes/OOP.BaseClass">OOP.BaseClass</a>**

<hr />
## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Object:Copy()</h4>
**<span class="method-returns">Returns <code>Object</code></span>**



Copies the given object.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Object:Init(<code>...</code>)</h4>
**<span class="method-returns">Returns <code>self</code></span>**



Initializes the object with the given parameters.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Class:PlacementNew(<code><a href="Types#indexable">indexable</a>? target, ...</code>)</h4>
**<span class="method-returns">Returns <code>Object</code></span>**

- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `target`: Where to place the instance, will be provided if not given.
- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `...`: Arguments to pass to the constructor

Creates a new object and puts it into a given indexable object.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Class:New(<code>...</code>)</h4>
**<span class="method-returns">Returns <code>Object</code></span>**



Creates a new object and passes parameters to its initializer.


<hr />
## Properties
[none]
