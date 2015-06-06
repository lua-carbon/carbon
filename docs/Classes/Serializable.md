<h1 class="class-title">Serializable</h1>
<span class="file-link">(in [./Carbon/Serializable.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Serializable.lua))</span><br/>

**Abstract**

Provides an interface to serialize and deserialize data.

All methods provided by this class that are not overridden throw a <a href="Classes/NotImplementedException">NotImplementedException</a>.

<span class="bold">Inherits <a href="Classes/OOP.Object">OOP.Object</a></span>

<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Serializable.Deserialize(<code><a href="Types#string">string</a> source, <a href="Classes/Serializable">Serializable</a> out</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Serializable">Serializable</a> out</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `source`: A string containing a serialized representation of an instance of this class.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to place the resulting data.</li>
</ul>

Deserializes the given source string and places it into the given <a href="Classes/Serializable">Serializable</a> <code>out</code> object, if given, or a new instance of the class.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Serializable:Deserialize!(<code><a href="Types#string">string</a> source</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `source`: A string containing a serialized representation of an instance of this class.</li>
</ul>

Deserializes a previously serialized instance of this class.
Places the data into the class this method is called on.

Can be called with self:Deserialize!(source) in Carbide Lua.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Serializable:Serialize()</h4>
<p class="method-returns bold">Returns <code>string</code></p>
<ul class="doc-arg-list">

</ul>

Serializes the object into a string representation.

<hr />
## Properties
[none]