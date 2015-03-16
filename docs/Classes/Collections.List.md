<h1 class="class-title">Collections.List</h1>
<span class="file-link">(in [./Carbon/Collections/List.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Collections/List.lua))</span><br/>
Provides utilities for operating on Lists and List-like data.

**Inherits [OOP.Object](Classes/OOP.Object), [Serializable](Classes/Serializable)**

## Methods
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) List:New(<code>[table data]</code>)
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`data`: The data of the list. Empty if not given.

**Returns  List**

Turns the given object into a List.
Allows method-style syntax.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) List.Clear(<code>List self</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`self`: The list to clear.

**Returns  void**

Clears a list of all list values.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) List.ShallowCopy(<code>List self, [List to]</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`self`: The list to source data from
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`to`: The list to copy into; an empty table if not given.

**Returns  table**

Shallow copies data from one table into another and returns the result.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) List.DeepCopy(<code>table self, [table to, table map, function copy_function, ...]</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`self`: The list to source data from.
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`to`: The list to copy into; an empty table if not given.
- ![internal](https://img.shields.io/badge/%20-internal-888888.svg?style=flat-square)&nbsp;&nbsp;`map`: A map projecting original values into copied values. Used internally.
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`copy_function`: The function to copy members with: defaults to this method.

**Returns  [List](Classes/Collections.List)**

Performs a self-reference fixing deep copy from one list into another.
Handles self-references properly.


## Properties
[none]
