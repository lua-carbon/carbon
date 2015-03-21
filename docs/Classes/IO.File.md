<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">IO.File</h1>
<span class="file-link">(in [./Carbon/IO.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/IO.lua))</span><br/>

Exposes object-oriented filesystem access. See [IO](Classes/IO) for more methods.

**Inherits [none]**

## Methods
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  File:Close()</h4>



**Returns  [void](Types#void)**

Closes the file.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  File:Read()</h4>



**Returns  [void](Types#void)**

Reads the entire contents of the file.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  File:ReadBufferAsync(<code>[[list](Types#list)&lt;[string](Types#string)&gt; into]</code>)</h4>

- <img alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />&nbsp;&nbsp;`into`: A list to write the output into instead of creating a new buffer.

**Returns  [Promise](Classes/Promise)&lt;[list](Types#list)&lt;[string](Types#string)&gt;&gt;**

Reads a file and amortizes its loading through an event loop.
Returns the raw buffer, containing a series of strings.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  File:ReadBufferAsync()</h4>



**Returns  [Promise](Classes/Promise)&lt;[string](Types#string)&gt;**

Reads a file and amortizes its loading through an event loop.
The same as `File:ReadAsync()`

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  File:Write(<code>[string](Types#string) contents</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`contents`: The file contents

**Returns  [void](Types#void)**

Writes to the file.


## Properties
[none]
