<h1 class="class-title">Callisto.Compiler</h1>
<span class="file-link">(in [./Carbon/Callisto/Compiler.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Callisto/Compiler.lua))</span><br/>

The pure compiler API for Callisto.


<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Compiler.LoadString(<code><a href="Types#string">string</a> source, [<a href="Types#table">table</a> sourcemap, <a href="Types#string">string</a> chunkname, <a href="Types#table">table</a> environment]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#function">function</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `source`: The source to load into a chunk.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `sourcemap`: A Callisto sourcemap mapping lines.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `chunkname`: A name to give the resulting chunk.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `environment`: The Lua environment to load the chunk into.</li>
</ul>

Loads a compiled chunk in a way compatible with any Lua 5.1+
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Compiler.Transform(<code><a href="Types#string">string</a> source, [<a href="Types#table">table</a> settings]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#string">string</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `source`: The source to transform.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `settings`: Settings (source directives) to pass to the transpiler.</li>
</ul>

Transforms the given source from Callisto to Lua.

<hr />
## Properties
[none]