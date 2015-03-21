<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Math.Quaternion</h1>
<span class="file-link">(in [./Carbon/Math/Quaternion.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Math/Quaternion.lua))</span><br/>

Provides a quaternion object for representing rotations.

The loose form of a [Quaternion](Classes/Math.Quaternion), <code>[loose](Types#loose)&lt;[Quaternion](Classes/Math.Quaternion)&gt;</code> is of the form <code>(x, y, z, w)</code>

**Inherits [Math.Vector](Classes/Math.Vector)<4>**

## Methods
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Quaternion:NewFromAngles(<code>[Vector3](Classes/Math.Vector3) angles</code>)</h4>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Quaternion:InitFromAngles(<code>[Vector3](Classes/Math.Vector3) angles</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`angles`: A [Vector3](Classes/Math.Vector3) containing the angles to convert.

**Returns  [Quaternion](Classes/Math.Quaternion)**

Converts a [Vector3](Classes/Math.Vector3) containing Euler angles into a [Quaternion](Classes/Math.Quaternion).

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Quaternion:NewFromLooseAngles(<code>[number](Types#number) x, [number](Types#number) y, [number](Types#number) z</code>)</h4>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Quaternion:InitFromLooseAngles(<code>[number](Types#number) x, [number](Types#number) y, [number](Types#number) z</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`x`: The x component of the angles.
- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`y`: The y component of the angles.
- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`z`: The z component of the angles.

**Returns  [Quaternion](Classes/Math.Quaternion)**

Converts a [loose](Types#loose)&lt;[Vector3](Classes/Math.Vector3)&gt; containing Euler angles into a [Quaternion](Classes/Math.Quaternion).

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Quaternion:NewLooseFromAngles(<code>[Vector3](Classes/Math.Vector3) angles</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`angles`: A [Vector3](Classes/Math.Vector3) containing the angles to convert.

**Returns  [loose](Types#loose)&lt;[Quaternion](Classes/Math.Quaternion)&gt;**

Converts a [Vector3](Classes/Math.Vector3) containing Euler angles into a loose [Quaternion](Classes/Math.Quaternion).

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Quaternion:NewLooseFromLooseAngles(<code>[number](Types#number) x, [number](Types#number) y, [number](Types#number) z</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`x`: The x component of the angles.
- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`y`: The y component of the angles.
- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`z`: The z component of the angles.

**Returns  [loose](Types#loose)&lt;[Quaternion](Classes/Math.Quaternion)&gt;**

Converts a [loose](Types#loose)&lt;[Vector3](Classes/Math.Vector3)&gt; containing Euler angles into a loose [Quaternion](Classes/Math.Quaternion).


## Properties
[none]
