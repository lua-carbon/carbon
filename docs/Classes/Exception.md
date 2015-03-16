<h1 class="class-title">Exception</h1>
<span class="file-link">(in [./Carbon/Exception.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Exception.lua))</span><br/>
Signals detailed, strongly-typed error conditions.

**Inherits [OOP.Object](Classes/OOP.Object)**

## Methods
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Exception:New(<code>string message</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`message`: The message to initialize the exception with.

**Returns  Exception**

Creates a new generic exception with the given message.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Exception:Throw(<code>[uint level]</code>)
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`level`: An optional parameter passed onto Lua's error function.

**Returns  void**

Throws the exception as a traditional Lua error.


## Properties
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) <code>string</code> Exception.Message
An error message explaining the exception.

