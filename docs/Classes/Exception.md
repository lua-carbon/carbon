# Exception
Signals detailed, strongly-typed error conditions.

**Inherits [OOP.Object](Classes/OOP.Object)**

## Methods
#### ![public][public] Exception Exception:New(string message)
- ![required][required] message: The message to initialize the exception with.

Creates a new generic exception with the given message.


#### ![public][public] void Exception:Throw([uint level])
- ![optional][optional] level: An optional parameter passed onto Lua's error function.

Throws the exception as a traditional Lua error.


## Properties
#### ![public][public] string Exception.Message
An error message explaining the exception.



[required]: https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square
[public]: https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square
[optional]: https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square