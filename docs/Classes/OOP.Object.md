<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">OOP.Object</h1>
<span class="file-link">(in [./Carbon/OOP.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/OOP.lua))</span><br/>
The base object for all instancable classes.

**Inherits [OOP.BaseClass](Classes/OOP.BaseClass)**

## Methods
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Class:PlacementNew(<code>[indexable](Types#indexable)? target, ...</code>)
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`target`: Where to place the instance, will be provided if not given.
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`...`: Arguments to pass to the constructor

**Returns  Object**

Creates a new object and puts it into a given indexable object.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Class:New(<code>...</code>)


**Returns  Object**

Creates a new object and passes parameters to its initializer.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Object:Copy()


**Returns  Object**

Copies the given object.


## Properties
[none]
