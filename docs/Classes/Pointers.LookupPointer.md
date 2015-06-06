<h1 class="class-title">Pointers.LookupPointer</h1>
<span class="file-link">(in [./Carbon/Pointers/LookupPointer.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Pointers/LookupPointer.lua))</span><br/>

Provides an interface to referencing a data lookup.
LookupPointers themselves are copied, but the data they point to is not.


<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> LookupPointer:New(<code><a href="Types#indexable">indexable</a> parent, <a href="Types#list">list</a>&lt;string&gt; path</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Pointers.LookupPointer">LookupPointer</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `parent`: The base of the lookup to be performed.</li>
<li><span class="doc-arg-level doc-required">required</span>  `path`: A list of strings to navigate through the parent with.</li>
</ul>

Creates a new <a href="Classes/Pointers.LookupPointer">LookupPointer</a> pointing at the given parent with a given navigation table.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> LookupPointer:Copy()</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Pointers.LookupPointer">LookupPointer</a></code></p>
<ul class="doc-arg-list">

</ul>

Copies the <a href="Classes/Pointers.LookupPointer">LookupPointer</a> but not the data it points to.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> (<code><a href="Types#indexable">indexable</a>, <a href="Types#list">list</a>&lt;string&gt;</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">

</ul>

LookupPointer:Get()

Returns the current parent and navigation table.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> LookupPointer:Get(<code><a href="Types#indexable">indexable</a> parent, <a href="Types#list">list</a>&lt;string&gt; path</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `parent`: The base of the lookup to be performed.</li>
<li><span class="doc-arg-level doc-required">required</span>  `path`: A list of strings to navigate through the parent with.</li>
</ul>

Sets a new parent and navigation table for the <a href="Classes/Pointers.LookupPointer">LookupPointer</a>.

<hr />
## Properties
[none]