<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Math.FastMatrix</h1>
<span class="file-link">(in [./Carbon/Math/FastMatrix.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Math/FastMatrix.lua))</span><br/>

Generates `N`x`M` matrices.

Matrices native to Carbon are Row-Major!

This does not scale very well, but is fast for small values of `N` and `M`.
Works only for matrices smaller than 14x14.
For larger matrices, consider a different implementation.

The 'loose' form of a FastMatrix is a tuple of the following form `(N, M, ...)` where `N` and `M`
are the dimensions of the matrix and `...` are the values within it.

**Inherits [none]**

## Methods
[none]

## Properties
[none]
