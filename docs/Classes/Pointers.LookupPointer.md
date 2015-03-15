# Pointers.LookupPointer
Provides an interface to referencing a data lookup.
LookupPointers themselves are copied, but the data they point to is not.

**Inherits [none]**

## Methods
#### ![public][public] LookupPointer LookupPointer:New(indexable parent, string[] path)
- ![required][required] parent: The base of the lookup to be performed.
- ![required][required] path: A list of strings to navigate through the parent with.

Creates a new LookupPointer pointing at the given parent with a given navigation table.


#### ![public][public] (indexable, string[]) LookupPointer:Get()


Returns the current parent and navigation table.


#### ![public][public] void LookupPointer:Get(indexable parent, string[] path)
- ![required][required] parent: The base of the lookup to be performed.
- ![required][required] path: A list of strings to navigate through the parent with.

Sets a new parent and navigation table for the LookupPointer.


## Properties
[none]


[public]: https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square
[required]: https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square