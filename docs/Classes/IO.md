<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">IO</h1>
<span class="file-link">(in [./Carbon/IO.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/IO.lua))</span><br/>

Provides async and sync I/O operations that work on multiple platforms.

<span class="bold">Inherits [none]</span>

<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> IO.Open(<code><a href="Types#string">string</a> path, [<a href="Types#string">string</a> mode, <a href="Classes/Nanotube">Nanotube</a> tube]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/File">File</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `path`: The path to the file to open.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `mode`: The file mode to open the file with. Defaults to "rb".</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `tube`: The Nanotube object to cycle file events through with asynchronous I/O calls on this file.</li>
</ul>

Opens a new <a href="Classes/File">File</a> object.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> IO.Close(<code><a href="Classes/File">File</a> self</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> File:Close()</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">

</ul>

Closes the file.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> IO.Read(<code><a href="Classes/File">File</a> self</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#string">string</a></code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> File:Read()</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">

</ul>

Reads the entire contents of the file.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> IO.ReadBufferAsync(<code><a href="Classes/File">File</a> self, [<a href="Types#list">list</a>&lt;<a href="Types#string">string</a>&gt; into]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Promise">Promise</a>&lt;<a href="Types#list">list</a>&lt;<a href="Types#string">string</a>&gt;&gt;</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> File:ReadBufferAsync(<code>[<a href="Types#list">list</a>&lt;<a href="Types#string">string</a>&gt; into]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Promise">Promise</a>&lt;<a href="Types#list">list</a>&lt;<a href="Types#string">string</a>&gt;&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `into`: A list to write the output into instead of creating a new buffer.</li>
</ul>

Reads a file and amortizes its loading through an event loop.
Returns the raw buffer, containing a series of strings.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> IO.ReadBufferAsync(<code>File self</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Promise">Promise</a>&lt;<a href="Types#string">string</a>&gt;</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> File:ReadBufferAsync()</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Promise">Promise</a>&lt;<a href="Types#string">string</a>&gt;</code></p>
<ul class="doc-arg-list">

</ul>

Reads a file and amortizes its loading through an event loop.
The same as <code>File:ReadAsync()</code>
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> IO.ReadFileAsync(<code><a href="Types#string">string</a> path, [<a href="Classes/Nanotube">Nanotube</a> tube]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Promise">Promise</a>&lt;string&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `path`: The path to the file to read.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `tube`: The Nanotube object to cycle events through. Defaults to the global tube.</li>
</ul>

Opens a file by a path and returns its contents through a <a href="Classes/Promise">Promise</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> IO.Write(<code><a href="Classes/File">File</a> self, <a href="Types#string">string</a> contents</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> File:Write(<code><a href="Types#string">string</a> contents</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `contents`: The file contents</li>
</ul>

Writes to the file.

<hr />
## Properties
[none]