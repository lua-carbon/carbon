<h1 class="class-title">Serialization</h1>
<span class="file-link">(in [./Carbon/Serialization/_.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Serialization/_.lua))</span><br/>

Provides serialization facilities for Carbon. Relies on <a href="Classes/Metadata">Metadata</a> being enabled.


<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Serialization.Deserialize(<code><a href="Types#string">string</a> source, [<a href="Classes/Serialization.Format">Format</a> format]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#any">any</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `source`: The serialized data in the form of a string.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `format`: The format to use; autodetected if not specified.</li>
</ul>

Deserializes a serialized object.

If no deserializer for the format could be found, returns (false, <a href="Classes/Exceptions.NotImplementedException">NotImplementedException</a>)
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Serialization.Serialize(<code><a href="Types#any">any</a> object, <a href="Classes/Serialization.Format">Format</a> format</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#string">string</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `object`: The object to serialize.</li>
<li><span class="doc-arg-level doc-required">required</span>  `format`: The <a href="Classes/Serialization.Format">Format</a> to serialize the object into.</li>
</ul>

Serializes an object into the specified data format.

<hr />
## Properties
[none]