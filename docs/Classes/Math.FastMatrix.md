<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Math.FastMatrix</h1>
<span class="file-link">(in [./Carbon/Math/FastMatrix.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Math/FastMatrix.lua))</span><br/>

Generates `N`x`M` matrices.

Matrices native to Carbon are Row-Major!

This does not scale very well, but is fast for small values of `N` and `M`.
Works only for matrices smaller than 14x14.
For larger matrices, consider a different implementation.

The 'loose' form of a FastMatrix, <code>[loose](Types#loose)&lt;[FastMatrix](Classes/Math.FastMatrix)&gt;</code> is of the form <code>(N, M, ...)</code> where `N` and `M`
are the dimensions of the matrix and <code>...</code> represents the values within it.

**Inherits [none]**

## Methods
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> FastMatrix:New(<code>...</code>)</h4>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> FastMatrix:Init(<code>...</code>)</h4>

- <img alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />&nbsp;&nbsp;`...`: The values to initialize the matrix with. Each value is 0 by default.

**Returns  [FastMatrix](Classes/Math.FastMatrix)**

Initializes or creates a matrix with a set of row-major values.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> FastMatrix:NewFromLoose(<code>[unumber](Types#unumber) rows, [unumber](Types#unumber) columns, ...</code>)</h4>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> FastMatrix:InitFromLoose(<code>[unumber](Types#unumber) rows, [unumber](Types#unumber) columns, ...</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`rows`: The number of rows the loose data has.
- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`columns`: The number of columns the loose data has.
- <img alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />&nbsp;&nbsp;`...`: The data to initialize or create the matrix with.

**Returns  [FastMatrix](Classes/Math.FastMatrix)**

Initializes or creates a matrix with a set of sized row-major values.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> FastMatrix:ToLoose()</h4>



**Returns  [loose](Types#loose)&lt;[FastMatrix](Classes/Math.FastMatrix)&gt;**

object public [loose](Types#loose)&lt;[FastMatrix](Classes/Math.FastMatrix)&gt; FastMatrix:ToLoose()

Returns the loose form of the [FastMatrix](Classes/Math.FastMatrix), decomposing into a tuple.


## Properties
[none]
