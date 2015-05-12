<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Math.Matrix4x4</h1>
<span class="file-link">(in [./Carbon/Math/Matrix4x4.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Math/Matrix4x4.lua))</span><br/>

A 4x4 row-major matrix.

<span class="bold">Inherits <a href="Classes/Math.Matrix3x3">Math.Matrix3x3</a>, <a href="Classes/Math.Matrix">Math.Matrix</a></span>

<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:NewFromLooseQuaternion(<code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Quaternion">Quaternion</a>&gt; quaternion</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix4x4">Matrix4x4</a></code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:InitFromLooseQuaternion(<code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Quaternion">Quaternion</a>&gt; quaternion</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `quaternion`: The quaternion to initialize the matrix with.</li>
</ul>

Creates a new <a href="Classes/Math.Matrix4x4">Matrix4x4</a> from a <a href="Classes/Math.Quaternion">Quaternion</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:NewFromQuaternion(<code><a href="Classes/Math.Quaternion">Quaternion</a> quaternion</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix4x4">Matrix4x4</a></code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:InitFromQuaternion(<code><a href="Classes/Math.Quaternion">Quaternion</a> quaternion</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `quaternion`: The quaternion to initialize the matrix with.</li>
</ul>

Creates a new <a href="Classes/Math.Matrix4x4">Matrix4x4</a> from a <a href="Classes/Math.Quaternion">Quaternion</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:NewLookAt(<code><a href="Classes/Vector3">Vector3</a> eye, <a href="Classes/Vector3">Vector3</a> center, <a href="Classes/Vector3">Vector3</a> up</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix4x4">Matrix4x4</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `eye`: The position of the observer.</li>
<li><span class="doc-arg-level doc-required">required</span>  `center`: The focus of the observer.</li>
<li><span class="doc-arg-level doc-required">required</span>  `up`: The upwards direction for the observer.</li>
</ul>

Creates a projection to look at a point from another.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:NewLooseFromLooseQuaternion(<code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Quaternion">Quaternion</a>&gt; quaternion</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#loose">loose</a>&lt;Matrix4x4&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `quaternion`: The quaternion, in loose form, to convert.</li>
</ul>

Takes a loose <a href="Classes/Math.Quaternion">Quaternion</a> and returns a loose rotation matrix from it.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:NewLooseFromQuaternion(<code><a href="Classes/Math.Quaternion">Quaternion</a> quaternion</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#loose">loose</a>&lt;Matrix4x4&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `quaternion`: The quaternion to convert.</li>
</ul>

Takes a <a href="Classes/Math.Quaternion">Quaternion</a> and returns a loose rotation matrix from it.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:NewOrthographic(<code><a href="Types#number">number</a> l, <a href="Types#number">number</a> r, <a href="Types#number">number</a> t, <a href="Types#number">number</a> b, <a href="Types#number">number</a> near, <a href="Types#number">number</a> far</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix4x4">Matrix4x4</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `l`: The left edge of the projection.</li>
<li><span class="doc-arg-level doc-required">required</span>  `r`: The right edge of the projection.</li>
<li><span class="doc-arg-level doc-required">required</span>  `t`: The top edge of the projection.</li>
<li><span class="doc-arg-level doc-required">required</span>  `b`: The bottom edge of the projection.</li>
<li><span class="doc-arg-level doc-required">required</span>  `near`: The near plane of the projection.</li>
<li><span class="doc-arg-level doc-required">required</span>  `far`: The far plane of the projection.</li>
</ul>

Creates an orthographic projection matrix with the given properties
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:NewPerspective(<code><a href="Types#number">number</a> fov, <a href="Types#number">number</a> aspect, <a href="Types#number">number</a> near, <a href="Types#number">number</a> far</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix4x4">Matrix4x4</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `fov`: The field of view in radians.</li>
<li><span class="doc-arg-level doc-required">required</span>  `aspect`: The aspect ratio of the observer.</li>
<li><span class="doc-arg-level doc-required">required</span>  `near`: The near plane of the projection.</li>
<li><span class="doc-arg-level doc-required">required</span>  `far`: The far plane of the projection.</li>
</ul>

Creates a perspective matrix with the given properties.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:LooseRotationX(<code><a href="Types#number">number</a> t, ...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Matrix4x4">Matrix4x4</a>&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `t`: The amount to rotate, in radians.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `...`: Data to pipe through the method.</li>
</ul>

Returns a <a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Matrix4x4">Matrix4x4</a>&gt; representing a rotation `t` radians around the X axis.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:RotationX(<code><a href="Types#number">number</a> t, ...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix4x4">Matrix4x4</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `t`: The amount to rotate, in radians.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `...`: Data to pipe through the method.</li>
</ul>

Returns a <a href="Classes/Math.Matrix4x4">Matrix4x4</a> representing a rotation `t` radians around the X axis.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:RotateX(<code><a href="Types#number">number</a> t, [<a href="Classes/Math.Matrix4x4">Matrix4x4</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix4x4">Matrix4x4</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `t`: The amount to rotate, in radians.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the resulting data.</li>
</ul>

Rotates the matrix around the X axis.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:RotateX!(<code><a href="Types#number">number</a> t</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:RotateXInPlace(<code><a href="Types#number">number</a> t</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `t`: The amount to rotate, in radians.</li>
</ul>

Rotates the matrix around the X axis in place.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:LooseRotationY(<code><a href="Types#number">number</a> t, ...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Matrix4x4">Matrix4x4</a>&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `t`: The amount to rotate, in radians.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `...`: Data to pipe through the method.</li>
</ul>

Returns a <a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Matrix4x4">Matrix4x4</a>&gt; representing a rotation `t` radians around the Y axis.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:RotationY(<code><a href="Types#number">number</a> t, ...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix4x4">Matrix4x4</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `t`: The amount to rotate, in radians.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `...`: Data to pipe through the method.</li>
</ul>

Returns a <a href="Classes/Math.Matrix4x4">Matrix4x4</a> representing a rotation `t` radians around the Y axis.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:RotateY(<code><a href="Types#number">number</a> t, [<a href="Classes/Math.Matrix4x4">Matrix4x4</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix4x4">Matrix4x4</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `t`: The amount to rotate, in radians.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the resulting data.</li>
</ul>

Rotates the matrix around the Y axis.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:RotateY!(<code><a href="Types#number">number</a> t</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:RotateXInPlace(<code><a href="Types#number">number</a> t</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `t`: The amount to rotate, in radians.</li>
</ul>

Rotates the matrix around the Y axis in place.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:LooseRotationZ(<code><a href="Types#number">number</a> t, ...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Matrix4x4">Matrix4x4</a>&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `t`: The amount to rotate, in radians.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `...`: Data to pipe through the method.</li>
</ul>

Returns a <a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Matrix4x4">Matrix4x4</a>&gt; representing a rotation `t` radians around the Z axis.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:RotationZ(<code><a href="Types#number">number</a> t, ...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix4x4">Matrix4x4</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `t`: The amount to rotate, in radians.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `...`: Data to pipe through the method.</li>
</ul>

Returns a <a href="Classes/Math.Matrix4x4">Matrix4x4</a> representing a rotation `t` radians around the Z axis.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:RotateZ(<code><a href="Types#number">number</a> t, [<a href="Classes/Math.Matrix4x4">Matrix4x4</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix4x4">Matrix4x4</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `t`: The amount to rotate, in radians.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the resulting data.</li>
</ul>

Rotates the matrix around the Z axis.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:RotateZ!(<code><a href="Types#number">number</a> t</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:RotateXInPlace(<code><a href="Types#number">number</a> t</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `t`: The amount to rotate, in radians.</li>
</ul>

Rotates the matrix around the Z axis in place.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:LooseScaling(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix4x4">Matrix4x4</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `x`: The amount to scale on the X axis.</li>
<li><span class="doc-arg-level doc-required">required</span>  `y`: The amount to scale on the Y axis.</li>
<li><span class="doc-arg-level doc-required">required</span>  `z`: The amount to scale on the Z axis.</li>
</ul>

Returns a <a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Matrix4x4">Matrix4x4</a>&gt; representing a scaling transformation.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:Rotation(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z, [<a href="Classes/Math.Matrix4x4">Matrix4x4</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix4x4">Matrix4x4</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `x`: The x component of the rotation.</li>
<li><span class="doc-arg-level doc-required">required</span>  `y`: The y component of the rotation.</li>
<li><span class="doc-arg-level doc-required">required</span>  `z`: The z component of the rotation.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the data for the rotation.</li>
</ul>

Creates a rotation matrix with the given Euler angles.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:Scale(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z, [<a href="Classes/Math.Matrix4x4">Matrix4x4</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix4x4">Matrix4x4</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `x`: The amount to scale on the X axis.</li>
<li><span class="doc-arg-level doc-required">required</span>  `y`: The amount to scale on the Y axis.</li>
<li><span class="doc-arg-level doc-required">required</span>  `z`: The amount to scale on the Z axis.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the resulting data.</li>
</ul>

Scales the Matrix4x4, optionally outputting to an existing <a href="Classes/Math.Matrix4x4">Matrix4x4</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:Scale!(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p><h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:ScaleInPlace(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `x`: The amount to scale on the X axis.</li>
<li><span class="doc-arg-level doc-required">required</span>  `y`: The amount to scale on the Y axis.</li>
<li><span class="doc-arg-level doc-required">required</span>  `z`: The amount to scale on the Z axis.</li>
</ul>

Scales the Matrix4x4 in place.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:Scaling(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix4x4">Matrix4x4</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `x`: The amount to scale on the X axis.</li>
<li><span class="doc-arg-level doc-required">required</span>  `y`: The amount to scale on the Y axis.</li>
<li><span class="doc-arg-level doc-required">required</span>  `z`: The amount to scale on the Z axis.</li>
</ul>

Returns a <a href="Classes/Math.Matrix4x4">Matrix4x4</a> representing a scaling transformation.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:Translation(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z, [<a href="Classes/Math.Matrix4x4">Matrix4x4</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix4x4">Matrix4x4</a></code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:Translate(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z, [<a href="Classes/Math.Matrix4x4">Matrix4x4</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix4x4">Matrix4x4</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `x`: The x coordinate of the translation.</li>
<li><span class="doc-arg-level doc-required">required</span>  `y`: The y coordinate of the translation.</li>
<li><span class="doc-arg-level doc-required">required</span>  `z`: The z coordinate of the translation.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the data for the translation.</li>
</ul>

Creates a translation matrix.
The <code>Translate</code> form offsets from an existing matrix.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:GetDeterminant()</h4>
<p class="method-returns bold">Returns <code><a href="Types#number">number</a></code></p>
<ul class="doc-arg-list">

</ul>

Returns the determinant of the matrix.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:GetInverse(<code>[<a href="Classes/Math.Matrix4x4">Matrix4x4</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix4x4">Matrix4x4</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the data, a new matrix if not specified.</li>
</ul>

Yields the inverse of the matrix, optionally outputting into an existing matrix.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:Rotate(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z, [<a href="Classes/Math.Matrix4x4">Matrix4x4</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix4x4">Matrix4x4</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `x`: The x component of the rotation.</li>
<li><span class="doc-arg-level doc-required">required</span>  `y`: The y component of the rotation.</li>
<li><span class="doc-arg-level doc-required">required</span>  `z`: The z component of the rotation.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the data for the rotation.</li>
</ul>

Rotates the <a href="Classes/Math.Matrix4x4">Matrix4x4</a> and outputs its data to <code>out</code>, or a new Matrix4x4 if not given.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:Rotate!(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix4x4:RotateInPlace(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `x`: The x component of the rotation.</li>
<li><span class="doc-arg-level doc-required">required</span>  `y`: The y component of the rotation.</li>
<li><span class="doc-arg-level doc-required">required</span>  `z`: The z component of the rotation.</li>
</ul>

Rotates the <a href="Classes/Math.Matrix4x4">Matrix4x4</a> in place.

<hr />
## Properties
[none]