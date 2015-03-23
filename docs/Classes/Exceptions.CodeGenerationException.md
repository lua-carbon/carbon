<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Exceptions.CodeGenerationException</h1>
<span class="file-link">(in [./Carbon/Exceptions/CodeGenerationException.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Exceptions/CodeGenerationException.lua))</span><br/>

An exception to be generated when generation of code fails.

**Inherits <a href="Classes/Exception">Exception</a>**

## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  CodeGenerationException:New(<code>string message, string code</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Exceptions.CodeGenerationException">CodeGenerationException</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `message`: A message explaining why code generation failed.
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `code`: The code that was generated.

Denotes that code generation failed in a metaprogramming-enabled module.


## Properties
#### <img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" /> <code>string</code> GeneratedCode
Contains the code that was generated and failed to meet the criteria.

<hr/>
#### <img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" /> <code>string</code> Message
Contains a message about what went wrong generating code.

