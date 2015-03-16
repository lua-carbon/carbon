<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Collections.Set</h1>
<span class="file-link">(in [./Carbon/Collections/Set.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Collections/Set.lua))</span><br/>
Provides operations for operating on unordered sets.

**Inherits [none]**

## Methods
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Set:New(<code>[table data]</code>)
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`data`: The data of the set. Empty if not given.

**Returns  Set**

Turns the given object into a Set.
Allows method-style syntax.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Set.ToList(<code>table self, [table out]</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`self`: The set to collect members for.
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`out`: Where to put the resulting data. Put into a new [List](Classes/Collections.List) by default.

**Returns  [List](Classes/Collections.List)**

Collects all members of the set and puts them in a list.


## Properties
[none]
