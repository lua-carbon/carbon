<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Serializable</h1>
<span class="file-link">(in [./Carbon/Serializable.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Serializable.lua))</span><br/>
**Abstract**

Provides an interface to serialize and deserialize data.

All methods provided by this class that are not overridden throw a [NotImplementedException](Classes/NotImplementedException).

**Inherits [OOP.Object](Classes/OOP.Object)**

## Methods
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Serializable:Serialize()


**Returns  string**

Serializes the object into a string representation.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Serializable:DeserializeInPlace(<code>string source</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`source`: A string containing a serialized representation of an instance of this class.

**Returns  self**

Deserializes a previously serialized instance of this class.
Places the data into the class this method is called on.

Equivalent to
```lua
self:Deserialize(source, self)
```

Can be called with self:Deserialize!(source) in Carbide Lua.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Serializable.Deserialize(<code>string source, Serializable out</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`source`: A string containing a serialized representation of an instance of this class.
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`out`: Where to place the resulting data.

**Returns  out**

Deserializes the given source string and places it into the given Serializable `out` object.


## Properties
[none]
