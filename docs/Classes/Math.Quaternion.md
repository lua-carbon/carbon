<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Math.Quaternion</h1>
<span class="file-link">(in [./Carbon/Math/Quaternion.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Math/Quaternion.lua))</span><br/>

Provides a quaternion object for representing rotations.

The loose form of a <a href="Classes/Math.Quaternion">Quaternion</a>, <code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Quaternion">Quaternion</a>&gt;</code> is of the form <code>(x, y, z, w)</code>

<span class="bold">Inherits <a href="Classes/Math.Vector">Math.Vector</a><4></span>

<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Quaternion:NewFromAngles(<code><a href="Classes/Math.Vector3">Vector3</a> angles</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Quaternion">Quaternion</a></code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Quaternion:InitFromAngles(<code><a href="Classes/Math.Vector3">Vector3</a> angles</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Quaternion">Quaternion</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `angles`: A <a href="Classes/Math.Vector3">Vector3</a> containing the angles to convert.</li>
</ul>

Converts a <a href="Classes/Math.Vector3">Vector3</a> containing Euler angles into a <a href="Classes/Math.Quaternion">Quaternion</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Quaternion:NewFromLooseAngles(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Quaternion">Quaternion</a></code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Quaternion:InitFromLooseAngles(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `x`: The x component of the angles.</li>
<li><span class="doc-arg-level doc-required">required</span>  `y`: The y component of the angles.</li>
<li><span class="doc-arg-level doc-required">required</span>  `z`: The z component of the angles.</li>
</ul>

Converts a <a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Vector3">Vector3</a>&gt; containing Euler angles into a <a href="Classes/Math.Quaternion">Quaternion</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Quaternion:NewLooseFromAngles(<code><a href="Classes/Math.Vector3">Vector3</a> angles</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Quaternion">Quaternion</a>&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `angles`: A <a href="Classes/Math.Vector3">Vector3</a> containing the angles to convert.</li>
</ul>

Converts a <a href="Classes/Math.Vector3">Vector3</a> containing Euler angles into a loose <a href="Classes/Math.Quaternion">Quaternion</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Quaternion:NewLooseFromLooseAngles(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Quaternion">Quaternion</a>&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `x`: The x component of the angles.</li>
<li><span class="doc-arg-level doc-required">required</span>  `y`: The y component of the angles.</li>
<li><span class="doc-arg-level doc-required">required</span>  `z`: The z component of the angles.</li>
</ul>

Converts a <a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Vector3">Vector3</a>&gt; containing Euler angles into a loose <a href="Classes/Math.Quaternion">Quaternion</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Quaternion:Conjugate(<code>[<a href="Classes/Math.Quaternion">Quaternion</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Quaternion">Quaternion</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the resulting data.</li>
</ul>

Returns the conjugate of the <a href="Classes/Math.Quaternion">Quaternion</a>, <code>(-i, -j, -k, w)</code>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Quaternion:Conjugate!()</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Quaternion">Quaternion</a></code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Quaternion:ConjugateInPlace()</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Quaternion">Quaternion</a></code></p>
<ul class="doc-arg-list">

</ul>

Conjugates the <a href="Classes/Math.Quaternion">Quaternion</a> in-place.

<hr />
## Properties
[none]