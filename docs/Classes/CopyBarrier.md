<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">CopyBarrier</h1>
<span class="file-link">(in [./Carbon/CopyBarrier.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/CopyBarrier.lua))</span><br/>

Prevents copying of the data it points to.
Forwards indexes and newindexes to target.

**Inherits <a href="Classes/OOP.Object">OOP.Object</a>**

## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  CopyBarrier:New(<code><a href="Types#any">any</a>? value</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/CopyBarrier">CopyBarrier</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `value`: The value to point at.

Creates a new <a href="Classes/CopyBarrier">CopyBarrier</a> pointing at the given value.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  CopyBarrier:Copy()</h4>
**<span class="method-returns">Returns <code>self</code></span>**



A stub that simply returns itself to prevent copying methods from copying this.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  CopyBarrier:Get()</h4>
**<span class="method-returns">Returns <code><a href="Types#any">any</a>?</code></span>**



Returns the value pointed to by the <a href="Classes/CopyBarrier">CopyBarrier</a>.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  CopyBarrier:Set(<code><a href="Types#any">any</a>? value</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#void">void</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `value`: The new value for the <a href="Classes/CopyBarrier">CopyBarrier</a>.

Sets a new value for the <a href="Classes/CopyBarrier">CopyBarrier</a>.


## Properties
[none]
