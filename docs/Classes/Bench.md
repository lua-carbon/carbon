<h1 class="class-title">Bench</h1>
<span class="file-link">(in [./Carbon/Bench.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Bench.lua))</span><br/>

Helps to benchmark things!


<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Bench:Add(<code><a href="Types#string">string</a> name, <a href="Types#function">function</a> method</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `name`: The name of the benchmark to add.</li>
<li><span class="doc-arg-level doc-required">required</span>  `method`: A single iteration of the benchmark.</li>
</ul>

Adds a benchmark to be tested with this benchmark.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Bench:Describe(<code><a href="Types#string">string</a> desc</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `desc`: The description of the bench.</li>
</ul>

Adds a description to this <a href="Classes/Bench">Bench</a> to be used when showing results.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Bench:Results()</h4>
<p class="method-returns bold">Returns <code><a href="Types#string">string</a></code></p>
<ul class="doc-arg-list">

</ul>

Returns the results of the benchmark; only valid after calling <code>Bench:Run()</code>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Bench:Run(<code><a href="Types#unumber">unumber</a> iterations</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `iterations`: The number of iterations to run the bench for.</li>
</ul>

Runs all registered benchmarks on this <a href="Classes/Bench">Bench</a>.

<hr />
## Properties
[none]