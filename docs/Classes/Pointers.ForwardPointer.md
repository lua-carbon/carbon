<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Pointers.ForwardPointer</h1>
<span class="file-link">(in [./Carbon/Pointers/ForwardPointer.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Pointers/ForwardPointer.lua))</span><br/>

Wraps primitives and forwards operators.
Use <a href="Classes/Operators">Operators</a> for comparisons to ensure compatibility.
Data pointed to by a ForwardPointer is copied.

<span class="bold">Inherits [none]</span>

<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> ForwardPointer:New(<code><a href="Types#any">any</a>? value</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Pointers.ForwardPointer">ForwardPointer</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `value`: The value to point this ForwardPointer at.</li>
</ul>

Creates a new <a href="Classes/Pointers.ForwardPointer">ForwardPointer</a> pointing at the given value.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> ForwardPointer:Copy()</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Pointers.ForwardPointer">ForwardPointer</a></code></p>
<ul class="doc-arg-list">

</ul>

Copies the <a href="Classes/Pointers.ForwardPointer">ForwardPointer</a> object, but not the data pointed to.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> ForwardPointer:Get()</h4>
<p class="method-returns bold">Returns <code>any?</code></p>
<ul class="doc-arg-list">

</ul>

Returns an unwrapped version of the value pointed to by this pointer.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> ForwardPointer:New(<code><a href="Types#any">any</a>? value</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `value`: The value to point this ForwardPointer at.</li>
</ul>

Points the ForwardPointer at the given value.

<hr />
## Properties
[none]