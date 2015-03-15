# OOP.BaseClass
Body for both [OOP.Class](Classes/OOP.Class) and [OOP.StaticClass](Classes/OOP.StaticClass) base classes.

**Inherits [none]**

## Methods
#### ![public][public] self BaseClass:Inherits(...)


Inherits from classes, taking on their inheritable attributes, members, metatables, and type information.


#### ![public][public] self BaseClass:Attributes(table attributes)
- ![required][required] attributes: The attributes to give to the object.

Adds attributes to the class. Overwrites existing attributes.
The attributes parameter is only shallow copied, keep this in mind.


#### ![public][public] self BaseClass:Metatable(table metatable)
- ![required][required] metatable: The metatable to give to instances of this class.

Adds metatables to the class. Overwrites existing metatable entries.
The metatable parameter is only shallow copied, keep this in mind.


#### ![public][public] self BaseClass:Metatable(table member)
- ![required][required]: The member to give to instances of this class.

Adds members to the class. Overwrites existing member entries.
The members parameter is only shallow copied, keep this in mind.


## Properties
#### ![public][public] Is
The typecheck object for this class.


#### ![private][private] __members
Holds user-defined class members.


#### ![private][private] __base_members
Holds base class members so they can be overridden effectively.


#### ![private][private] __metatable
Holds metatable to be applied to instances.


#### ![private][private] __attributes
Holds class attributes.



[private]: https://img.shields.io/badge/%20-private-d30500.svg?style=flat-square
[required]: https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square
[public]: https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square