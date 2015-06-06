<h1 class="class-title">Exceptions.SyntaxErrorException</h1>
<span class="file-link">(in [./Carbon/Exceptions/SyntaxErrorException.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Exceptions/SyntaxErrorException.lua))</span><br/>

An exception to be generated when a syntax error is encountered

<span class="bold">Inherits <a href="Classes/Exception">Exception</a></span>

<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> SyntaxErrorException:New(<code><a href="Types#string">string</a> err, [<a href="Types#unumber">unumber</a> line]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Exceptions.SyntaxErrorException">SyntaxErrorException</a></code></p><h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> SyntaxErrorException:PlacementNew(<code><a href="Classes/Exceptions.SyntaxErrorException">SyntaxErrorException</a>? out, <a href="Types#string">string</a> err, [<a href="Types#unumber">unumber</a> line]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Exceptions.SyntaxErrorException">SyntaxErrorException</a></code></p>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> SyntaxErrorException:Init(<code><a href="Types#string">string</a> err, [<a href="Types#unumber">unumber</a> line]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `err`: The reason for the error.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `line`: The line the error was found on. Defaults to 1.</li>
</ul>

Generates a new <a href="Classes/Exceptions.SyntaxErrorException">SyntaxErrorException</a> for a given syntax error.

<hr />
## Properties
#### <span class="doc-visibility doc-public">public</span> <code>string</code> Line
The line the syntax error occured on, approximately.