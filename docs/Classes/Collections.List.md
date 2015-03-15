# Collections.List
Provides utilities for operating on Lists and List-like data.

**Inherits [OOP.Object](Classes/OOP.Object), [Serializable](Classes/Serializable)**

## Methods
#### ![public][public] List List:New([table data])
- ![optional][optional] data: The data of the list. Empty if not given.

Turns the given object into a List.
Allows method-style syntax.


#### ![public][public] void List.Clear(List self)
- ![required][required] self: The list to clear.

Clears a list of all list values.


#### ![public][public] table List.ShallowCopy(List self, [List to])
- ![required][required] self: The list to source data from
- ![optional][optional] to: The list to copy into; an empty table if not given.

Shallow copies data from one table into another and returns the result.


#### ![public][public] List List.DeepCopy(table self, [table to, table map, function copy_function, ...])
- ![required][required] self: The list to source data from.
- ![optional][optional] to: The list to copy into; an empty table if not given.
- ![internal][internal] map: A map projecting original values into copied values. Used internally.
- ![optional][optional] copy_function: The function to copy members with: defaults to this method.

Performs a self-reference fixing deep copy from one list into another.
Handles self-references properly.


## Properties
[none]


[internal]: https://img.shields.io/badge/%20-internal-888888.svg?style=flat-square
[required]: https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square
[public]: https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square
[optional]: https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square