<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Math.Vector</h1>
<span class="file-link">(in [./Carbon/Math/Vector.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Math/Vector.lua))</span><br/>

**Abstract Template <code>Vector&lt;N&gt;</code>**

Provides a metaprogramming-driven method of generating N-length vectors.

Presently has a hard maximum component count of 26, can be expanded upon request.

**Inherits [OOP.Object](Classes/OOP.Object)**

## Methods
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Vector&lt;N&gt;:New(<code>...</code>)</h4>

- <img alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />&nbsp;&nbsp;`...`: The arguments to the intialization. Should be `N` arguments long.

**Returns  [Vector](Classes/Math.Vector)&lt;N&gt;**

Creates a new [Vector](Classes/Math.Vector) with `N` components.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Vector:Generate(<code>[uint](Types#uint) length, [[dictionary](Types#dictionary) parameters]</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`length`: The length of the vector.
- <img alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />&nbsp;&nbsp;`parameters`: Options for generating the class:

**Returns  [Vector](Classes/Math.Vector)&lt;length&gt;**

Generates a new Vector class with the given keys and parameters. Results are cached, but this method may still be slow.
It performs runtime code generation and template parsing on each generated class.

The following parameters are valid:

- [number](Types#number) NormalizedLength (1): The length the vector reaches when normalized.
- [number](Types#number) DefaultValue (0): The value to initialize all members to if not given.
- [list](Types#list)&lt;[number](Types#number)&gt; DefaultValues: A list of values to initialize specific keys to. If any are given, all keys must be specified.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Vector&lt;N&gt;:GetComponents()</h4>



**Returns  [tuple](Types#tuple)&lt;N, unumber&gt;**

public [tuple](Types#tuple)&lt;N, unumber&gt; Vector&lt;N&gt;:GetComponents()

Returns the individual components of the [Vector](Classes/Math.Vector)&lt;N&gt; in order. Much faster than `unpack`.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Vector&lt;N&gt;:Length()</h4>



**Returns  [unumber](Types#unumber)**

public [unumber](Types#unumber) Vector&lt;N&gt;:Length()

Returns the length of the vector.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Vector&lt;N&gt;:LengthSquared()</h4>



**Returns  [unumber](Types#unumber)**

public [unumber](Types#unumber) Vector&lt;N&gt;:LengthSquared()

Returns the length of the vector squared.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Vector&lt;N&gt;:Normalize(<code>[[Vector](Classes/Math.Vector)&lt;N&gt; out]</code>)</h4>

- <img alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />&nbsp;&nbsp;`out`: Where to place the data of the normalized vector. A new `Vector<N>` if not given.

**Returns  out**

Normalizes the [Vector](Classes/Math.Vector)&lt;N&gt; object, optionally outputting the data to an existing [Vector](Classes/Math.Vector)&lt;N&gt;.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Vector&lt;N&gt;:NormalizeInPlace()</h4>



**Returns  self**

public self Vector&lt;N&gt;:NormalizeInPlace()

Normalizes the vector in-place.

Called in Carbide as `Vector:Normalize!()`

<hr/>
<h4 class="method-name"><img alt="private" src="https://img.shields.io/badge/ -private-d30500.svg?style=flat-square" />  Vector:__generate_method(<code>[string](Types#string) body, [dictionary](Types#dictionary) arguments, [[dictionary](Types#dictionary) env]</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`body`: Template-enabled code to return a function.
- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`arguments`: Arguments to the template
- <img alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />&nbsp;&nbsp;`env`: The environment to generate the method under.

**Returns  function**

Generates a method using Carbon's TemplateEngine and handles errors.


## Properties
[none]
