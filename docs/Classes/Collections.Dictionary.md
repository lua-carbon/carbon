<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Collections.Dictionary</h1>
<span class="file-link">(in [./Carbon/Collections/Dictionary.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Collections/Dictionary.lua))</span><br/>

Provides a set of utilities to operate on dictionary structures.

Most methods here are intended to be called as both OOP-style methods and on pure data objects.

The [Dictionary](Classes/Collections.Dictionary) type Differs from the primtive [dictionary](Types#dictionary) type by adding methods to it.
It is possible to use these methods with a plain [dictionary](Types#dictionary), just call them in a non-object oriented way:
<code class="lua hljs">Dictionary.Keys(dictionary)
Dictionary.ShallowCopy(dictionary)
</code>

**Inherits [OOP.Object](Classes/OOP.Object), [Serializable](Classes/Serializable)**

## Methods
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Dictionary:New(<code>[[table](Types#table) data]</code>)</h4>

- <img alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />&nbsp;&nbsp;`data`: The data of the dictionary. Empty if not specified.

**Returns  [Dictionary](Classes/Collections.Dictionary)**

Turns the given object into a [Dictionary](Classes/Collections.Dictionary).
Allows method-style syntax to be used on the object.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Dictionary.DeepCopy(<code>[table](Types#table) self, [[table](Types#table) to, [bool](Types#bool) datawise, [table](Types#table) map]</code>)</h4>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Dictionary:DeepCopy(<code>[[table](Types#table) to, [bool](Types#bool) datawise, [table](Types#table) map]</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`self`: The dictionary to source data from.
- <img alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />&nbsp;&nbsp;`to`: The dictionary to copy into; an empty table if not given.
- <img alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />&nbsp;&nbsp;`datawise`: Whether the copy should ignore Copy member functions.
- <img alt="internal" src="https://img.shields.io/badge/%20-internal-888888.svg?style=flat-square" />&nbsp;&nbsp;`map`: A map projecting original values into copied values.

**Returns  table**

Performs a self-reference fixing deep copy from one table into another.
Handles self-references properly.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Dictionary.DeepCopyMerge(<code>[table](Types#table) self, [table](Types#table) to</code>)</h4>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Dictionary:DeepCopyMerge(<code>[table](Types#table) to</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`self`: The table to source data from.
- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`to`: The table to put data into.

**Returns  table**

Performs a merge into the table, performing a deep copy on all table members.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Dictionary.Keys(<code>[table](Types#table) self</code>)</h4>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Dictionary:Keys()</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`self`: The table to retrieve keys for.

**Returns  [List](Classes/Collections.List)**

Returns all the keys in the table.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Dictionary.ShallowCopy(<code>[table](Types#table) self, [[table](Types#table) to]</code>)</h4>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Dictionary:ShallowCopy(<code>[[table](Types#table) to]</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`self`: The table to source data from
- <img alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />&nbsp;&nbsp;`to`: The table to copy into; an empty table if not given.

**Returns  table**

Shallow copies data from one table into another and returns the result.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Dictionary.ShallowMerge(<code>[table](Types#table) self, [table](Types#table) to</code>)</h4>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Dictionary:ShallowMerge(<code>[table](Types#table) to</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`self`: The table to source data from.
- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`to`: The table to output into.

**Returns  table**

Performs a merge into a table without overwriting existing keys.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Dictionary.ToSet(<code>[table](Types#table) self, [[table](Types#table) out]</code>)</h4>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Dictionary:ToSet(<code>[[table](Types#table) out]</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`self`: The table to convert to a set.
- <img alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />&nbsp;&nbsp;`out`: Where to put the resulting set. Defaults to a new set.

**Returns  [Set](Classes/Collections.Set)**

Converts the Dictionary to a [Set](Classes/Collections.Set).

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Dictionary.Values(<code>[table](Types#table) self</code>)</h4>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Dictionary:Values()</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`self`: The table to retrieve values for.

**Returns  [List](Classes/Collections.List)**

Returns all the values in the table in a [List](Classes/Collections.List)


## Properties
[none]
