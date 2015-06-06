<h1 class="class-title">Metadata</h1>
<span class="file-link">(in [./Carbon/Metadata.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Metadata.lua))</span><br/>

Provides an interface to the Graphene Metadata API in a more friendly way.
Metadata is normally handled at the Graphene level because it allows modules to register themselves automatically.


<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Metadata:Get(<code><a href="Types#any">any</a> object, [<a href="Types#any">any</a> field]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#any">any</a>?</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `object`: The object to look up metadata for.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `field`: A field, if specified, to query the object for.</li>
</ul>

Requests metadata about the given object.

If the field argument is given, that key is returned from the object if the object exists.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Metadata:Set(<code><a href="Types#any">any</a> object, [<a href="Types#any">any</a> metadata]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `object`: The object to set metadata for.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `metadata`: The metadata to set for the object, specify nil to remove the object's metadata.</li>
</ul>

Associates the given object with a piece of metadata.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Metadata:Disable()</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">

</ul>

Disables metadata storage.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Metadata:Enable()</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">

</ul>

Enables metadata storage.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Metadata:RegisterMethods(<code><a href="Types#table">table</a> object, <a href="Types#table">table</a> metadata</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `object`: An object that contains methods to register.</li>
<li><span class="doc-arg-level doc-required">required</span>  `metadata`: The metadata object associated with this object.</li>
</ul>

Automatically registers all the methods of a given object with the registry.

<hr />
## Properties
[none]