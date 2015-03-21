<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">OOP.BaseClass</h1>
<span class="file-link">(in [./Carbon/OOP.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/OOP.lua))</span><br/>

Body for both [OOP.Class](Classes/OOP.Class) and [OOP.StaticClass](Classes/OOP.StaticClass) base classes.

**Inherits [none]**

## Methods
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  BaseClass:Attributes(<code>[dictionary](Types#dictionary) attributes</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`attributes`: The attributes to give to the object.

**Returns  self**

Adds attributes to the class. Overwrites existing attributes.
The attributes parameter is only shallow copied, keep this in mind.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  BaseClass:Inherits(<code>...</code>)</h4>



**Returns  self**

public self BaseClass:Inherits(...)

Inherits from classes, taking on their inheritable attributes, members, metatables, and type information.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  BaseClass:Members(<code>[dictionary](Types#dictionary) members</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`members`: The member to give to instances of this class.

**Returns  self**

Adds members to the class. Overwrites existing member entries.
The members parameter is only shallow copied, keep this in mind.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  BaseClass:Metatable(<code>[dictionary](Types#dictionary) metatable</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`metatable`: The metatable to give to instances of this class.

**Returns  self**

Adds metatables to the class. Overwrites existing metatable entries.
The metatable parameter is only shallow copied, keep this in mind.


## Properties
#### <img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" /> <code>set</code> Is
The typecheck object for this class.

<hr/>
#### <img alt="private" src="https://img.shields.io/badge/ -private-d30500.svg?style=flat-square" /> <code>dictionary</code> __attributes
Holds class attributes.

<hr/>
#### <img alt="private" src="https://img.shields.io/badge/ -private-d30500.svg?style=flat-square" /> <code>dictionary</code> __base_members
Holds base class members so they can be overridden effectively.

<hr/>
#### <img alt="private" src="https://img.shields.io/badge/ -private-d30500.svg?style=flat-square" /> <code>dictionary</code> __members
Holds user-defined class members.

<hr/>
#### <img alt="private" src="https://img.shields.io/badge/ -private-d30500.svg?style=flat-square" /> <code>dictionary</code> __metatable
Holds metatable to be applied to instances.

