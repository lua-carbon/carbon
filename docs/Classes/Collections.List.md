<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Collections.List</h1>
<span class="file-link">(in [./Carbon/Collections/List.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Collections/List.lua))</span><br/>

Provides utilities for operating on Lists and List-like data.

The [List](Classes/Collections.List) type Differs from the primtive [list](Types#list) type by adding methods to it.
It is possible to use these methods with a plain [list](Types#list), just call them in a non-object oriented way:
```lua
List.Clear(list)
List.ShallowCopy(list)
```

**Inherits [OOP.Object](Classes/OOP.Object), [Serializable](Classes/Serializable)**

## Methods
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) List:New(<code>[[list](Types#list) data]</code>)
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`data`: The data of the list. Empty if not given.

**Returns  [List](Classes/Collections.List)**

Turns the given object into a [List](Classes/Collections.List).
Allows method-style syntax.

<hr/>
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) List.Clear(<code>[List](Classes/Collections.List) self</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`self`: The list to clear.

**Returns  [void](Types#void)**

Clears a list of all list values.

<hr/>
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) List.DeepCopy(<code>[list](Types#list) self, [[list](Types#list) to, [dictionary](Types#dictionary) map, function copy_function, ...]</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`self`: The list to source data from.
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`to`: The list to copy into; an empty table if not given.
- ![internal](https://img.shields.io/badge/%20-internal-888888.svg?style=flat-square)&nbsp;&nbsp;`map`: A map projecting original values into copied values. Used internally.
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`copy_function`: The function to copy members with: defaults to this method.

**Returns  [List](Classes/Collections.List)**

Performs a self-reference fixing deep copy from one list into another.
Handles self-references properly.

<hr/>
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) List.ShallowCopy(<code>[list](Types#list) self, [[list](Types#list) to]</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`self`: The list to source data from
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`to`: The list to copy into; an empty table if not given.

**Returns  [list](Types#list)**

Shallow copies data from one table into another and returns the result.


## Properties
[none]
