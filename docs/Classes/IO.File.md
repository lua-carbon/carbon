<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">IO.File</h1>
<span class="file-link">(in [./Carbon/IO.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/IO.lua))</span><br/>

Exposes object-oriented filesystem access. See <a href="Classes/IO">IO</a> for more methods.


<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> File:Close()</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">

</ul>

Closes the file.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> File:Read()</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">

</ul>

Reads the entire contents of the file.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> File:ReadBufferAsync(<code>[<a href="Types#list">list</a>&lt;<a href="Types#string">string</a>&gt; into]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Promise">Promise</a>&lt;<a href="Types#list">list</a>&lt;<a href="Types#string">string</a>&gt;&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `into`: A list to write the output into instead of creating a new buffer.</li>
</ul>

Reads a file and amortizes its loading through an event loop.
Returns the raw buffer, containing a series of strings.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> File:ReadBufferAsync()</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Promise">Promise</a>&lt;<a href="Types#string">string</a>&gt;</code></p>
<ul class="doc-arg-list">

</ul>

Reads a file and amortizes its loading through an event loop.
The same as <code>File:ReadAsync()</code>
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> File:Write(<code><a href="Types#string">string</a> contents</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `contents`: The file contents</li>
</ul>

Writes to the file.

<hr />
## Properties
[none]