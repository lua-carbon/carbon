<link href="style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Collections.Dictionary</h1>
<span class="file-link">(in [./Carbon/Collections/Dictionary.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Collections/Dictionary.lua))</span><br/>
Provides a set of utilities to operate on dictionary structures.

Most methods here are intended to be called as both OOP-style methods and on pure data objects.

**Inherits [OOP.Object](Classes/OOP.Object), [Serializable](Classes/Serializable)**

## Methods
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Dictionary:New(<code>[[table](Types#table) data]</code>)
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`data`: The data of the dictionary. Empty if not specified.

**Returns  [Dictionary](Classes/Collections.Dictionary)**

Turns the given object into a [Dictionary](Classes/Collections.Dictionary).
Allows method-style syntax to be used on the object.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Dictionary.Keys(<code>[table](Types#table) self</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`self`: The table to retrieve keys for.

**Returns  [List](Classes/Collections.List)**

Returns all the keys in the table.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Dictionary.Values(<code>[table](Types#table) self</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`self`: The table to retrieve values for.

**Returns  [List](Classes/Collections.List)**

Returns all the values in the table in a [List](Classes/Collections.List)


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Dictionary.ToSet(<code>[table](Types#table) self, [[table](Types#table) out]</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`self`: The table to convert to a set.
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`out`: Where to put the resulting set. Defaults to a new set.

**Returns  [Set](Classes/Collections.Set)**

Converts the Dictionary to a [Set](Classes/Collections.Set).


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Dictionary.ShallowCopy(<code>[table](Types#table) self, [[table](Types#table) to]</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`self`: The table to source data from
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`to`: The table to copy into; an empty table if not given.

**Returns  table**

Shallow copies data from one table into another and returns the result.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Dictionary.DeepCopy(<code>[table](Types#table) self, [[table](Types#table) to, [bool](Types#bool) datawise, [table](Types#table) map]</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`self`: The dictionary to source data from.
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`to`: The dictionary to copy into; an empty table if not given.
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`datawise`: Whether the copy should ignore Copy member functions.
- ![internal](https://img.shields.io/badge/%20-internal-888888.svg?style=flat-square)&nbsp;&nbsp;`map`: A map projecting original values into copied values.

**Returns  [Dictionary](Classes/Collections.Dictionary)**

Performs a self-reference fixing deep copy from one table into another.
Handles self-references properly.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Dictionary.ShallowMerge(<code>[table](Types#table) self, [table](Types#table) to</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`self`: The table to source data from.
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`to`: The table to output into.

**Returns  table**

Performs a merge into a table without overwriting existing keys.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Dictionary.DeepCopyMerge(<code>[table](Types#table) self, [table](Types#table) to</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`self`: The table to source data from.
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`to`: The table to put data into.

**Returns  table**

Performs a merge into the table, performing a deep copy on all table members.


## Properties
[none]
