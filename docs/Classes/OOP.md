<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">OOP</h1>
<span class="file-link">(in [./Carbon/OOP.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/OOP.lua))</span><br/>

Provides object orientation features for Carbon.

**Inherits [none]**

## Methods
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  OOP:Class(<code>[Class based_on]</code>)</h4>

- <img alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />&nbsp;&nbsp;`based_on`: A class to make a direct copy of for the basis of this class.

**Returns  Class**

Creates a new, empty class.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  OOP:StaticClass()</h4>



**Returns  StaticClass**

public StaticClass OOP:StaticClass()

Creates a static class, enabling it to inherit from other objects without having instantiation capability.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  OOP:RegisterAttribute(<code>[string](Types#string) type, [string](Types#string) name, function method</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`type`: The type of attribute (Class, PreInitialize, PostInitialize, or Copy).
- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`name`: The name of the attribute as a class would call it.
- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`method`: The class applicator. For function signatures, see below.

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

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  OOP:SetAttributeInherited(<code>[string](Types#string) name, [bool](Types#bool) inherited</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`name`: The name of the attribute to define a value for.
- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`inherited`: Whether inheriting a class will also inherit this attribute.

**Returns  void**

Marks an attribute as inherited or not inherited explicitly.


## Properties
[none]
