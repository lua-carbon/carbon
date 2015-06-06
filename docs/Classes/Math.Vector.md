<h1 class="class-title">Math.Vector</h1>
<span class="file-link">(in [./Carbon/Math/Vector.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Math/Vector.lua))</span><br/>

**Abstract Template <code>Vector&lt;N&gt;</code>**

Provides a metaprogramming-driven method of generating N-length vectors.

Presently has a hard maximum component count of 26, can be expanded upon request.

<span class="bold">Inherits <a href="Classes/OOP.Object">OOP.Object</a></span>

<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Vector&lt;N&gt;:New(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Vector">Vector</a>&lt;N&gt;</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Vector&lt;N&gt;:Init(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `...`: The arguments to the intialization. Should be `N` arguments long.</li>
</ul>

Creates a new <a href="Classes/Math.Vector">Vector</a> with `N` components.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> (<code><a href="Types#number">number</a>, <a href="Classes/Math.Vector">Vector</a>&lt;N&gt;</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `other`: The object to multiply with; a vector, matrix, or number.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the resulting data, if specified.</li>
</ul>


<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> Vector:Generate(<code><a href="Types#uint">uint</a> length, [<a href="Types#dictionary">dictionary</a> parameters]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Vector">Vector</a>&lt;length&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `length`: The length of the vector.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `parameters`: Options for generating the class:</li>
</ul>

Generates a new Vector class with the given keys and parameters. Results are cached, but this method may still be slow.
It performs runtime code generation and template parsing on each generated class.

The following parameters are valid:

<ul><li><a href="Types#number">number</a> NormalizedLength (1): The length the vector reaches when normalized.<li><a href="Types#number">number</a> DefaultValue (0): The value to initialize all members to if not given.</li><li><a href="Types#list">list</a>&lt;<a href="Types#number">number</a>&gt; DefaultValues: A list of values to initialize specific keys to. If any are given, all keys must be specified.</li></li></ul>
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Vector:LooseScale(<code><a href="Types#number">number</a> scalar</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#loose">loose</a>&lt;Vector&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `scalar`: The value to scale by.</li>
</ul>

Scales the <a href="Classes/Math.Vector">Vector</a> and returns it in <a href="Types#loose">loose</a> form.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Vector:Scale(<code><a href="Types#number">number</a> scalar, [<a href="Classes/Math.Vector">Vector</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Vector">Vector</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `scalar`: The value to scale by.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the resulting data.</li>
</ul>

Scales the <a href="Classes/Math.Vector">Vector</a>, optionally outputting into an existing <a href="Classes/Math.Vector">Vector</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Vector:Scale!(<code><a href="Types#number">number</a> scalar</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Vector">Vector</a></code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Vector:ScaleInPlace(<code><a href="Types#number">number</a> scalar</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Vector">Vector</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `scalar`: The value to scale by.</li>
</ul>

Scales the <a href="Classes/Math.Vector">Vector</a> in place.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Vector&lt;N&gt;:DotMultiply(<code><a href="Classes/Math.Vector">Vector</a>&lt;N&gt; other</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#number">number</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `other`: The <a href="Classes/Math.Vector">Vector</a> to multiply with.</li>
</ul>

Performs a dot product between two vectors.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Vector&lt;N&gt;:GetComponents()</h4>
<p class="method-returns bold">Returns <code><a href="Types#tuple">tuple</a>&lt;N, unumber&gt;</code></p>
<ul class="doc-arg-list">

</ul>

Returns the individual components of the <a href="Classes/Math.Vector">Vector</a>&lt;N&gt; in order. Much faster than <code>unpack</code>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Vector&lt;N&gt;:Length()</h4>
<p class="method-returns bold">Returns <code><a href="Types#unumber">unumber</a></code></p>
<ul class="doc-arg-list">

</ul>

Returns the length of the vector.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Vector&lt;N&gt;:LengthSquared()</h4>
<p class="method-returns bold">Returns <code><a href="Types#unumber">unumber</a></code></p>
<ul class="doc-arg-list">

</ul>

Returns the length of the vector squared.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Vector&lt;N&gt;:Normalize(<code>[<a href="Classes/Math.Vector">Vector</a>&lt;N&gt; out]</code>)</h4>
<p class="method-returns bold">Returns <code>out</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to place the data of the normalized vector. A new `Vector<N>` if not given.</li>
</ul>

Normalizes the <a href="Classes/Math.Vector">Vector</a>&lt;N&gt; object, optionally outputting the data to an existing <a href="Classes/Math.Vector">Vector</a>&lt;N&gt;.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Vector&lt;N&gt;:Normalize!()</h4>
<p class="method-returns bold">Returns <code>self</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Vector&lt;N&gt;:NormalizeInPlace()</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">

</ul>

Normalizes the vector in-place.

Called in Carbide as <code>Vector:Normalize!()</code>
<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-private">private</span> Vector:__generate_method(<code><a href="Types#string">string</a> body, <a href="Types#dictionary">dictionary</a> arguments, [<a href="Types#dictionary">dictionary</a> env]</code>)</h4>
<p class="method-returns bold">Returns <code>function</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `body`: Template-enabled code to return a function.</li>
<li><span class="doc-arg-level doc-required">required</span>  `arguments`: Arguments to the template</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `env`: The environment to generate the method under.</li>
</ul>

Generates a method using Carbon's TemplateEngine and handles errors.

<hr />
## Properties
[none]