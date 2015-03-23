<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Collections.Set</h1>
<span class="file-link">(in [./Carbon/Collections/Set.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Collections/Set.lua))</span><br/>

Provides operations for operating on unordered sets.

The <a href="Classes/Collections.Set">Set</a> type Differs from the primtive <a href="Types#set">set</a> type by adding methods to it.
It is possible to use these methods with a plain <a href="Types#set">set</a>, just call them in a non-object oriented way:
<code class="lua hljs">Set.ToList(set)
</code>

**Inherits [none]**

## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Set:New(<code>[<a href="Types#table">table</a> data]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Collections.Set">Set</a></code></span>**

- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `data`: The data of the set. Empty if not given.

Turns the given object into a Set.
Allows method-style syntax.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Set.ToList(<code><a href="Types#table">table</a> self, [<a href="Types#table">table</a> out]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Collections.List">List</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `self`: The set to collect members for.
- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `out`: Where to put the resulting data. Put into a new <a href="Classes/Collections.List">List</a> by default.

Collects all members of the set and puts them in a list.


## Properties
[none]
