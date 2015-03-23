<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Serializable</h1>
<span class="file-link">(in [./Carbon/Serializable.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Serializable.lua))</span><br/>

**Abstract**

Provides an interface to serialize and deserialize data.

All methods provided by this class that are not overridden throw a <a href="Classes/NotImplementedException">NotImplementedException</a>.

**Inherits <a href="Classes/OOP.Object">OOP.Object</a>**

## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Serializable.Deserialize(<code><a href="Types#string">string</a> source, <a href="Classes/Serializable">Serializable</a> out</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Serializable">Serializable</a> out</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `source`: A string containing a serialized representation of an instance of this class.
- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `out`: Where to place the resulting data.

Deserializes the given source string and places it into the given <a href="Classes/Serializable">Serializable</a> `out` object, if given, or a new instance of the class.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Serializable:DeserializeInPlace(<code><a href="Types#string">string</a> source</code>)</h4>
**<span class="method-returns">Returns <code>self</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `source`: A string containing a serialized representation of an instance of this class.

Deserializes a previously serialized instance of this class.
Places the data into the class this method is called on.

Equivalent to
```lua
self:Deserialize(source, self)
```

Can be called with self:Deserialize!(source) in Carbide Lua.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Serializable:Serialize()</h4>
**<span class="method-returns">Returns <code>string</code></span>**



Serializes the object into a string representation.


## Properties
[none]
