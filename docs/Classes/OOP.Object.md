<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">OOP.Object</h1>
<span class="file-link">(in [./Carbon/OOP.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/OOP.lua))</span><br/>

The base object for all instancable classes.

<span class="bold">Inherits <a href="Classes/OOP.BaseClass">OOP.BaseClass</a></span>

<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Object:Copy()</h4>
<p class="method-returns bold">Returns <code>Object</code></p>
<ul class="doc-arg-list">

</ul>

Copies the given object.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Object:Init(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">

</ul>

Initializes the object with the given parameters.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Object:Destroy()</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">

</ul>

Destroys the object.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Class:PlacementNew(<code><a href="Types#indexable">indexable</a>? target, ...</code>)</h4>
<p class="method-returns bold">Returns <code>Object</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `target`: Where to place the instance, will be provided if not given.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `...`: Arguments to pass to the constructor</li>
</ul>

Creates a new object and puts it into a given indexable object.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Class:New(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code>Object</code></p>
<ul class="doc-arg-list">

</ul>

Creates a new object and passes parameters to its initializer.

<hr />
## Properties
[none]