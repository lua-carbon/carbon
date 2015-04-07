<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Collections.Tuple</h1>
<span class="file-link">(in [./Carbon/Collections/Tuple.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Collections/Tuple.lua))</span><br/>

A disposable List object for quick vararg transformations.

<span class="bold">Inherits <a href="Classes/OOP.Object">OOP.Object</a></span>

<hr />
## Methods
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> Tuple:New(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Collections.Tuple">Tuple</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `...`: The values to initialize the Tuple with.</li>
</ul>

Creates a new Tuple.
<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> Tuple:Destroy(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code>...</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `...`: Data to pipe through this method.</li>
</ul>

Destroys the tuple, passing any arguments that it was given as return values.
This will put the tuple back into the main buffer, usually.
<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> Tuple:Unpack()</h4>
<p class="method-returns bold">Returns <code>...</code></p>
<ul class="doc-arg-list">

</ul>

Unpacks and destroys the Tuple, returning all its values.

<hr />
## Properties
[none]