<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Exceptions.NotImplementedException</h1>
<span class="file-link">(in [./Carbon/Exceptions/NotImplementedException.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Exceptions/NotImplementedException.lua))</span><br/>

An exception to be generated when a feature is not (yet) implemented.

**Inherits <a href="Classes/Exception">Exception</a>**

## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  NotImplementedException:New(<code>string method_name</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Exceptions.NotImplementedException">NotImplementedException</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `method_name`: The name of the method that isn't yet implemented.

Generates a new <a href="Classes/Exceptions.NotImplementedException">NotImplementedException</a> for a method with the given name.


## Properties
#### <img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" /> <code>string</code> MethodName
The name of the method that isn't implemented.

