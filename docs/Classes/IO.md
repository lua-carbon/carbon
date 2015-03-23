<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">IO</h1>
<span class="file-link">(in [./Carbon/IO.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/IO.lua))</span><br/>

Provides async and sync I/O operations that work on multiple platforms.

**Inherits [none]**

## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  IO.Open(<code><a href="Types#string">string</a> path, [<a href="Types#string">string</a> mode, <a href="Classes/Nanotube">Nanotube</a> tube]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/File">File</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `path`: The path to the file to open.
- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `mode`: The file mode to open the file with. Defaults to "rb".
- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `tube`: The Nanotube object to cycle file events through with asynchronous I/O calls on this file.

Opens a new <a href="Classes/File">File</a> object.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  IO.Close(<code><a href="Classes/File">File</a> self</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#void">void</a></code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  File:Close()</h4>
**<span class="method-returns">Returns <code><a href="Types#void">void</a></code></span>**



Closes the file.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  IO.Read(<code><a href="Classes/File">File</a> self</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#string">string</a></code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  File:Read()</h4>
**<span class="method-returns">Returns <code><a href="Types#void">void</a></code></span>**



Reads the entire contents of the file.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  IO.ReadBufferAsync(<code><a href="Classes/File">File</a> self, [<a href="Types#list">list</a>&lt;<a href="Types#string">string</a>&gt; into]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Promise">Promise</a>&lt;<a href="Types#list">list</a>&lt;<a href="Types#string">string</a>&gt;&gt;</code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  File:ReadBufferAsync(<code>[<a href="Types#list">list</a>&lt;<a href="Types#string">string</a>&gt; into]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Promise">Promise</a>&lt;<a href="Types#list">list</a>&lt;<a href="Types#string">string</a>&gt;&gt;</code></span>**

- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `into`: A list to write the output into instead of creating a new buffer.

Reads a file and amortizes its loading through an event loop.
Returns the raw buffer, containing a series of strings.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  IO.ReadBufferAsync(<code>File self</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Promise">Promise</a>&lt;<a href="Types#string">string</a>&gt;</code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  File:ReadBufferAsync()</h4>
**<span class="method-returns">Returns <code><a href="Classes/Promise">Promise</a>&lt;<a href="Types#string">string</a>&gt;</code></span>**



Reads a file and amortizes its loading through an event loop.
The same as `File:ReadAsync()`

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  IO.ReadFileAsync(<code><a href="Types#string">string</a> path, [<a href="Classes/Nanotube">Nanotube</a> tube]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Promise">Promise</a>&lt;string&gt;</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `path`: The path to the file to read.
- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `tube`: The Nanotube object to cycle events through. Defaults to the global tube.

Opens a file by a path and returns its contents through a <a href="Classes/Promise">Promise</a>.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  IO.Write(<code><a href="Classes/File">File</a> self, <a href="Types#string">string</a> contents</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#void">void</a></code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  File:Write(<code><a href="Types#string">string</a> contents</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#void">void</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `contents`: The file contents

Writes to the file.


## Properties
[none]
