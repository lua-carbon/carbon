<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Carbon</h1>
<span class="file-link">(in [./Carbon/_.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/_.lua))</span><br/>

This is the Carbon core, containing all other modules and some utilities.


<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Carbon:ImportCore()</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">

</ul>

Imports Carbon's core utilities into the current file for use.

Presently imports <code>Async</code>, <code>Assert</code>, <code>Error</code>, <code>IsObject</code>, and <code>LoadString</code>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Carbon.Assert(<code><a href="Types#bool">bool</a> condition, [<a href="Types#string">string</a> message]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `condition`: The condition to assert.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `message`: The message to throw if the assertion fails.</li>
</ul>

Asserts, like Lua's assert, but calls tostring on the message explicitly.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Carbon.Async(<code><a href="Types#function">function</a> method</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#coroutine">coroutine</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `method`: The method to get an asynchronous form of.</li>
</ul>

Returns a version of the given function that is async.

Presently an alias for Lua's <code>coroutine.wrap</code>, but this may change in the future.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Carbon.Error(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `...`: Arguments to pass to Lua's `error` function.</li>
</ul>

Throws an error, calling tostring on the message explicitly.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Carbon.IsObject(<code><a href="Types#any">any</a> object</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#bool">bool</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `object`: The object to check</li>
</ul>

Returns whether the given object is a valid Carbon object.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Carbon.LoadString(<code><a href="Types#string">string</a> source, [<a href="Types#string">string</a> chunkname, <a href="Types#table">table</a> environment]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#function">function</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `source`: The source code to compile into a function.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `chunkname`: The name of the chunk to reference if the method returns an error.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `environment`: The environment to load the function into.</li>
</ul>

Loads a function with a given environment.
Essentially backports Lua 5.2's load function to LuaJIT and Lua 5.1.

<hr />
## Properties
#### <span class="doc-visibility doc-public">public</span> <code><a href="Types#list">list</a></code> Carbon.Version
Contains the current version in the form `{major, minor, revision, status}`.
<hr/>
#### <span class="doc-visibility doc-public">public</span> <code><a href="Types#string">string</a></code> Carbon.VersionString
Contains a string version of the current version in the form `"major.minor.revision-status"`.