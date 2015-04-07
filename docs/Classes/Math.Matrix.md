<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Math.Matrix</h1>
<span class="file-link">(in [./Carbon/Math/Matrix.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Math/Matrix.lua))</span><br/>

Generates `N`x`M` matrices.

Matrices native to Carbon are Row-Major!

This does not scale very well, but is fast for small values of `N` and `M`.
Works only for matrices smaller than 14x14.
For larger matrices, consider a different implementation.

The 'loose' form of a Matrix, <code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Matrix">Matrix</a>&gt;</code> is of the form <code>(N, M, ...)</code> where `N` and `M`
are the dimensions of the matrix and <code>...</code> represents the values within it.

<span class="bold">Inherits [none]</span>

<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix:New(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix">Matrix</a></code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:Init(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `...`: The values to initialize the matrix with. Each value is nil by default.</li>
</ul>

Initializes or creates a matrix with a set of row-major values.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix:NewFromLoose(<code><a href="Types#unumber">unumber</a> rows, <a href="Types#unumber">unumber</a> columns, ...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix">Matrix</a></code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:InitFromLoose(<code><a href="Types#unumber">unumber</a> rows, <a href="Types#unumber">unumber</a> columns, ...</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `rows`: The number of rows the loose data has.</li>
<li><span class="doc-arg-level doc-required">required</span>  `columns`: The number of columns the loose data has.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `...`: The data to initialize or create the matrix with.</li>
</ul>

Initializes or creates a matrix with a set of sized row-major values.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix:NewIdentity()</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix">Matrix</a></code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:InitIdentity()</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">

</ul>

Creates or initializes an identity matrix.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix:NewZero()</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix">Matrix</a></code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:InitZero()</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">

</ul>

Creates or initializes a matrix with all zero values.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:Get(<code><a href="Types#unumber">unumber</a> i, <a href="Types#unumber">unumber</a> j</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#number">number</a>?</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `i`: The column to look up.</li>
<li><span class="doc-arg-level doc-required">required</span>  `j`: The row to look up.</li>
</ul>

Gets a value of a cell specified by <code>(column, row)</code>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:GetComponents()</h4>
<p class="method-returns bold">Returns <code><a href="Types#tuple">tuple</a>&lt;N, ...&gt;</code></p>
<ul class="doc-arg-list">

</ul>

Returns the components of the <a href="Classes/Math.Matrix">Matrix</a> in row-major ordering.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:Set(<code><a href="Types#unumber">unumber</a> i, <a href="Types#unumber">unumber</a> j, <a href="Types#number">number</a>? value</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `i`: The column to look up.</li>
<li><span class="doc-arg-level doc-required">required</span>  `j`: The row to look up.</li>
<li><span class="doc-arg-level doc-required">required</span>  `value`: The value to set at the cell.</li>
</ul>

Sets a value of a cell specified by <code>(column, row)</code>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:ToLoose()</h4>
<p class="method-returns bold">Returns <code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Matrix">Matrix</a>&gt;</code></p>
<ul class="doc-arg-list">

</ul>

Returns the loose form of the <a href="Classes/Math.Matrix">Matrix</a>, decomposing into a tuple.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:GetRow(<code><a href="Types#unumber">unumber</a> row</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#tuple">tuple</a>&lt;COLUMNS, ...&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `row`: The row to get values for.</li>
</ul>

Returns an entire row's values from this <a href="Classes/Math.Matrix">Matrix</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:SetRow(<code><a href="Types#unumber">unumber</a> row, <a href="Types#tuple">tuple</a>&lt;COLUMNS, ...&gt; values</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `row`: The row to set values for</li>
<li><span class="doc-arg-level doc-required">required</span>  `values`: The values to set for this row.</li>
</ul>

Sets an entire row's values in the <a href="Classes/Math.Matrix">Matrix</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:GetColumn(<code><a href="Types#unumber">unumber</a> column</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#tuple">tuple</a>&lt;ROWS, ...&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `column`: The column to get values for.</li>
</ul>

Returns an entire column's values from this <a href="Classes/Math.Matrix">Matrix</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:SetColumn(<code><a href="Types#unumber">unumber</a> column, <a href="Types#tuple">tuple</a>&lt;ROWS, ...&gt; values</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `column`: The column to set values for</li>
<li><span class="doc-arg-level doc-required">required</span>  `values`: The values to set for this column.</li>
</ul>

Sets an entire column's values in the <a href="Classes/Math.Matrix">Matrix</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:MultiplyLooseMatrix(<code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Matrix">Matrix</a>&gt; other, [<a href="Classes/Math.Matrix">Matrix</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix">Matrix</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `other`: A <a href="Types#loose">loose</a> <a href="Classes/Math.Matrix">Matrix</a>, (rows, columns, ...)</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the resulting data.</li>
</ul>

Multiplies the <a href="Classes/Math.Matrix">Matrix</a> with a loose-representation matrix.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:MultiplyMatrix(<code><a href="Classes/Math.Matrix">Matrix</a> other, [<a href="Classes/Math.Matrix">Matrix</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix">Matrix</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `other`: The matrix to multiply with this one.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the data. A new matrix if not specified.</li>
</ul>

Multiplies this <a href="Classes/Math.Matrix">Matrix</a> with another <a href="Classes/Math.Matrix">Matrix</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:MultiplyMatrix!(<code><a href="Classes/Math.Matrix">Matrix</a> other</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:MultiplyMatrixInPlace(<code><a href="Classes/Math.Matrix">Matrix</a> other</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `other`: The matrix to multiply with.</li>
</ul>

Multiplies this matrix with another matrix, outputting into this matrix.

Only works with square matrices.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:MultiplyVector(<code><a href="Classes/Math.Vector">Vector</a> other, [<a href="Classes/Math.Vector">Vector</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Vector">Vector</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `other`: The vector to multiply with.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the resulting data.</li>
</ul>

Post-Multiplies the <a href="Classes/Math.Matrix">Matrix</a> with the given <a href="Classes/Math.Vector">Vector</a>.

<code><a href="Classes/Math.Matrix">Matrix</a> * <a href="Classes/Math.Vector">Vector</a></code>
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:MutiplyScalar(<code><a href="Types#number">number</a> value, [<a href="Classes/Math.Matrix">Matrix</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix">Matrix</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `value`: The scalar to scale the matrix with.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the resulting data.</li>
</ul>

Multiplies the <a href="Classes/Math.Matrix">Matrix</a> by a scalar value.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:PreMultiplyVector(<code><a href="Classes/Math.Vector">Vector</a> other, [<a href="Classes/Math.Vector">Vector</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Vector">Vector</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `other`: The <a href="Classes/Math.Vector">Vector</a> to multiply with.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the resulting data.</li>
</ul>

Pre-multiplies the <a href="Classes/Math.Matrix">Matrix</a> and the given <a href="Classes/Math.Vector">Vector</a>.

<code><a href="Classes/Math.Vector">Vector</a> * <a href="Classes/Math.Matrix">Matrix</a></code>
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:ToNative(<code>[<a href="Classes/FFI">FFI</a>&lt;float[N]&gt; out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/FFI">FFI</a>&lt;float[N]&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to place the resulting data.</li>
</ul>

Returns a native representation of the matrix using the LuaJIT FFI.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:Transpose()</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix">Matrix</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: An optional <a href="Classes/Math.Matrix">Matrix</a> to place the data into.</li>
</ul>

Transposes the <a href="Classes/Math.Matrix">Matrix</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:Transpose!()</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix">Matrix</a></code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:TransposeInPlace()</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix">Matrix</a></code></p>
<ul class="doc-arg-list">

</ul>

Transposes the matrix in-place.

<hr />
## Properties
[none]