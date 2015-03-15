# Exception
Signals detailed, strongly-typed error conditions.

Inherits [OOP.Object](Classes/OOP.Object)

## Methods
### Exception Exception:New(string message)
- message: The message to initialize the exception with.

Creates a new generic exception with the given message.


### void Exception:Throw(uint? level)
- level: An optional parameter passed onto Lua's error function.

Throws the exception as a traditional Lua error.


## Properties
[none]
