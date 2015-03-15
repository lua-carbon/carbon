# Collections.Dictionary
Provides a set of utilities to operate on dictionary structures.

Most methods here are intended to be called as both OOP-style methods and on pure data objects.

**Inherits [OOP.Object](Classes/OOP.Object), [Serializable](Classes/Serializable)**

## Methods
#### ![public][public] Dictionary Dictionary:New([table data])
- ![optional][optional] data: The data of the dictionary. Empty if not specified.

Turns the given object into a Dictionary.
Allows method-style syntax to be used on the object.


#### ![public][public] [List](Classes/Collections.List) Dictionary.Keys(table self)
- ![required][required] self: The table to retrieve keys for.

Returns all the keys in the table.


#### ![public][public] [List](Classes/Collections.List) Dictionary.Values(table self)
- ![required][required] self: The table to retrieve values for.

Returns all the values in the table in a [List](Classes/Collections.List)


#### ![public][public] [Set](Classes/Collections.Set) Dictionary.ToSet(table self, [table out])
- ![required][required] self: The table to convert to a set.
- ![optional][optional] out: Where to put the resulting set. Defaults to a new set.

Converts the Dictionary to a [Set](Classes/Collections.Set).


#### ![public][public] table Dictionary.ShallowCopy(table self, [table to])
- ![required][required] self: The table to source data from
- ![optional][optional] to: The table to copy into; an empty table if not given.

Shallow copies data from one table into another and returns the result.


#### ![public][public] Dictionary Dictionary.DeepCopy(table self, [table to, bool datawise, table map])
- ![required][required] self: The dictionary to source data from.
- ![optional][optional] to: The dictionary to copy into; an empty table if not given.
- ![optional][optional] datawise: Whether the copy should ignore Copy member functions.
- ![internal][internal] map: A map projecting original values into copied values.

Performs a self-reference fixing deep copy from one table into another.
Handles self-references properly.


#### ![public][public] table Dictionary.ShallowMerge(table self, table to)
- ![required][required] self: The table to source data from.
- ![required][required] to: The table to output into.

Performs a merge into a table without overwriting existing keys.


#### ![public][public] table Dictionary.DeepCopyMerge(table self, table to)
- ![required][required] self: The table to source data from.
- ![required][required] to: The table to put data into.

Performs a merge into the table, performing a deep copy on all table members.


## Properties
[none]


[internal]: https://img.shields.io/badge/%20-internal-888888.svg?style=flat-square
[required]: https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square
[public]: https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square
[optional]: https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square