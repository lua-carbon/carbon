<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Promise</h1>
<span class="file-link">(in [./Carbon/Promise.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Promise.lua))</span><br/>

Implements a model for asynchronous tasks via promises.

A type of <code>Promise&lt;T&gt;</code> is a Promise that returns the given type, `T`.


<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Promise:New()</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Promise">Promise</a></code></p><h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Promise:PlacementNew(<code><a href="Classes/Promise">Promise</a>? out</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Promise">Promise</a></code></p>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Promise:Init()</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">

</ul>

Creates or initializes a <a href="Classes/Promise">Promise</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Promise:Catch(<code>[<a href="Types#function">function</a> fail]</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `fail`: The function to call if this promise fails.</li>
</ul>

Syntactical sugar for <code>promise:Then(nil, fail)</code>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Promise:Reject(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `...`: A list of parameters to be passed as the result.</li>
</ul>

Rejects the promise, passing along a set of results.

Counts the promise as a failure.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Promise:Resolve(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `...`: A list of parameters to be passed as the result.</li>
</ul>

Resolves the promise, passing along a set of results.

Counts the promise as a success.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Promise:Then(<code>[<a href="Types#function">function</a> success, <a href="Types#function">function</a> fail]</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `success`: The function to call if this promise succeeds.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `fail`: The function to call if this promise fails.</li>
</ul>

Registers an action to occur after this promise resolves.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Promise:All(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Promise">Promise</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `...`: A list of promises to wait for.</li>
</ul>

Returns a promise that resolves when all of the given promises resolve.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Promise:Any(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Promise">Promise</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `...`: A list of promises to wait for.</li>
</ul>

Returns a promise that resolves when any one of the given promises resolves.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Promise&lt;T&gt;:Await()</h4>
<p class="method-returns bold">Returns <code>T</code></p>
<ul class="doc-arg-list">

</ul>

Yields until the promise has a result to give.

Can only be called from an asynchronous method.

<hr />
## Properties
[none]