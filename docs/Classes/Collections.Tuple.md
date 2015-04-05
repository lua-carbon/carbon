<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Collections.Tuple</h1>
<span class="file-link">(in [./Carbon/Collections/Tuple.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Collections/Tuple.lua))</span><br/>

A disposable List object for quick vararg transformations.

**Inherits <a href="Classes/OOP.Object">OOP.Object</a>**

<hr />
## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Tuple:New(<code>...</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Collections.Tuple">Tuple</a></code></span>**

- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `...`: The values to initialize the Tuple with.

Creates a new Tuple.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Tuple:Destroy(<code>...</code>)</h4>
**<span class="method-returns">Returns <code>...</code></span>**

- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `...`: Data to pipe through this method.

Destroys the tuple, passing any arguments that it was given as return values.
This will put the tuple back into the main buffer, usually.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Tuple:Unpack()</h4>
**<span class="method-returns">Returns <code>...</code></span>**



Unpacks and destroys the Tuple, returning all its values.


<hr />
## Properties
[none]
