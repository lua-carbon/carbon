<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">OOP.BaseClass</h1>
<span class="file-link">(in [./Carbon/OOP.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/OOP.lua))</span><br/>

Body for both <a href="Classes/OOP.Class">OOP.Class</a> and <a href="Classes/OOP.StaticClass">OOP.StaticClass</a> base classes.

**Inherits [none]**

## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  BaseClass:Attributes(<code><a href="Types#dictionary">dictionary</a> attributes</code>)</h4>
**<span class="method-returns">Returns <code>self</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `attributes`: The attributes to give to the object.

Adds attributes to the class. Overwrites existing attributes.
The attributes parameter is only shallow copied, keep this in mind.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  BaseClass:Inherits(<code>...</code>)</h4>
**<span class="method-returns">Returns <code>self</code></span>**



Inherits from classes, taking on their inheritable attributes, members, metatables, and type information.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  BaseClass:Members(<code><a href="Types#dictionary">dictionary</a> members</code>)</h4>
**<span class="method-returns">Returns <code>self</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `members`: The member to give to instances of this class.

Adds members to the class. Overwrites existing member entries.
The members parameter is only shallow copied, keep this in mind.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  BaseClass:Metatable(<code><a href="Types#dictionary">dictionary</a> metatable</code>)</h4>
**<span class="method-returns">Returns <code>self</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `metatable`: The metatable to give to instances of this class.

Adds metatables to the class. Overwrites existing metatable entries.
The metatable parameter is only shallow copied, keep this in mind.


## Properties
#### <img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" /> <code>set</code> Is
The typecheck object for this class.

<hr/>
#### <img class="doc-image" alt="private" src="https://img.shields.io/badge/ -private-d30500.svg?style=flat-square" /> <code>dictionary</code> __attributes
Holds class attributes.

<hr/>
#### <img class="doc-image" alt="private" src="https://img.shields.io/badge/ -private-d30500.svg?style=flat-square" /> <code>dictionary</code> __base_members
Holds base class members so they can be overridden effectively.

<hr/>
#### <img class="doc-image" alt="private" src="https://img.shields.io/badge/ -private-d30500.svg?style=flat-square" /> <code>dictionary</code> __members
Holds user-defined class members.

<hr/>
#### <img class="doc-image" alt="private" src="https://img.shields.io/badge/ -private-d30500.svg?style=flat-square" /> <code>dictionary</code> __metatable
Holds metatable to be applied to instances.

