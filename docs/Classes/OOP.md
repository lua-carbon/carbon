<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">OOP</h1>
<span class="file-link">(in [./Carbon/OOP.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/OOP.lua))</span><br/>

Provides object orientation features for Carbon.

**Inherits [none]**

<hr />
## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  OOP:StaticClass()</h4>
**<span class="method-returns">Returns <code>StaticClass</code></span>**



Creates a static class, enabling it to inherit from other objects without having instantiation capability.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  OOP:Class(<code>[Class based_on]</code>)</h4>
**<span class="method-returns">Returns <code>Class</code></span>**

- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `based_on`: A class to make a direct copy of for the basis of this class.

Creates a new, empty class.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  OOP:RegisterAttribute(<code><a href="Types#string">string</a> type, <a href="Types#string">string</a> name, function method</code>)</h4>
**<span class="method-returns">Returns <code>void</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `type`: The type of attribute (Class, PreInitialize, PostInitialize, or Copy).
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `name`: The name of the attribute as a class would call it.
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `method`: The class applicator. For function signatures, see below.

Registers a new custom class attribute.

<ul><li>Class: <code><a href="Types#void">void</a> function(class)</code><br />	Called immediately when the attribute is added to the class.</li></ul>

<ul><li>PreInitialize: <code><a href="Types#void">void</a> function(class, instance)</code><br />	Called after instance allocation but before the object's initializer is called.</li></ul>

<ul><li>PostInitialize: <code><a href="Types#void">void</a> function(class, instance)</code><br />	Called after the object is fully initialized.</li></ul>

<ul><li>Copy: <code><a href="Types#void">void</a> function(original, copy)</code><br />	Called after the copied object has been allocated and filled.</li></ul>

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  OOP:SetAttributeInherited(<code><a href="Types#string">string</a> name, <a href="Types#bool">bool</a> inherited</code>)</h4>
**<span class="method-returns">Returns <code>void</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `name`: The name of the attribute to define a value for.
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `inherited`: Whether inheriting a class will also inherit this attribute.

Marks an attribute as inherited or not inherited explicitly.


<hr />
## Properties
[none]
