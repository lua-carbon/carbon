# Collections.List
Provides utilities for operating on Lists and List-like data.

Inherits [OOP.Object](OOP.Object), [Serializable](Serializable)

## Methods
### List List:New(table data)
- data: The data of the dictionary

Turns the given object into a List.
Allows method-style syntax.


### void List.Clear(List self)
- self: The list to clear.

Clears a list of all list values.


### table List.ShallowCopy(List self, [List to])
- self: The list to source data from

- to: The list to copy into; an empty table if not given.

Shallow copies data from one table into another and returns the result.


### List List.DeepCopy(table self, [table to, table map, function copy_function, ...])
- self: The list to source data from.

- to: The list to copy into; an empty table if not given.

- map: A map projecting original values into copied values. Used internally.

- copy_function: The function to copy members with: defaults to this method.

Performs a self-reference fixing deep copy from one list into another.
Handles self-references properly.


## Properties
[none]
