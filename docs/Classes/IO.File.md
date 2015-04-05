<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">IO.File</h1>
<span class="file-link">(in [./Carbon/IO.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/IO.lua))</span><br/>

Exposes object-oriented filesystem access. See <a href="Classes/IO">IO</a> for more methods.

**Inherits [none]**

<hr />
## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  File:Close()</h4>
**<span class="method-returns">Returns <code><a href="Types#void">void</a></code></span>**



Closes the file.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  File:Read()</h4>
**<span class="method-returns">Returns <code><a href="Types#void">void</a></code></span>**



Reads the entire contents of the file.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  File:ReadBufferAsync(<code>[<a href="Types#list">list</a>&lt;<a href="Types#string">string</a>&gt; into]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Promise">Promise</a>&lt;<a href="Types#list">list</a>&lt;<a href="Types#string">string</a>&gt;&gt;</code></span>**

- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `into`: A list to write the output into instead of creating a new buffer.

Reads a file and amortizes its loading through an event loop.
Returns the raw buffer, containing a series of strings.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  File:ReadBufferAsync()</h4>
**<span class="method-returns">Returns <code><a href="Classes/Promise">Promise</a>&lt;<a href="Types#string">string</a>&gt;</code></span>**



Reads a file and amortizes its loading through an event loop.
The same as <code>File:ReadAsync()</code>

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  File:Write(<code><a href="Types#string">string</a> contents</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#void">void</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `contents`: The file contents

Writes to the file.


<hr />
## Properties
[none]
