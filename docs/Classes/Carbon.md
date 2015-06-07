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

Presently imports:
<ul><li>Async<li>Assert</li><li>Error</li><li>IsObject</li><li>LoadString</li><li>Deprecated</li></li></ul>
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Carbon.Assert(<code><a href="Types#bool">bool</a> condition, [<a href="Types#string">string</a> message]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `condition`: The condition to assert.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `message`: The message to throw if the assertion fails.</li>
</ul>

Asserts, like Lua's assert, but calls tostring on the message explicitly.

**DEPRECATED** in 1.1: Use <code>assert</code> or <code>Exception:ThrowIf</code> (added in 1.1)
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Carbon.Async(<code><a href="Types#function">function</a> method</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#coroutine">coroutine</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `method`: The method to get an asynchronous form of.</li>
</ul>

Returns a version of the given function that is async.

Presently an alias for Lua's <code>coroutine.wrap</code>, but this may change in the future.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Carbon.Deprecated(<code><a href="Types#any">any</a>? thing</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#any">any</a>?</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `thing`: The thing to mark as deprecated.</li>
</ul>

Wraps an object in a deprecation handler.

If the <code>RemoveDeprecated</code> feature is enabled, this method will return nil.

If <code>thing</code> is a function, it will throw a one-time warning on the first call.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Carbon.Disable(<code><a href="Types#any">any</a> ...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `...`: The features to disable</li>
</ul>

Disables a feature by name.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Carbon.Enable(<code><a href="Types#any">any</a> ...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `...`: The features to enable</li>
</ul>

Enables a feature by name.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Carbon.Enabled(<code><a href="Types#any">any</a> feature</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `feature`: The feature to check</li>
</ul>

Returns whether a feature is enabled.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Carbon.Error(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `...`: Arguments to pass to Lua's `error` function.</li>
</ul>

Throws an error, calling tostring on the message explicitly.

**DEPRECATED** in 1.1: Use <code>error</code> or <code>Exception:Throw</code> (added in 1.0)
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
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Carbon.Unpack(<code><a href="Types#table">table</a> t</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#function">function</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `t`: The table to unpack</li>
</ul>

Performs a fast unpack on the table.

<hr />
## Properties
#### <span class="doc-visibility doc-public">public</span> <code><a href="Types#set">set</a></code> Carbon.Features
Contains a set of features and whether they are enabled or disabled.
<hr/>
#### <span class="doc-visibility doc-public">public</span> <code><a href="Types#dictionary">dictionary</a></code> Carbon.Support
Contains the support information provided by Graphene.
<hr/>
#### <span class="doc-visibility doc-public">public</span> <code><a href="Types#list">list</a></code> Carbon.Version
Contains the current version in the form `{major, minor, revision, status}`.
<hr/>
#### <span class="doc-visibility doc-public">public</span> <code><a href="Types#string">string</a></code> Carbon.VersionString
Contains a string version of the current version in the form `"major.minor.revision-status"`.