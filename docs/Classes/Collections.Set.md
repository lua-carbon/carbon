<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Collections.Set</h1>
<span class="file-link">(in [./Carbon/Collections/Set.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Collections/Set.lua))</span><br/>
Provides operations for operating on unordered sets.

The [Set](Classes/Collections.Set) type Differs from the primtive [set](Types#set) type by adding methods to it.
It is possible to use these methods with a plain [set](Types#set), just call them in a non-object oriented way:
```lua
Set.ToList(set)
```

**Inherits [none]**

## Methods
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Set:New(<code>[[table](Types#table) data]</code>)
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`data`: The data of the set. Empty if not given.

**Returns  [Set](Classes/Collections.Set)**

Turns the given object into a Set.
Allows method-style syntax.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Set.ToList(<code>[table](Types#table) self, [[table](Types#table) out]</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`self`: The set to collect members for.
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`out`: Where to put the resulting data. Put into a new [List](Classes/Collections.List) by default.

**Returns  [List](Classes/Collections.List)**

Collects all members of the set and puts them in a list.


## Properties
[none]
