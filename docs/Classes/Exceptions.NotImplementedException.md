<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Exceptions.NotImplementedException</h1>
<span class="file-link">(in [./Carbon/Exceptions/NotImplementedException.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Exceptions/NotImplementedException.lua))</span><br/>

An exception to be generated when a feature is not (yet) implemented.

**Inherits [Exception](Classes/Exception)**

## Methods
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) NotImplementedException:New(<code>string method_name</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`method_name`: The name of the method that isn't yet implemented.

**Returns  [NotImplementedException](Classes/Exceptions.NotImplementedException)**

Generates a new [NotImplementedException](Classes/Exceptions.NotImplementedException) for a method with the given name.


## Properties
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) <code>string</code> MethodName
The name of the method that isn't implemented.

