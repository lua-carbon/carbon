<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Pointers.WeakPointer</h1>
<span class="file-link">(in [./Carbon/Pointers/WeakPointer.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Pointers/WeakPointer.lua))</span><br/>

Stores a reference to an object without affecting its garbage collection.
Provides an implicit copy barrier.

<span class="bold">Inherits [none]</span>

<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> WeakPointer:New(<code><a href="Types#any">any</a>? value</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Pointers.WeakPointer">WeakPointer</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `value`: The value to initialize the pointer with.</li>
</ul>

Creates a new <a href="Classes/Pointers.WeakPointer">WeakPointer</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> WeakPointer:Copy()</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Pointers.WeakPointer">WeakPointer</a></code></p>
<ul class="doc-arg-list">

</ul>

Copies the WeakPointer, but not the data it points to.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> WeakPointer:Available()</h4>
<p class="method-returns bold">Returns <code><a href="Types#bool">bool</a></code></p>
<ul class="doc-arg-list">

</ul>

Returns whether the data the WeakPointer is pointing to is still valid for access.
If this returns false, the data was probably garbage collected.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> WeakPointer:Get()</h4>
<p class="method-returns bold">Returns <code><a href="Types#any">any</a>?</code></p>
<ul class="doc-arg-list">

</ul>

Returns the value currently pointed to by the <a href="Classes/Pointers.WeakPointer">WeakPointer</a>.
Use <code>WeakPointer:Available()</code> first to make sure the data is still valid.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> WeakPointer:Set(<code><a href="Types#any">any</a>? value</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `value`: The value to initialize the pointer with.</li>
</ul>

Sets a new value for the <a href="Classes/Pointers.WeakPointer">WeakPointer</a>.

<hr />
## Properties
[none]