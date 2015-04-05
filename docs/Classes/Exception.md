<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Exception</h1>
<span class="file-link">(in [./Carbon/Exception.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Exception.lua))</span><br/>

Signals detailed, strongly-typed error conditions.

**Inherits <a href="Classes/OOP.Object">OOP.Object</a>**

<hr />
## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Exception:New(<code><a href="Types#string">string</a> message</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Exception">Exception</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `message`: The message to initialize the exception with.

Creates a new generic exception with the given message.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Exception:Throw(<code>[<a href="Types#uint">uint</a> level]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#void">void</a></code></span>**

- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `level`: An optional parameter passed onto Lua's error function.

Throws the exception as a traditional Lua error.


<hr />
## Properties
#### <img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" /> <code><a href="Types#string">string</a></code> Exception.Message
An error message explaining the exception.

