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

<span class="bold">Inherits <a href="Classes/OOP.Object">OOP.Object</a>, <a href="Classes/Serializable">Serializable</a></span>

<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Dictionary:New(<code>[<a href="Types#table">table</a> data]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Collections.Dictionary">Dictionary</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `data`: The data of the dictionary. Empty if not specified.</li>
</ul>

Turns the given object into a <a href="Classes/Collections.Dictionary">Dictionary</a>.
Allows method-style syntax to be used on the object.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Dictionary.DeepCopy(<code><a href="Types#table">table</a> self, [<a href="Types#table">table</a> to, <a href="Types#bool">bool</a> datawise, <a href="Types#table">table</a> map]</code>)</h4>
<p class="method-returns bold">Returns <code>table</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Dictionary:DeepCopy(<code>[<a href="Types#table">table</a> to, <a href="Types#bool">bool</a> datawise, <a href="Types#table">table</a> map]</code>)</h4>
<p class="method-returns bold">Returns <code>table</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `self`: The dictionary to source data from.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `to`: The dictionary to copy into; an empty table if not given.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `datawise`: Whether the copy should ignore Copy member functions.</li>
<li><span class="doc-arg-level doc-internal">internal</span>  `map`: A map projecting original values into copied values.</li>
</ul>

Performs a self-reference fixing deep copy from one table into another.
Handles self-references properly.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Dictionary.DeepCopyMerge(<code><a href="Types#table">table</a> self, <a href="Types#table">table</a> to</code>)</h4>
<p class="method-returns bold">Returns <code>table</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Dictionary:DeepCopyMerge(<code><a href="Types#table">table</a> to</code>)</h4>
<p class="method-returns bold">Returns <code>table</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `self`: The table to source data from.</li>
<li><span class="doc-arg-level doc-required">required</span>  `to`: The table to put data into.</li>
</ul>

Performs a merge into the table, performing a deep copy on all table members.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Dictionary.Keys(<code><a href="Types#table">table</a> self</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Collections.List">List</a></code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Dictionary:Keys()</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Collections.List">List</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `self`: The table to retrieve keys for.</li>
</ul>

Returns all the keys in the table.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Dictionary.RawDeepCopyMerge(<code><a href="Types#table">table</a> self, <a href="Types#table">table</a> to</code>)</h4>
<p class="method-returns bold">Returns <code>table</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Dictionary:RawDeepCopyMerge(<code><a href="Types#table">table</a> to</code>)</h4>
<p class="method-returns bold">Returns <code>table</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `self`: The table to source data from.</li>
<li><span class="doc-arg-level doc-required">required</span>  `to`: The table to put data into.</li>
</ul>

Performs a merge into the table, performing a deep copy on all table members and using raw gets.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Dictionary.ShallowCopy(<code><a href="Types#table">table</a> self, [<a href="Types#table">table</a> to]</code>)</h4>
<p class="method-returns bold">Returns <code>table</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Dictionary:ShallowCopy(<code>[<a href="Types#table">table</a> to]</code>)</h4>
<p class="method-returns bold">Returns <code>table</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `self`: The table to source data from</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `to`: The table to copy into; an empty table if not given.</li>
</ul>

Shallow copies data from one table into another and returns the result.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Dictionary.ShallowMerge(<code><a href="Types#table">table</a> self, <a href="Types#table">table</a> to</code>)</h4>
<p class="method-returns bold">Returns <code>table</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Dictionary:ShallowMerge(<code><a href="Types#table">table</a> to</code>)</h4>
<p class="method-returns bold">Returns <code>table</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `self`: The table to source data from.</li>
<li><span class="doc-arg-level doc-required">required</span>  `to`: The table to output into.</li>
</ul>

Performs a merge into a table without overwriting existing keys.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Dictionary.ToSet(<code><a href="Types#table">table</a> self, [<a href="Types#table">table</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Collections.Set">Set</a></code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Dictionary:ToSet(<code>[<a href="Types#table">table</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Collections.Set">Set</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `self`: The table to convert to a set.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the resulting set. Defaults to a new set.</li>
</ul>

Converts the Dictionary to a <a href="Classes/Collections.Set">Set</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Dictionary.Values(<code><a href="Types#table">table</a> self</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Collections.List">List</a></code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Dictionary:Values()</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Collections.List">List</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `self`: The table to retrieve values for.</li>
</ul>

Returns all the values in the table in a <a href="Classes/Collections.List">List</a>

<hr />
## Properties
[none]