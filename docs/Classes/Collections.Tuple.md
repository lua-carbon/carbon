# Collections.Tuple
A disposable List object for quick vararg transformations.

**Inherits [OOP.Object](Classes/OOP.Object)**

## Methods
#### ![public][public] Tuple Tuple:New(...)
- ![optional][optional] ...: The values to initialize the Tuple with.

Creates a new Tuple.


#### ![public][public] ... Tuple:Unpack()


Unpacks and destroys the Tuple, returning all its values.


#### ![public][public] ... Tuple:Destroy(...)
- ![optional][optional] ...: Data to pipe through this method.

Destroys the tuple, passing any arguments that it was given as return values.
This will put the tuple back into the main buffer, usually.


## Properties
[none]


[public]: https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square
[optional]: https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square