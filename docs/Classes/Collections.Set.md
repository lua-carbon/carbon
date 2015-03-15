# Collections.Set
Provides operations for operating on unordered sets.

**Inherits [none]**

## Methods
#### ![public][public] Set Set:New([table data])
- ![optional][optional] data: The data of the set. Empty if not given.

Turns the given object into a Set.
Allows method-style syntax.


#### ![public][public] [List](Classes/Collections.List) Set.ToList(table self, [table out])
- ![required][required] self: The set to collect members for.
- ![optional][optional] out: Where to put the resulting data. Put into a new [List](Classes/Collections.List) by default.

Collects all members of the set and puts them in a list.


## Properties
[none]


[required]: https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square
[public]: https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square
[optional]: https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square