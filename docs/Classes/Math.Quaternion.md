<h1 class="class-title">Math.Quaternion</h1>
<span class="file-link">(in [./Carbon/Math/Quaternion.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Math/Quaternion.lua))</span><br/>

Provides a quaternion object for representing rotations.

The loose form of a <a href="Classes/Math.Quaternion">Quaternion</a>, <code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Quaternion">Quaternion</a>&gt;</code> is of the form <code>(x, y, z, w)</code>

<span class="bold">Inherits <a href="Classes/Math.Vector">Math.Vector</a><4></span>

<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Quaternion:NewFromAngles(<code><a href="Classes/Math.Vector3">Vector3</a> angles</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Quaternion">Quaternion</a></code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Quaternion:InitFromAngles(<code><a href="Classes/Math.Vector3">Vector3</a> angles</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `angles`: A <a href="Classes/Math.Vector3">Vector3</a> containing the angles to convert.</li>
</ul>

Converts a <a href="Classes/Math.Vector3">Vector3</a> containing Euler angles into a <a href="Classes/Math.Quaternion">Quaternion</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Quaternion:NewFromLooseAngles(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Quaternion">Quaternion</a></code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Quaternion:InitFromLooseAngles(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
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
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Quaternion:LooseMultiplyLooseLoose(<code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Quaternion">Quaternion</a>&gt; a, <a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Quaternion">Quaternion</a>&gt; b</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Quaternion">Quaternion</a>&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `a`: The left operand on the multiply.</li>
<li><span class="doc-arg-level doc-required">required</span>  `b`: The right operand on the multiply.</li>
</ul>

Multiplies two loose quaternions together and returns the result in loose form.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> <a href="Classes/Math.Quaternion">Quaternion</a>:LooseMultiplyLoose(<code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Quaternion">Quaternion</a>&gt; quaternion</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Quaternion">Quaternion</a>&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `quaternion`: The quaternion to multiply with.</li>
</ul>

Multiplies the quaternion with a loose <a href="Classes/Math.Quaternion">Quaternion</a>, yielding a <a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Quaternion">Quaternion</a>&gt;.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> <a href="Classes/Math.Quaternion">Quaternion</a>:Slerp(<code><a href="Classes/Math.Quaternion">Quaternion</a> other, <a href="Types#number">number</a> t, [<a href="Classes/Math.Quaternion">Quaternion</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `other`: The <a href="Classes/Math.Quaternion">Quaternion</a> to slerp with.</li>
<li><span class="doc-arg-level doc-required">required</span>  `t`: A number, normally on [0, 1], that determines the mixing ratio of the quaternions.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the resulting slerped <a href="Classes/Math.Quaternion">Quaternion</a>.</li>
</ul>

Performs a <a href="Classes/Math.Quaternion">Quaternion</a> slerp (spherical interpolation).
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
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Quaternion:LooseConjugate()</h4>
<p class="method-returns bold">Returns <code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Quaternion">Quaternion</a>&gt;</code></p>
<ul class="doc-arg-list">

</ul>

Returns the conjugate of the quaternion in loose form.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Quaternion:Multiply(<code><a href="Classes/Math.Quaternion">Quaternion</a> other, [<a href="Classes/Math.Quaternion">Quaternion</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Quaternion">Quaternion</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `other`: The quaternion to multiply with.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the resulting data.</li>
</ul>

Multiplies the quaternion with another <a href="Classes/Math.Quaternion">Quaternion</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Quaternion:Multiply!(<code><a href="Classes/Math.Quaternion">Quaternion</a> other</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Quaternion:MultiplyInPlace(<code><a href="Classes/Math.Quaternion">Quaternion</a> other</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `other`: The quaternion to multiply with.</li>
</ul>

Multiplies the quaternion with another <a href="Classes/Math.Quaternion">Quaternion</a> and puts the result in the first <a href="Classes/Math.Quaternion">Quaternion</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Quaternion:MultiplyLoose(<code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Quaternion">Quaternion</a>&gt; quaternion, [<a href="Classes/Math.Quaternion">Quaternion</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Quaternion">Quaternion</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `quaternion`: The loose quaternion to multiply with.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the resulting data.</li>
</ul>

Multiplies the quaternion with a loose <a href="Classes/Math.Quaternion">Quaternion</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Quaternion:MultiplyLoose!(<code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Quaternion">Quaternion</a>&gt; quaternion</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Quaternion">Quaternion</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `quaternion`: The loose quaternion to multiply with.</li>
</ul>

Multiplies this quaternion with another loose <a href="Classes/Math.Quaternion">Quaternion</a> in-place.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Quaternion:Slerp!(<code><a href="Classes/Math.Quaternion">Quaternion</a> other, <a href="Types#number">number</a> t</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> <a href="Classes/Math.Quaternion">Quaternion</a>:SlerpInPlace(<code><a href="Classes/Math.Quaternion">Quaternion</a> other, <a href="Types#number">number</a> t</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `other`: The <a href="Classes/Math.Quaternion">Quaternion</a> to slerp with.</li>
<li><span class="doc-arg-level doc-required">required</span>  `t`: A number, normally on [0, 1], that determines the mixing ratio of the quaternions.</li>
</ul>

Performs a <a href="Classes/Math.Quaternion">Quaternion</a> slerp (spherical interpolation) in place.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Quaternion:TransformVector(<code><a href="Classes/Math.Vector3">Vector3</a> vec, [<a href="Classes/Math.Vector3">Vector3</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `vec`: The vector to rotate.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the resulting data.</li>
</ul>

Transforms a vector by rotating it.

<hr />
## Properties
[none]