<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Math.Vector</h1>
<span class="file-link">(in [./Carbon/Math/Vector.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Math/Vector.lua))</span><br/>

**Abstract Template <code>Vector&lt;N&gt;</code>**

Provides a metaprogramming-driven method of generating N-length vectors.

Presently has a hard maximum component count of 26, can be expanded upon request.

**Inherits <a href="Classes/OOP.Object">OOP.Object</a>**

<hr />
## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/class-public-11b237.svg?style=flat-square" /> Vector&lt;N&gt;:New(<code>...</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Math.Vector">Vector</a>&lt;N&gt;</code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Vector&lt;N&gt;:Init(<code>...</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#void">void</a></code></span>**

- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `...`: The arguments to the intialization. Should be `N` arguments long.

Creates a new <a href="Classes/Math.Vector">Vector</a> with `N` components.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Vector:Generate(<code><a href="Types#uint">uint</a> length, [<a href="Types#dictionary">dictionary</a> parameters]</code>)</h4>
**<span class="method-returns">Returns <code><a href="Classes/Math.Vector">Vector</a>&lt;length&gt;</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `length`: The length of the vector.
- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `parameters`: Options for generating the class:

Generates a new Vector class with the given keys and parameters. Results are cached, but this method may still be slow.
It performs runtime code generation and template parsing on each generated class.

The following parameters are valid:

<ul><li><a href="Types#number">number</a> NormalizedLength (1): The length the vector reaches when normalized.<li><a href="Types#number">number</a> DefaultValue (0): The value to initialize all members to if not given.</li><li><a href="Types#list">list</a>&lt;<a href="Types#number">number</a>&gt; DefaultValues: A list of values to initialize specific keys to. If any are given, all keys must be specified.</li></li></ul>

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Vector&lt;N&gt;:GetComponents()</h4>
**<span class="method-returns">Returns <code><a href="Types#tuple">tuple</a>&lt;N, unumber&gt;</code></span>**



Returns the individual components of the <a href="Classes/Math.Vector">Vector</a>&lt;N&gt; in order. Much faster than <code>unpack</code>.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Vector&lt;N&gt;:Length()</h4>
**<span class="method-returns">Returns <code><a href="Types#unumber">unumber</a></code></span>**



Returns the length of the vector.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Vector&lt;N&gt;:LengthSquared()</h4>
**<span class="method-returns">Returns <code><a href="Types#unumber">unumber</a></code></span>**



Returns the length of the vector squared.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Vector&lt;N&gt;:Normalize(<code>[<a href="Classes/Math.Vector">Vector</a>&lt;N&gt; out]</code>)</h4>
**<span class="method-returns">Returns <code>out</code></span>**

- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `out`: Where to place the data of the normalized vector. A new `Vector<N>` if not given.

Normalizes the <a href="Classes/Math.Vector">Vector</a>&lt;N&gt; object, optionally outputting the data to an existing <a href="Classes/Math.Vector">Vector</a>&lt;N&gt;.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Vector&lt;N&gt;:Normalize!()</h4>
**<span class="method-returns">Returns <code>self</code></span>**
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/object-public-11b237.svg?style=flat-square" /> Vector&lt;N&gt;:NormalizeInPlace()</h4>
**<span class="method-returns">Returns <code>self</code></span>**



Normalizes the vector in-place.

Called in Carbide as <code>Vector:Normalize!()</code>

<hr/>
<h4 class="method-name"><img class="doc-image" alt="private" src="https://img.shields.io/badge/ -private-d30500.svg?style=flat-square" />  Vector:__generate_method(<code><a href="Types#string">string</a> body, <a href="Types#dictionary">dictionary</a> arguments, [<a href="Types#dictionary">dictionary</a> env]</code>)</h4>
**<span class="method-returns">Returns <code>function</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `body`: Template-enabled code to return a function.
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `arguments`: Arguments to the template
- <img class="doc-image" alt="optional" src="https://img.shields.io/badge/%20-optional-0092e6.svg?style=flat-square" />  `env`: The environment to generate the method under.

Generates a method using Carbon's TemplateEngine and handles errors.


<hr />
## Properties
[none]
