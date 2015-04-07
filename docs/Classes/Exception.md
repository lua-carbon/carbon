<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Exception</h1>
<span class="file-link">(in [./Carbon/Exception.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Exception.lua))</span><br/>

Signals detailed, strongly-typed error conditions.

<span class="bold">Inherits <a href="Classes/OOP.Object">OOP.Object</a></span>

<hr />
## Methods
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> Exception:New(<code><a href="Types#string">string</a> message</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Exception">Exception</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `message`: The message to initialize the exception with.</li>
</ul>

Creates a new generic exception with the given message.
<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> Exception:Throw(<code>[<a href="Types#uint">uint</a> level]</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-optional">optional</span>  `level`: An optional parameter passed onto Lua's error function.</li>
</ul>

Throws the exception as a traditional Lua error.

<hr />
## Properties
#### <span class="doc-visibility doc-public">public</span> <code><a href="Types#string">string</a></code> Exception.Message
An error message explaining the exception.