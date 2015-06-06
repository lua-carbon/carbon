<h1 class="class-title">TemplateEngine</h1>
<span class="file-link">(in [./Carbon/TemplateEngine.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/TemplateEngine.lua))</span><br/>

Templating engine targeted at metaprogramming.

Templates can use the `_` (single underscore) function to output a string, and the <code>RenderPartial</code> function to render a partial by name.
Most safe Lua functions are exposed to templates.


<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> TemplateEngine:New()</h4>
<p class="method-returns bold">Returns <code><a href="Classes/TemplateEngine">TemplateEngine</a></code></p><h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> TemplateEngine:PlacementNew(<code><a href="Classes/TemplateEngine">TemplateEngine</a>? out</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/TemplateEngine">TemplateEngine</a></code></p>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> TemplateEngine:Init()</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">

</ul>

Creates or initializes a <a href="Classes/TemplateEngine">TemplateEngine</a> object.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> TemplateEngine:Render(<code><a href="Types#string">string</a> document, [<a href="Types#table">table</a> data, <a href="Types#unumber">unumber</a> level]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#string">string</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `document`: The template-enabled document to render.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `data`: The data to pass to the template.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `level`: What level of templates to execute.</li>
</ul>

Compiles and executes a template-enabled document with the given data.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> TemplateEngine:Compile(<code><a href="Types#string">string</a> document, [<a href="Types#unumber">unumber</a> level]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#string">string</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `document`: The document containing templates to compile.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `level`: The level of template to use, defaults to 0.</li>
</ul>

Takes the contents of a templated document and compiles it to a piece of Lua code.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> TemplateEngine:Execute(<code><a href="Types#string">string</a> compiled, [<a href="Types#table">table</a> data]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#string">string</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `compiled`: A piece of Lua code that was compiled from a templated document.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `data`: Data to pass into the template.</li>
</ul>

Executes an already-compiled Soquid document with the given data and returns the result.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> TemplateEngine:AddPartial(<code><a href="Types#string">string</a> name, <a href="Types#string">string</a> document, [<a href="Types#unumber">unumber</a> level]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `name`: The name of the partial document.</li>
<li><span class="doc-arg-level doc-required">required</span>  `document`: The body of the partial document.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `level`: The level of templates used in the document.</li>
</ul>

Adds a partial document with a given name and body.

<hr />
## Properties
[none]