<h1 class="class-title">Math.Matrix</h1>
<span class="file-link">(in [./Carbon/Math/Matrix.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Math/Matrix.lua))</span><br/>

Generates `N`x`M` matrices.

Matrices native to Carbon are row-major!

This does not scale very well, but is fast for small values of `N` and `M`.
Works only for matrices smaller than 14x14.
For larger matrices, consider a different implementation.

The 'loose' form of a Matrix, <code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Matrix">Matrix</a>&gt;</code> is of the form <code>(N, M, ...)</code> where `N` and `M`
are the dimensions of the matrix and <code>...</code> represents the values within it.

Methods listed here operating on a <code><a href="Classes/Math.Matrix">Matrix</a>&lt;N, M&gt;</code> work only on generated classes, while those
listed as operating on <code><a href="Classes/Math.Matrix">Matrix</a></code> operate only on the generator class.


<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix:Generate(<code>uint rows, uint columns</code>)</h4>
<p class="method-returns bold">Returns <code>Class&lt;<a href="Classes/Math.Matrix">Matrix</a>&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `rows`: The number of rows in the matrix</li>
<li><span class="doc-arg-level doc-required">required</span>  `columns`: The number of columns in the matrix</li>
</ul>

Generates a new Matrix class with the given size. Results are cached, but this method may still be slow.
It performs runtime code generation and template parsing on each generated class.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:New(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix">Matrix</a>&lt;N,M&gt;</code></p><h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:PlacementNew(<code><a href="Classes/Math.Matrix">Matrix</a>&lt;N,M&gt;? out, ...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix">Matrix</a>&lt;N,M&gt;</code></p>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:Init(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `...`: The values to initialize the matrix with. Each value is nil by default.</li>
</ul>

Initializes or creates a matrix with a set of row-major values.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:NewFromLoose(<code><a href="Types#unumber">unumber</a> rows, <a href="Types#unumber">unumber</a> columns, ...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix">Matrix</a>&lt;N,M&gt;</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:InitFromLoose(<code><a href="Types#unumber">unumber</a> rows, <a href="Types#unumber">unumber</a> columns, ...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `rows`: The number of rows the loose data has.</li>
<li><span class="doc-arg-level doc-required">required</span>  `columns`: The number of columns the loose data has.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `...`: The data to initialize or create the matrix with.</li>
</ul>

Initializes or creates a matrix with a set of sized row-major values.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:NewIdentity()</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix">Matrix</a>&lt;N,M&gt;</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:InitIdentity()</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">

</ul>

Creates or initializes an identity matrix.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:NewZero()</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix">Matrix</a>&lt;N,M&gt;</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:InitZero()</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">

</ul>

Creates or initializes a matrix with all zero values.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:Get(<code><a href="Types#unumber">unumber</a> i, <a href="Types#unumber">unumber</a> j</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#number">number</a>?</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `i`: The column to look up.</li>
<li><span class="doc-arg-level doc-required">required</span>  `j`: The row to look up.</li>
</ul>

Gets a value of a cell specified by <code>(column, row)</code>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:GetComponents()</h4>
<p class="method-returns bold">Returns <code><a href="Types#tuple">tuple</a>&lt;N*M, ...&gt;</code></p>
<ul class="doc-arg-list">

</ul>

Returns the components of the <a href="Classes/Math.Matrix">Matrix</a> in row-major ordering.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:Set(<code><a href="Types#unumber">unumber</a> i, <a href="Types#unumber">unumber</a> j, <a href="Types#number">number</a>? value</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `i`: The column to look up.</li>
<li><span class="doc-arg-level doc-required">required</span>  `j`: The row to look up.</li>
<li><span class="doc-arg-level doc-required">required</span>  `value`: The value to set at the cell.</li>
</ul>

Sets a value of a cell specified by <code>(column, row)</code>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:ToLoose()</h4>
<p class="method-returns bold">Returns <code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Matrix">Matrix</a>&lt;N,M&gt;&gt;</code></p>
<ul class="doc-arg-list">

</ul>

Returns the loose form of the <a href="Classes/Math.Matrix">Matrix</a>, decomposing into a tuple.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:GetRow(<code><a href="Types#unumber">unumber</a> row</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#tuple">tuple</a>&lt;N, ...&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `row`: The row to get values for.</li>
</ul>

Returns an entire row's values from this <a href="Classes/Math.Matrix">Matrix</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:SetRow(<code><a href="Types#unumber">unumber</a> row, <a href="Types#tuple">tuple</a>&lt;N, ...&gt; values</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `row`: The row to set values for</li>
<li><span class="doc-arg-level doc-required">required</span>  `values`: The values to set for this row.</li>
</ul>

Sets an entire row's values in the <a href="Classes/Math.Matrix">Matrix</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:SetColumn&lt;N,M&gt;(<code><a href="Types#unumber">unumber</a> column, <a href="Types#tuple">tuple</a>&lt;M, ...&gt; values</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `column`: The column to set values for</li>
<li><span class="doc-arg-level doc-required">required</span>  `values`: The values to set for this column.</li>
</ul>

Sets an entire column's values in the <a href="Classes/Math.Matrix">Matrix</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:GetColumn(<code><a href="Types#unumber">unumber</a> column</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#tuple">tuple</a>&lt;M, ...&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `column`: The column to get values for.</li>
</ul>

Returns an entire column's values from this <a href="Classes/Math.Matrix">Matrix</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:NewLooseIdentity()</h4>
<p class="method-returns bold">Returns <code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Matrix">Matrix</a>&lt;N,M&gt;&gt;</code></p>
<ul class="doc-arg-list">

</ul>

Returns an identity <a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Matrix">Matrix</a>&lt;N,M&gt;&gt;.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:NewLooseZero()</h4>
<p class="method-returns bold">Returns <code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Matrix">Matrix</a>&lt;N,M&gt;&gt;</code></p>
<ul class="doc-arg-list">

</ul>

Returns a <a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Matrix">Matrix</a>&lt;N,M&gt;&gt; full of zeroes.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:MultiplyLooseMatrix&lt;N,M&gt;(<code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Matrix">Matrix</a>&gt; other, [<a href="Classes/Math.Matrix">Matrix</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix">Matrix</a>&lt;N,M&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `other`: A <a href="Types#loose">loose</a> <a href="Classes/Math.Matrix">Matrix</a>, (rows, columns, ...)</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the resulting data.</li>
</ul>

Multiplies the <a href="Classes/Math.Matrix">Matrix</a> with a loose-representation matrix.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:GetNative()</h4>
<p class="method-returns bold">Returns <code><a href="Classes/FFI">FFI</a>&lt;float[N*M]&gt;</code></p>
<ul class="doc-arg-list">

</ul>

Returns this matrix's native representation. Uses the same object for every call.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:LooseMultiplyLooseVector(<code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Vector">Vector</a>&lt;N&gt;&gt;&gt; vector</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Vector">Vector</a>&lt;N&gt;&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `vector`: The loose vector to multiply with.</li>
</ul>

Multiplies the matrix with a row vector and returns the result in loose form.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:MultiplyLooseVector(<code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Vector">Vector</a>&lt;N&gt;&gt;&gt; vector</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Vector">Vector</a>&lt;N&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `vector`: The loose vector to multiply with.</li>
</ul>

Multiplies the matrix with a row vector and returns the result in a <a href="Classes/Math.Vector">Vector</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:MultiplyMatrix(<code><a href="Classes/Math.Matrix">Matrix</a> other, [<a href="Classes/Math.Matrix">Matrix</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix">Matrix</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `other`: The matrix to multiply with this one.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the data. A new matrix if not specified.</li>
</ul>

Multiplies this <a href="Classes/Math.Matrix">Matrix</a> with another <a href="Classes/Math.Matrix">Matrix</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:MultiplyMatrix!(<code><a href="Classes/Math.Matrix">Matrix</a> other</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix:MultiplyMatrixInPlace(<code><a href="Classes/Math.Matrix">Matrix</a> other</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `other`: The matrix to multiply with.</li>
</ul>

Multiplies this matrix with another matrix, outputting into this matrix.

Only works with square matrices.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:MultiplyScalar!(<code><a href="Types#number">number</a> value</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:MultiplyScalarInPlace(<code><a href="Types#number">number</a> value</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `value`: The scalar to scale the matrix with.</li>
</ul>

Multiplies the <a href="Classes/Math.Matrix">Matrix</a> by a scalar value in place.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:MultiplyVector(<code><a href="Classes/Math.Vector">Vector</a>&lt;N&gt; other, [<a href="Classes/Math.Vector">Vector</a>&lt;N&gt; out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Vector">Vector</a>&lt;N&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `other`: The vector to multiply with.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the resulting data.</li>
</ul>

Post-Multiplies the <a href="Classes/Math.Matrix">Matrix</a> with the given <a href="Classes/Math.Vector">Vector</a>.

<code><a href="Classes/Math.Matrix">Matrix</a> * <a href="Classes/Math.Vector">Vector</a></code>
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:MutiplyScalar(<code><a href="Types#number">number</a> value, [<a href="Classes/Math.Matrix">Matrix</a> out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix">Matrix</a>&lt;N,M&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `value`: The scalar to scale the matrix with.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the resulting data.</li>
</ul>

Multiplies the <a href="Classes/Math.Matrix">Matrix</a> by a scalar value.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:PreMultiplyVector(<code><a href="Classes/Math.Vector">Vector</a>&lt;M&gt; other, [<a href="Classes/Math.Vector">Vector</a>&lt;M&gt; out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Vector">Vector</a>&lt;M&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `other`: The <a href="Classes/Math.Vector">Vector</a> to multiply with.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to put the resulting data.</li>
</ul>

Pre-multiplies the <a href="Classes/Math.Matrix">Matrix</a> and the given <a href="Classes/Math.Vector">Vector</a>.

<code><a href="Classes/Math.Vector">Vector</a> * <a href="Classes/Math.Matrix">Matrix</a></code>
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:ToNative(<code>[<a href="Classes/FFI">FFI</a>&lt;float[N]&gt; out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/FFI">FFI</a>&lt;float[N*M]&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: Where to place the resulting data.</li>
</ul>

Returns a native representation of the matrix using the LuaJIT FFI.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:Transpose(<code>[<a href="Classes/Math.Matrix">Matrix</a>&lt;N,M&gt; out]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Math.Matrix">Matrix</a>&lt;N,M&gt;</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `out`: An optional <a href="Classes/Math.Matrix">Matrix</a> to place the data into.</li>
</ul>

Transposes the <a href="Classes/Math.Matrix">Matrix</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:Transpose!()</h4>
<p class="method-returns bold">Returns <code>self</code></p><h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Matrix&lt;N,M&gt;:TransposeInPlace()</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">

</ul>

Transposes the matrix in-place.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-private">private</span> Matrix:__generate_method(<code>string body, table arguments</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#function">function</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `body`: Template-enabled code to return a function.</li>
<li><span class="doc-arg-level doc-required">required</span>  `arguments`: Arguments to the template</li>
</ul>

Generates a method using Carbon's TemplateEngine and handles errors.

<hr />
## Properties
[none]