<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Serializable</h1>
<span class="file-link">(in [./Carbon/Serializable.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Serializable.lua))</span><br/>

**Abstract**

Provides an interface to serialize and deserialize data.

All methods provided by this class that are not overridden throw a [NotImplementedException](Classes/NotImplementedException).

**Inherits [OOP.Object](Classes/OOP.Object)**

## Methods
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Serializable.Deserialize(<code>[string](Types#string) source, [Serializable](Classes/Serializable) out</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`source`: A string containing a serialized representation of an instance of this class.
- <img alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />&nbsp;&nbsp;`out`: Where to place the resulting data.

**Returns  [Serializable](Classes/Serializable) out**

Deserializes the given source string and places it into the given [Serializable](Classes/Serializable) `out` object, if given, or a new instance of the class.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Serializable:DeserializeInPlace(<code>[string](Types#string) source</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`source`: A string containing a serialized representation of an instance of this class.

**Returns  self**

Deserializes a previously serialized instance of this class.
Places the data into the class this method is called on.

Equivalent to
```lua
self:Deserialize(source, self)
```

Can be called with self:Deserialize!(source) in Carbide Lua.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Serializable:Serialize()</h4>



**Returns  string**

public string Serializable:Serialize()

Serializes the object into a string representation.


## Properties
[none]
