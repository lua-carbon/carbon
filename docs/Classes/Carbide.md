<h1 class="class-title">Carbide</h1>
<span class="file-link">(in [./Carbon/Carbide.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Carbide.lua))</span><br/>

Implements a set of Lua language extensions known as Carbide.

This file is related to the Carbide programmatic API, for details on using Carbide, see [Using Carbide](Using_Carbide).


<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Carbide.Compile(<code><a href="Types#string">string</a> source, [<a href="Types#string">string</a> chunkname, <a href="Types#table">table</a> environment, <a href="Types#table">table</a> settings]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#function">function</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `source`: The Carbide source.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `chunkname`: The name of the chunk for Lua errors.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `environment`: The environment to compile the chunk with.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `settings`: The settings to compile Carbide with.</li>
</ul>

Parses and compiles the given Carbide source. A drop-in replacement for Carbon.LoadString.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Carbide.ParseCore(<code><a href="Types#string">string</a> source, [<a href="Types#table">table</a> settings]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#string">string</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `source`: The source to parse.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `settings`: Settings (source directives) to pass to the parser</li>
</ul>

Parses the given source for Carbide expressions.

The source can change the feature level with <code>#CARBIDE_FEATURE_LEVEL &lt;level&gt;</code>, which defaults to `2`.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Carbide.ParseTemplated(<code><a href="Types#string">string</a> source, [<a href="Types#table">table</a> settings]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#string">string</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `source`: The source to parse for templates.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `settings`: Settings (source directives) to use when parsing the templates.</li>
</ul>

Parses the source file for templates if it contains a <code>#TEMPLATES_ENABLED</code> directive.

The document can change the templating level using <code>#TEMPLATE_LEVEL &lt;level&gt;</code>.

<hr />
## Properties
#### <span class="doc-visibility doc-public">public</span> <code><a href="Classes/TemplateEngine">TemplateEngine</a></code> Engine
The <a href="Classes/TemplateEngine">TemplateEngine</a> Carbide will use.