<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Collections.Dictionary</h1>
<span class="file-link">(in [./Carbon/Collections/Dictionary.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Collections/Dictionary.lua))</span><br/>

Provides a set of utilities to operate on dictionary structures.

Most methods here are intended to be called as both OOP-style methods and on pure data objects.

The <a href="Classes/Collections.Dictionary">Dictionary</a> type Differs from the primtive <a href="Types#dictionary">dictionary</a> type by adding methods to it.
It is possible to use these methods with a plain <a href="Types#dictionary">dictionary</a>, just call them in a non-object oriented way:
<code class="lua hljs">Dictionary.Keys(dictionary)
Dictionary.ShallowCopy(dictionary)
</code>

**Inherits <a href="Classes/OOP.Object">OOP.Object</a>, <a href="Classes/Serializable">Serializable</a>**

<hr />
## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Dictionary:New(<code>[<a href="Types#table">table</a> data]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Collections.Dictionary">Dictionary</a></code></span>**

- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `data`: The data of the dictionary. Empty if not specified.

Turns the given object into a <a href="Classes/Collections.Dictionary">Dictionary</a>.
Allows method-style syntax to be used on the object.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Dictionary.DeepCopy(<code><a href="Types#table">table</a> self, [<a href="Types#table">table</a> to, <a href="Types#bool">bool</a> datawise, <a href="Types#table">table</a> map]</code>)</h4>
**<span class="method-returns">Returns <code>table</code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Dictionary:DeepCopy(<code>[<a href="Types#table">table</a> to, <a href="Types#bool">bool</a> datawise, <a href="Types#table">table</a> map]</code>)</h4>
**<span class="method-returns">Returns <code>table</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `self`: The dictionary to source data from.
- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `to`: The dictionary to copy into; an empty table if not given.
- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `datawise`: Whether the copy should ignore Copy member functions.
- <img class="doc-image" alt="internal" src="https://img.shields.io/badge/%20-internal-888888.svg?style=flat-square" />  `map`: A map projecting original values into copied values.

Performs a self-reference fixing deep copy from one table into another.
Handles self-references properly.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Dictionary.DeepCopyMerge(<code><a href="Types#table">table</a> self, <a href="Types#table">table</a> to</code>)</h4>
**<span class="method-returns">Returns <code>table</code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Dictionary:DeepCopyMerge(<code><a href="Types#table">table</a> to</code>)</h4>
**<span class="method-returns">Returns <code>table</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `self`: The table to source data from.
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `to`: The table to put data into.

Performs a merge into the table, performing a deep copy on all table members.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Dictionary.Keys(<code><a href="Types#table">table</a> self</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Collections.List">List</a></code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Dictionary:Keys()</h4>
**<span class="method-returns">Returns <code><a href="Classes/Collections.List">List</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `self`: The table to retrieve keys for.

Returns all the keys in the table.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Dictionary.ShallowCopy(<code><a href="Types#table">table</a> self, [<a href="Types#table">table</a> to]</code>)</h4>
**<span class="method-returns">Returns <code>table</code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Dictionary:ShallowCopy(<code>[<a href="Types#table">table</a> to]</code>)</h4>
**<span class="method-returns">Returns <code>table</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `self`: The table to source data from
- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `to`: The table to copy into; an empty table if not given.

Shallow copies data from one table into another and returns the result.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Dictionary.ShallowMerge(<code><a href="Types#table">table</a> self, <a href="Types#table">table</a> to</code>)</h4>
**<span class="method-returns">Returns <code>table</code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Dictionary:ShallowMerge(<code><a href="Types#table">table</a> to</code>)</h4>
**<span class="method-returns">Returns <code>table</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `self`: The table to source data from.
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `to`: The table to output into.

Performs a merge into a table without overwriting existing keys.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Dictionary.ToSet(<code><a href="Types#table">table</a> self, [<a href="Types#table">table</a> out]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Collections.Set">Set</a></code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Dictionary:ToSet(<code>[<a href="Types#table">table</a> out]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Collections.Set">Set</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `self`: The table to convert to a set.
- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `out`: Where to put the resulting set. Defaults to a new set.

Converts the Dictionary to a <a href="Classes/Collections.Set">Set</a>.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Dictionary.Values(<code><a href="Types#table">table</a> self</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Collections.List">List</a></code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Dictionary:Values()</h4>
**<span class="method-returns">Returns <code><a href="Classes/Collections.List">List</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `self`: The table to retrieve values for.

Returns all the values in the table in a <a href="Classes/Collections.List">List</a>


<hr />
## Properties
[none]
