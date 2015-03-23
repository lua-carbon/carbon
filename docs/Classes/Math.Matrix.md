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

**Inherits [none]**

## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Matrix:New(<code>...</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Math.Matrix">Matrix</a></code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix:Init(<code>...</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#void">void</a></code></span>**

- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `...`: The values to initialize the matrix with. Each value is nil by default.

Initializes or creates a matrix with a set of row-major values.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Matrix:NewFromLoose(<code><a href="Types#unumber">unumber</a> rows, <a href="Types#unumber">unumber</a> columns, ...</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Math.Matrix">Matrix</a></code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix:InitFromLoose(<code><a href="Types#unumber">unumber</a> rows, <a href="Types#unumber">unumber</a> columns, ...</code>)</h4>
**<span class="method-returns">Returns <code>self</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `rows`: The number of rows the loose data has.
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `columns`: The number of columns the loose data has.
- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `...`: The data to initialize or create the matrix with.

Initializes or creates a matrix with a set of sized row-major values.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Matrix:NewIdentity()</h4>
**<span class="method-returns">Returns <code><a href="Classes/Math.Matrix">Matrix</a></code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix:InitIdentity()</h4>
**<span class="method-returns">Returns <code><a href="Types#void">void</a></code></span>**



Creates or initializes an identity matrix.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Matrix:NewZero()</h4>
**<span class="method-returns">Returns <code><a href="Classes/Math.Matrix">Matrix</a></code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix:InitZero()</h4>
**<span class="method-returns">Returns <code><a href="Types#void">void</a></code></span>**



Creates or initializes a matrix with all zero values.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix:Get(<code><a href="Types#unumber">unumber</a> i, <a href="Types#unumber">unumber</a> j</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#number">number</a>?</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `i`: The column to look up.
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `j`: The row to look up.

Gets a value of a cell specified by `(column, row)`.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix:GetComponents()</h4>
**<span class="method-returns">Returns <code><a href="Types#tuple">tuple</a>&lt;N, ...&gt;</code></span>**



Returns the components of the <a href="Classes/Math.Matrix">Matrix</a> in row-major ordering.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix:Set(<code><a href="Types#unumber">unumber</a> i, <a href="Types#unumber">unumber</a> j, <a href="Types#number">number</a>? value</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#void">void</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `i`: The column to look up.
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `j`: The row to look up.
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `value`: The value to set at the cell.

Sets a value of a cell specified by `(column, row)`.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix:ToLoose()</h4>
**<span class="method-returns">Returns <code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Matrix">Matrix</a>&gt;</code></span>**



Returns the loose form of the <a href="Classes/Math.Matrix">Matrix</a>, decomposing into a tuple.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix:GetRow(<code><a href="Types#unumber">unumber</a> row</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#tuple">tuple</a>&lt;COLUMNS, ...&gt;</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `row`: The row to get values for.

Returns an entire row's values from this <a href="Classes/Math.Matrix">Matrix</a>.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix:SetRow(<code><a href="Types#unumber">unumber</a> row, <a href="Types#tuple">tuple</a>&lt;COLUMNS, ...&gt; values</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#void">void</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `row`: The row to set values for
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `values`: The values to set for this row.

Sets an entire row's values in the <a href="Classes/Math.Matrix">Matrix</a>.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix:GetColumn(<code><a href="Types#unumber">unumber</a> column</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#tuple">tuple</a>&lt;ROWS, ...&gt;</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `column`: The column to get values for.

Returns an entire column's values from this <a href="Classes/Math.Matrix">Matrix</a>.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix:SetColumn(<code><a href="Types#unumber">unumber</a> column, <a href="Types#tuple">tuple</a>&lt;ROWS, ...&gt; values</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#void">void</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `column`: The column to set values for
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `values`: The values to set for this column.

Sets an entire column's values in the <a href="Classes/Math.Matrix">Matrix</a>.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix:MultiplyLooseMatrix(<code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Matrix">Matrix</a>&gt; other, [<a href="Classes/Math.Matrix">Matrix</a> out]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Math.Matrix">Matrix</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `other`: A <a href="Types#loose">loose</a> <a href="Classes/Math.Matrix">Matrix</a>, (rows, columns, ...)
- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `out`: Where to put the resulting data.

Multiplies the <a href="Classes/Math.Matrix">Matrix</a> with a loose-representation matrix.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix:MultiplyMatrix(<code><a href="Classes/Math.Matrix">Matrix</a> other, [<a href="Classes/Math.Matrix">Matrix</a> out]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Math.Matrix">Matrix</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `other`: The matrix to multiply with this one.
- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `out`: Where to put the data. A new matrix if not specified.

Multiplies this <a href="Classes/Math.Matrix">Matrix</a> with another <a href="Classes/Math.Matrix">Matrix</a>.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix:MultiplyMatrix!(<code><a href="Classes/Math.Matrix">Matrix</a> other</code>)</h4>
**<span class="method-returns">Returns <code>self</code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix:MultiplyMatrixInPlace(<code><a href="Classes/Math.Matrix">Matrix</a> other</code>)</h4>
**<span class="method-returns">Returns <code>self</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `other`: The matrix to multiply with.

Multiplies this matrix with another matrix, outputting into this matrix.

Only works with square matrices.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix:MultiplyVector(<code><a href="Classes/Math.Vector">Vector</a> other, [<a href="Classes/Math.Vector">Vector</a> out]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Math.Vector">Vector</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `other`: The vector to multiply with.
- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `out`: Where to put the resulting data.

Post-Multiplies the <a href="Classes/Math.Matrix">Matrix</a> with the given <a href="Classes/Math.Vector">Vector</a>.

`<a href="Classes/Math.Matrix">Matrix</a> * <a href="Classes/Math.Vector">Vector</a>`

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix:MutiplyScalar(<code><a href="Types#number">number</a> value, [<a href="Classes/Math.Matrix">Matrix</a> out]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Math.Matrix">Matrix</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `value`: The scalar to scale the matrix with.
- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `out`: Where to put the resulting data.

Multiplies the <a href="Classes/Math.Matrix">Matrix</a> by a scalar value.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix:PreMultiplyVector(<code><a href="Classes/Math.Vector">Vector</a> other, [<a href="Classes/Math.Vector">Vector</a> out]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Math.Vector">Vector</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `other`: The <a href="Classes/Math.Vector">Vector</a> to multiply with.
- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `out`: Where to put the resulting data.

Pre-multiplies the <a href="Classes/Math.Matrix">Matrix</a> and the given <a href="Classes/Math.Vector">Vector</a>.

`<a href="Classes/Math.Vector">Vector</a> * <a href="Classes/Math.Matrix">Matrix</a>`

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix:ToNative(<code>[<a href="Classes/FFI">FFI</a>&lt;float[N]&gt; out]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/FFI">FFI</a>&lt;float[N]&gt;</code></span>**

- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `out`: Where to place the resulting data.

Returns a native representation of the matrix using the LuaJIT FFI.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix:Transpose()</h4>
**<span class="method-returns">Returns <code><a href="Classes/Math.Matrix">Matrix</a></code></span>**

- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `out`: An optional <a href="Classes/Math.Matrix">Matrix</a> to place the data into.

Transposes the <a href="Classes/Math.Matrix">Matrix</a>.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix:Transpose!()</h4>
**<span class="method-returns">Returns <code><a href="Classes/Math.Matrix">Matrix</a></code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix:TransposeInPlace()</h4>
**<span class="method-returns">Returns <code><a href="Classes/Math.Matrix">Matrix</a></code></span>**



Transposes the matrix in-place.


## Properties
[none]
