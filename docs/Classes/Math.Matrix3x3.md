<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Math.Matrix3x3</h1>
<span class="file-link">(in [./Carbon/Math/Matrix3x3.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Math/Matrix3x3.lua))</span><br/>

A 3x3 row-major matrix.

<span class="bold">Inherits <a href="Classes/Math.Matrix">Math.Matrix</a></span>

<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix3x3:Orthonormalize(<code>[<a href="Classes/Math.Matrix3x3">Matrix3x3</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix3x3">Matrix3x3</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the resulting data, a new matrix if not given.</li>
</ul>

Orthonormalizes the rotation matrix, optionally outputting data into an existing <a href="Classes/Math.Matrix3x3">Matrix3x3</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix3x3:Orthonormalize!()</h4>
<p class="method-returns bold">Returns <code>self</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix3x3:OrthonormalizeInPlace()</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">

</ul>

Orthonormalizes the matrix in-place.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix3x3:ToLooseQuaternion()</h4>
<p class="method-returns bold">Returns <code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Quaternion">Quaternion</a>&gt;</code></p>
<ul class="doc-arg-list">

</ul>

Converts the <a href="Classes/Math.Matrix3x3">Matrix3x3</a> into a loose-form <a href="Classes/Math.Quaternion">Quaternion</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix3x3:ToQuaternion()</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Quaternion">Quaternion</a></code></p>
<ul class="doc-arg-list">

</ul>

Converts the <a href="Classes/Math.Matrix3x3">Matrix3x3</a> into a <a href="Classes/Math.Quaternion">Quaternion</a>.

<hr />
## Properties
[none]