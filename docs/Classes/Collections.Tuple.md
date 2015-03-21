<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Collections.Tuple</h1>
<span class="file-link">(in [./Carbon/Collections/Tuple.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Collections/Tuple.lua))</span><br/>

A disposable List object for quick vararg transformations.

**Inherits [OOP.Object](Classes/OOP.Object)**

## Methods
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Tuple:New(<code>...</code>)</h4>

- <img alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />&nbsp;&nbsp;`...`: The values to initialize the Tuple with.

**Returns  [Tuple](Classes/Collections.Tuple)**

Creates a new Tuple.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Tuple:Destroy(<code>...</code>)</h4>

- <img alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />&nbsp;&nbsp;`...`: Data to pipe through this method.

**Returns  ...**

Destroys the tuple, passing any arguments that it was given as return values.
This will put the tuple back into the main buffer, usually.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Tuple:Unpack()</h4>



**Returns  ...**

public ... Tuple:Unpack()

Unpacks and destroys the Tuple, returning all its values.


## Properties
[none]
