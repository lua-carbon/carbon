<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Math.Quaternion</h1>
<span class="file-link">(in [./Carbon/Math/Quaternion.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Math/Quaternion.lua))</span><br/>

Provides a quaternion object for representing rotations.

The loose form of a <a href="Classes/Math.Quaternion">Quaternion</a>, <code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Quaternion">Quaternion</a>&gt;</code> is of the form <code>(x, y, z, w)</code>

**Inherits <a href="Classes/Math.Vector">Math.Vector</a><4>**

## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Quaternion:NewFromAngles(<code><a href="Classes/Math.Vector3">Vector3</a> angles</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Math.Quaternion">Quaternion</a></code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Quaternion:InitFromAngles(<code><a href="Classes/Math.Vector3">Vector3</a> angles</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Math.Quaternion">Quaternion</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `angles`: A <a href="Classes/Math.Vector3">Vector3</a> containing the angles to convert.

Converts a <a href="Classes/Math.Vector3">Vector3</a> containing Euler angles into a <a href="Classes/Math.Quaternion">Quaternion</a>.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Quaternion:NewFromLooseAngles(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Math.Quaternion">Quaternion</a></code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Quaternion:InitFromLooseAngles(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z</code>)</h4>
**<span class="method-returns">Returns <code>self</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `x`: The x component of the angles.
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `y`: The y component of the angles.
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `z`: The z component of the angles.

Converts a <a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Vector3">Vector3</a>&gt; containing Euler angles into a <a href="Classes/Math.Quaternion">Quaternion</a>.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Quaternion:NewLooseFromAngles(<code><a href="Classes/Math.Vector3">Vector3</a> angles</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Quaternion">Quaternion</a>&gt;</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `angles`: A <a href="Classes/Math.Vector3">Vector3</a> containing the angles to convert.

Converts a <a href="Classes/Math.Vector3">Vector3</a> containing Euler angles into a loose <a href="Classes/Math.Quaternion">Quaternion</a>.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Quaternion:NewLooseFromLooseAngles(<code><a href="Types#number">number</a> x, <a href="Types#number">number</a> y, <a href="Types#number">number</a> z</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Quaternion">Quaternion</a>&gt;</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `x`: The x component of the angles.
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `y`: The y component of the angles.
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `z`: The z component of the angles.

Converts a <a href="Types#loose">loose</a>&lt;<a href="Classes/Math.Vector3">Vector3</a>&gt; containing Euler angles into a loose <a href="Classes/Math.Quaternion">Quaternion</a>.


## Properties
[none]
