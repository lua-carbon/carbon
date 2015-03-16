<link href="style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Exceptions.CodeGenerationException</h1>
<span class="file-link">(in [./Carbon/Exceptions/CodeGenerationException.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Exceptions/CodeGenerationException.lua))</span><br/>
An exception to be generated when generation of code fails.

**Inherits [Exception](Classes/Exception)**

## Methods
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) CodeGenerationException:New(<code>string message, string code</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`message`: A message explaining why code generation failed.
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`code`: The code that was generated.

**Returns  [CodeGenerationException](Classes/Exceptions.CodeGenerationException)**

Denotes that code generation failed in a metaprogramming-enabled module.


## Properties
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) <code>string</code> Message
Contains a message about what went wrong generating code.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) <code>string</code> GeneratedCode
Contains the code that was generated and failed to meet the criteria.

