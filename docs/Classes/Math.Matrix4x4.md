<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Math.Matrix4x4</h1>
<span class="file-link">(in [./Carbon/Math/Matrix4x4.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Math/Matrix4x4.lua))</span><br/>

A 4x4 row-major matrix.

**Inherits <a href="Classes/Math.Matrix3x3">Math.Matrix3x3</a>, <a href="Classes/Math.Matrix">Math.Matrix</a>**

## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Matrix4x4:Rotation(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z, [<a href="Classes/Math.Matrix4x4">Matrix4x4</a> out]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Math.Matrix4x4">Matrix4x4</a></code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix4x4:Rotate(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z, [<a href="Classes/Math.Matrix4x4">Matrix4x4</a> out]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Math.Matrix4x4">Matrix4x4</a></code></span>**

<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix4x4:Rotate!(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z</code>)</h4>
**<span class="method-returns">Returns <code>self</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `x`: The x component of the rotation.
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `y`: The y component of the rotation.
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `z`: The z component of the rotation.
- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `out`: Where to put the data for the rotation.

Creates a rotation matrix with the given Euler angles.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Matrix4x4:Translation(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z, [<a href="Classes/Math.Matrix4x4">Matrix4x4</a> out]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Math.Matrix4x4">Matrix4x4</a></code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Matrix4x4:Translate(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z, [<a href="Classes/Math.Matrix4x4">Matrix4x4</a> out]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Math.Matrix4x4">Matrix4x4</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `x`: The x coordinate of the translation.
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `y`: The y coordinate of the translation.
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `z`: The z coordinate of the translation.
- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `out`: Where to put the data for the translation.

Creates a translation matrix.
The `Translate` form offsets from an existing matrix.


## Properties
[none]
