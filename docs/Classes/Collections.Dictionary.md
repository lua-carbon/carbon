# Collections.Dictionary
Provides a set of utilities to operate on dictionary structures.

Most methods here are intended to be called as both OOP-style methods and on pure data objects.

Inherits [OOP.Object](OOP.Object), [Serializable](Serializable)

## Methods
### Dictionary Dictionary:New(table data)
- data: The data of the dictionary

Turns the given object into a Dictionary.
Allows method-style syntax to be used on the object.


### [List](Collections.List) Dictionary.Keys(table self)
- self: The table to retrieve keys for.

Returns all the keys in the table.


### [List](Collections.List) Dictionary.Values(table self)
- self: The table to retrieve values for.

Returns all the values in the table in a [List](Collections.List)


### [Set](Collections.Set) Dictionary.ToSet(table self, [table out])
- self: The table to convert to a set.

- out: Where to put the resulting set. Defaults to a new set.

Converts the Dictionary to a [Set](Collections.Set).


### table Dictionary.ShallowCopy(table self, [table to])
- self: The table to source data from

- to: The table to copy into; an empty table if not given.

Shallow copies data from one table into another and returns the result.


### Dictionary Dictionary.DeepCopy(table self, [table to, bool datawise, table map])
- self: The dictionary to source data from.

- to: The dictionary to copy into; an empty table if not given.

- datawise: Whether the copy should ignore Copy member functions.

- map: A map projecting original values into copied values. Used internally.

Performs a self-reference fixing deep copy from one table into another.
Handles self-references properly.


### table Dictionary.ShallowMerge(table self, table to)
- self: The table to source data from.

- to: The table to output into.

Performs a merge into a table without overwriting existing keys.


### table Dictionary.DeepCopyMerge(table self, table to)
- self: The table to source data from.

- to: The table to put data into.

Performs a merge into the table, performing a deep copy on all table members.


## Properties
[none]
