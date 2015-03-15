# Serializable
**Abstract**

Provides an interface to serialize and deserialize data.

All methods provided by this class that are not overridden throw a [NotImplementedException](Classes/NotImplementedException).

**Inherits [OOP.Object](Classes/OOP.Object)**

## Methods
#### ![public][public] string Serializable:Serialize()


Serializes the object into a string representation.


#### ![public][public] self Serializable:DeserializeInPlace(string source)
- ![required][required] source: A string containing a serialized representation of an instance of this class.

Deserializes a previously serialized instance of this class.
Places the data into the class this method is called on.

Equivalent to
```lua
self:Deserialize(source, self)
```

Can be called with self:Deserialize!(source) in Carbide Lua.


#### ![public][public] out Serializable.Deserialize(string source, Serializable out)
- ![required][required] source: A string containing a serialized representation of an instance of this class.
- ![optional][optional] out: Where to place the resulting data.

Deserializes the given source string and places it into the given Serializable `out` object.


## Properties
[none]


[required]: https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square
[public]: https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square
[optional]: https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square