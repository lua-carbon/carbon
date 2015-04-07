<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Collections.Set</h1>
<span class="file-link">(in [./Carbon/Collections/Set.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Collections/Set.lua))</span><br/>

Provides operations for operating on unordered sets.

The <a href="Classes/Collections.Set">Set</a> type Differs from the primtive <a href="Types#set">set</a> type by adding methods to it.
It is possible to use these methods with a plain <a href="Types#set">set</a>, just call them in a non-object oriented way:
<code class="lua hljs">Set.ToList(set)
</code>

<span class="bold">Inherits [none]</span>

<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Set:New(<code>[<a href="Types#table">table</a> data]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Collections.Set">Set</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `data`: The data of the set. Empty if not given.</li>
</ul>

Turns the given object into a Set.
Allows method-style syntax.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Set.ToList(<code><a href="Types#table">table</a> self, [<a href="Types#table">table</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Collections.List">List</a></code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Set:ToList(<code>[<a href="Types#table">table</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Collections.List">List</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `self`: The set to collect members for.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the resulting data. Put into a new <a href="Classes/Collections.List">List</a> by default.</li>
</ul>

Collects all members of the set and puts them in a list.

<hr />
## Properties
[none]