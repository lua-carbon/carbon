<h1 class="class-title">Pointers.BasicPointer</h1>
<span class="file-link">(in [./Carbon/Pointers/BasicPointer.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Pointers/BasicPointer.lua))</span><br/>

Wraps an object to pass it by-reference.


<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> BasicPointer:New(<code><a href="Types#any">any</a>? value</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Pointers.BasicPointer">BasicPointer</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `value`: The value the pointer should point at.</li>
</ul>

Creates a new <a href="Classes/Pointers.BasicPointer">BasicPointer</a>, pointing at any sort of object.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> BasicPointer:Copy()</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Pointers.BasicPointer">BasicPointer</a></code></p>
<ul class="doc-arg-list">

</ul>

Copies the <a href="Classes/Pointers.BasicPointer">BasicPointer</a>, but not the value pointed to.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> BasicPointer:Get()</h4>
<p class="method-returns bold">Returns <code><a href="Types#any">any</a>?</code></p>
<ul class="doc-arg-list">

</ul>

Returns the value currently pointed at by the BasicPointer.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> BasicPointer:Set(<code><a href="Types#any">any</a>? value</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">

</ul>

Sets a new value to be pointed at by this BasicPointer.

<hr />
## Properties
[none]