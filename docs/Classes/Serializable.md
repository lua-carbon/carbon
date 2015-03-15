# Serializable
**Abstract**

Provides an interface to serialize and deserialize data.

All methods provided by this class that are not overridden throw a [NotImplementedException](Classes/NotImplementedException).

**Inherits [OOP.Object](Classes/OOP.Object)**

## Methods
#### string Serializable:Serialize()


Serializes the object into a string representation.


#### self Serializable:DeserializeInPlace(string source)
- source: A string containing a serialized representation of an instance of this class.

Deserializes a previously serialized instance of this class.
Places the data into the class this method is called on.

Equivalent to
```lua
self:Deserialize(source, self)
```

Can be called with self:Deserialize!(source) in Carbide Lua.


#### out Serializable.Deserialize(string source, Serializable out)
- source: A string containing a serialized representation of an instance of this class.
- out: Where to place the resulting data.

Deserializes the given source string and places it into the given Serializable `out` object.


## Properties
[none]


