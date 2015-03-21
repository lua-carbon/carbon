<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">IO</h1>
<span class="file-link">(in [./Carbon/IO.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/IO.lua))</span><br/>

Provides async and sync I/O operations that work on multiple platforms.

**Inherits [none]**

## Methods
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  IO.Open(<code>[string](Types#string) path, [[string](Types#string) mode, [Nanotube](Classes/Nanotube) tube]</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`path`: The path to the file to open.
- <img alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />&nbsp;&nbsp;`mode`: The file mode to open the file with. Defaults to "rb".
- <img alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />&nbsp;&nbsp;`tube`: The Nanotube object to cycle file events through with asynchronous I/O calls on this file.

**Returns  [File](Classes/File)**

Opens a new [File](Classes/File) object.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  IO.Close(<code>[File](Classes/File) self</code>)</h4>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  File:Close()</h4>



**Returns  [void](Types#void)**

Closes the file.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  IO.Read(<code>[File](Classes/File) self</code>)</h4>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  File:Read()</h4>



**Returns  [string](Types#string)**

Reads the entire contents of the file.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  IO.ReadBufferAsync(<code>[File](Classes/File) self, [[list](Types#list)&lt;[string](Types#string)&gt; into]</code>)</h4>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  File:ReadBufferAsync(<code>[[list](Types#list)&lt;[string](Types#string)&gt; into]</code>)</h4>

- <img alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />&nbsp;&nbsp;`into`: A list to write the output into instead of creating a new buffer.

**Returns  [Promise](Classes/Promise)&lt;[list](Types#list)&lt;[string](Types#string)&gt;&gt;**

Reads a file and amortizes its loading through an event loop.
Returns the raw buffer, containing a series of strings.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  IO.ReadBufferAsync(<code>File self</code>)</h4>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  File:ReadBufferAsync()</h4>



**Returns  [Promise](Classes/Promise)&lt;[string](Types#string)&gt;**

Reads a file and amortizes its loading through an event loop.
The same as `File:ReadAsync()`

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  IO.ReadFileAsync(<code>[string](Types#string) path, [[Nanotube](Classes/Nanotube) tube]</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`path`: The path to the file to read.
- <img alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />&nbsp;&nbsp;`tube`: The Nanotube object to cycle events through. Defaults to the global tube.

**Returns  [Promise](Classes/Promise)&lt;string&gt;**

Opens a file by a path and returns its contents through a [Promise](Classes/Promise).

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  IO.Write(<code>[File](Classes/File) self, [string](Types#string) contents</code>)</h4>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  File:Write(<code>[string](Types#string) contents</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`contents`: The file contents

**Returns  [void](Types#void)**

Writes to the file.


## Properties
[none]
