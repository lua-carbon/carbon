<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Collections.List</h1>
<span class="file-link">(in [./Carbon/Collections/List.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Collections/List.lua))</span><br/>

Provides utilities for operating on Lists and List-like data.

The <a href="Classes/Collections.List">List</a> type Differs from the primtive <a href="Types#list">list</a> type by adding methods to it.
It is possible to use these methods with a plain <a href="Types#list">list</a>, just call them in a non-object oriented way:
<code class="lua hljs">List.Clear(list)
List.ShallowCopy(list)
</code>

**Inherits <a href="Classes/OOP.Object">OOP.Object</a>, <a href="Classes/Serializable">Serializable</a>**

## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  List:New(<code>[<a href="Types#list">list</a> data]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Collections.List">List</a></code></span>**

- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `data`: The data of the list. Empty if not given.

Turns the given object into a <a href="Classes/Collections.List">List</a>.
Allows method-style syntax.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  List.Clear(<code><a href="Classes/Collections.List">List</a> self</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#void">void</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `self`: The list to clear.

Clears a list of all list values.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  List.DeepCopy(<code><a href="Types#list">list</a> self, [<a href="Types#list">list</a> to, <a href="Types#dictionary">dictionary</a> map, function copy_function, ...]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Collections.List">List</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `self`: The list to source data from.
- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `to`: The list to copy into; an empty table if not given.
- <img class="doc-image" alt="internal" src="https://img.shields.io/badge/%20-internal-888888.svg?style=flat-square" />  `map`: A map projecting original values into copied values. Used internally.
- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `copy_function`: The function to copy members with: defaults to this method.

Performs a self-reference fixing deep copy from one list into another.
Handles self-references properly.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  List.ShallowCopy(<code><a href="Types#list">list</a> self, [<a href="Types#list">list</a> to]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#list">list</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `self`: The list to source data from
- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `to`: The list to copy into; an empty table if not given.

Shallow copies data from one table into another and returns the result.


## Properties
[none]
