<link href="style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">IO</h1>
<span class="file-link">(in [./Carbon/IO.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/IO.lua))</span><br/>
Provides async and sync I/O operations that work on multiple platforms.

**Inherits [none]**

## Methods
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) IO.Open(<code>[string](Types#string) path, [[string](Types#string) mode, [Nanotube](Classes/Nanotube) tube]</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`path`: The path to the file to open.
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`mode`: The file mode to open the file with. Defaults to "rb".
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`tube`: The Nanotube object to cycle file events through with asynchronous I/O calls on this file.

**Returns  [File](Classes/IO.File)**

Opens a new [File](Classes/IO.File) object.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) IO.ReadFileAsync(<code>[string](Types#string) path, [[Nanotube](Classes/Nanotube) tube]</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`path`: The path to the file to read.
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`tube`: The Nanotube object to cycle events through. Defaults to the global tube.

**Returns  [Promise](Classes/Promise)<string>**

Opens a file by a path and returns its contents through a [Promise](Classes/Promise).


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) IO.Close(<code>[File](Classes/IO.File) self</code>)


**Returns  [void](Types#void)**

Closes the file. The same as `File:Close()`


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) IO.Read(<code>[File](Classes/IO.File) self</code>)


**Returns  [string](Types#string)**

Reads the entire contents of the file. The same as `File:Read()`


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) IO.Write(<code>[File](Classes/IO.File) self, [string](Types#string) contents</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`contents`: The file contents

**Returns  [void](Types#void)**

Writes to the file. The same as `File:Write(contents)`


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) IO.ReadBufferAsync(<code>[File](Classes/IO.File) self, [[list](Types#list)<[string](Types#string)> into]</code>)
- ![optional](https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square)&nbsp;&nbsp;`into`: A list to write the output into instead of creating a new buffer.

**Returns  [Promise](Classes/Promise)<[list](Types#list)<[string](Types#string)>>**

Reads a file and amortizes its loading through an event loop.
Returns the raw buffer, containing a series of strings.
The same as `File:ReadBufferAsync(into)`


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) IO.ReadBufferAsync(<code>File self</code>)


**Returns  [Promise](Classes/Promise)<[string](Types#string)>**

Reads a file and amortizes its loading through an event loop.
The same as `File:ReadAsync()`


## Properties
[none]
