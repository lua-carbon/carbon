<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Exceptions.CodeGenerationException</h1>
<span class="file-link">(in [./Carbon/Exceptions/CodeGenerationException.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Exceptions/CodeGenerationException.lua))</span><br/>

An exception to be generated when generation of code fails.

<span class="bold">Inherits <a href="Classes/Exception">Exception</a></span>

<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> CodeGenerationException:New(<code><a href="Types#string">string</a> message, <a href="Types#string">string</a> code</code>)</h4>
<p class="method-returns bold">Returns <code></code></p><h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> CodeGenerationException:PlacementNew(<code><a href="Classes/Exceptions.CodeGenerationException">CodeGenerationException</a>? out, <a href="Types#string">string</a> message, <a href="Types#string">string</a> code</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> CodeGenerationException:Init(<code><a href="Types#string">string</a> message, <a href="Types#string">string</a> code</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `message`: A message explaining why code generation failed.</li>
<li><span class="doc-arg-level doc-required">required</span>  `code`: The code that was generated.</li>
</ul>

Denotes that code generation failed in a metaprogramming-enabled module.

<hr />
## Properties
#### <span class="doc-visibility doc-public">public</span> <code>string</code> GeneratedCode
Contains the code that was generated and failed to meet the criteria.
<hr/>
#### <span class="doc-visibility doc-public">public</span> <code>string</code> Message
Contains a message about what went wrong generating code.