<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">OOP</h1>
<span class="file-link">(in [./Carbon/OOP.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/OOP.lua))</span><br/>

Provides object orientation features for Carbon.


<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> OOP:StaticClass()</h4>
<p class="method-returns bold">Returns <code><a href="Classes/StaticClass">StaticClass</a></code></p>
<ul class="doc-arg-list">

</ul>

Creates a static class, enabling it to inherit from other objects without having instantiation capability.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> OOP:Class(<code>[Class based_on]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Class">Class</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `based_on`: A class to make a direct copy of for the basis of this class.</li>
</ul>

Creates a new, empty class.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> OOP:RegisterAttribute(<code><a href="Types#string">string</a> type, <a href="Types#any">any</a> identifier, function method</code>)</h4>
<p class="method-returns bold">Returns <code>void</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `type`: The type of attribute (Class, PreInitialize, PostInitialize, or Copy).</li>
<li><span class="doc-arg-level doc-required">required</span>  `identifier`: The identifier of the attribute.</li>
<li><span class="doc-arg-level doc-required">required</span>  `method`: The class applicator. For function signatures, see below.</li>
</ul>

Registers a new custom class attribute.

<ul><li>Class: <code><a href="Types#void">void</a> function(class)</code><br />	Called immediately when the attribute is added to the class.</li></ul>

<ul><li>PreInitialize: <code><a href="Types#void">void</a> function(class, instance)</code><br />	Called after instance allocation but before the object's initializer is called.</li></ul>

<ul><li>PostInitialize: <code><a href="Types#void">void</a> function(class, instance)</code><br />	Called after the object is fully initialized.</li></ul>

<ul><li>Copy: <code><a href="Types#void">void</a> function(original, copy)</code><br />	Called after the copied object has been allocated and filled.</li></ul>
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> OOP:SetAttributeInherited(<code><a href="Types#any">any</a> identifier, <a href="Types#bool">bool</a> inherited</code>)</h4>
<p class="method-returns bold">Returns <code>void</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `identifier`: The identifier of the attribute to define a value for.</li>
<li><span class="doc-arg-level doc-required">required</span>  `inherited`: Whether inheriting a class will also inherit this attribute.</li>
</ul>

Marks an attribute as inherited or not inherited explicitly.

<hr />
## Properties
[none]