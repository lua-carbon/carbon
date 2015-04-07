<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Exceptions.NotImplementedException</h1>
<span class="file-link">(in [./Carbon/Exceptions/NotImplementedException.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Exceptions/NotImplementedException.lua))</span><br/>

An exception to be generated when a feature is not (yet) implemented.

<span class="bold">Inherits <a href="Classes/Exception">Exception</a></span>

<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> NotImplementedException:New(<code><a href="Types#string">string</a> method_name</code>)</h4>
<p class="method-returns bold">Returns <code></code></p><h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> NotImplementedException:PlacementNew(<code><a href="Classes/Exceptions.NotImplementedException">NotImplementedException</a>? out, <a href="Types#string">string</a> method_name</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> NotImplementedException:Init(<code><a href="Types#string">string</a> method_name</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `method_name`: The name of the method that isn't yet implemented.</li>
</ul>

Generates a new <a href="Classes/Exceptions.NotImplementedException">NotImplementedException</a> for a method with the given name.

<hr />
## Properties
#### <span class="doc-visibility doc-public">public</span> <code>string</code> MethodName
The name of the method that isn't implemented.