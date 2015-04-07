<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">CopyBarrier</h1>
<span class="file-link">(in [./Carbon/CopyBarrier.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/CopyBarrier.lua))</span><br/>

Prevents copying of the data it points to.
Forwards indexes and newindexes to target.

<span class="bold">Inherits <a href="Classes/OOP.Object">OOP.Object</a></span>

<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> CopyBarrier:New(<code><a href="Types#any">any</a>? value</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/CopyBarrier">CopyBarrier</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `value`: The value to point at.</li>
</ul>

Creates a new <a href="Classes/CopyBarrier">CopyBarrier</a> pointing at the given value.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> CopyBarrier:Copy()</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">

</ul>

A stub that simply returns itself to prevent copying methods from copying this.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> CopyBarrier:Get()</h4>
<p class="method-returns bold">Returns <code><a href="Types#any">any</a>?</code></p>
<ul class="doc-arg-list">

</ul>

Returns the value pointed to by the <a href="Classes/CopyBarrier">CopyBarrier</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> CopyBarrier:Set(<code><a href="Types#any">any</a>? value</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `value`: The new value for the <a href="Classes/CopyBarrier">CopyBarrier</a>.</li>
</ul>

Sets a new value for the <a href="Classes/CopyBarrier">CopyBarrier</a>.

<hr />
## Properties
[none]