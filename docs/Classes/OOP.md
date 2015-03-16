<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">OOP</h1>
<span class="file-link">(in [./Carbon/OOP.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/OOP.lua))</span><br/>
Provides object orientation features for Carbon.

**Inherits [none]**

## Methods
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) OOP:RegisterAttribute(<code>[string](Types#string) type, [string](Types#string) name, function method</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`type`: The type of attribute (Class, PreInitialize, PostInitialize, or Copy).
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`name`: The name of the attribute as a class would call it.
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`method`: The class applicator. For function signatures, see below.

**Returns  void**

Registers a new custom class attribute.

- Class: `[void](Types#void) function(class)`

	Called immediately when the attribute is added to the class.


- PreInitialize: `[void](Types#void) function(class, instance)`

	Called after instance allocation but before the object's initializer is called.


- PostInitialize: `[void](Types#void) function(class, instance)`

	Called after the object is fully initialized.


- Copy: `[void](Types#void) function(original, copy)`

	Called after the copied object has been allocated and filled.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) OOP:SetAttributeInherited(<code>[string](Types#string) name, [bool](Types#bool) inherited</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`name`: The name of the attribute to define a value for.
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`inherited`: Whether inheriting a class will also inherit this attribute.

**Returns  void**

Marks an attribute as inherited or not inherited explicitly.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) OOP:Class(<code>[Class based_on]</code>)
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`based_on`: A class to make a direct copy of for the basis of this class.

**Returns  Class**

Creates a new, empty class.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) OOP:StaticClass()


**Returns  StaticClass**

Creates a static class, enabling it to inherit from other objects without having instantiation capability.


## Properties
[none]
