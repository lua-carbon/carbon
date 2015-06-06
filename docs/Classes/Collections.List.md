<h1 class="class-title">Collections.List</h1>
<span class="file-link">(in [./Carbon/Collections/List.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Collections/List.lua))</span><br/>

Provides utilities for operating on Lists and List-like data.

The <a href="Classes/Collections.List">List</a> type Differs from the primtive <a href="Types#list">list</a> type by adding methods to it.
It is possible to use these methods with a plain <a href="Types#list">list</a>, just call them in a non-object oriented way:
<code class="lua hljs">List.Clear(list)
List.ShallowCopy(list)
</code>

<span class="bold">Inherits <a href="Classes/OOP.Object">OOP.Object</a>, <a href="Classes/Serializable">Serializable</a></span>

<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> List:New(<code>[<a href="Types#list">list</a> data]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Collections.List">List</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `data`: The data of the list. Empty if not given.</li>
</ul>

Turns the given object into a <a href="Classes/Collections.List">List</a>.
Allows method-style syntax.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> List.Clear(<code><a href="Classes/Collections.List">List</a> self</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> List:Clear()</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `self`: The list to source data from</li>
</ul>

Clears a list of all list values.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> List.DeepCopy(<code><a href="Types#list">list</a> self, [<a href="Types#list">list</a> to, <a href="Types#dictionary">dictionary</a> map, function copy_function, ...]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Collections.List">List</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `self`: The list to source data from.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `to`: The list to copy into; an empty table if not given.</li>
<li><span class="doc-arg-level doc-internal">internal</span>  `map`: A map projecting original values into copied values. Used internally.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `copy_function`: The function to copy members with: defaults to this method.</li>
</ul>

Performs a self-reference fixing deep copy from one list into another.
Handles self-references properly.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> List.ShallowCopy(<code><a href="Types#list">list</a> self, [<a href="Types#list">list</a> to]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#list">list</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `self`: The list to source data from</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `to`: The list to copy into; an empty table if not given.</li>
</ul>

Shallow copies data from one table into another and returns the result.

<hr />
## Properties
[none]