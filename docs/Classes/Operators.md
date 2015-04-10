<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Operators</h1>
<span class="file-link">(in [./Carbon/Operators.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Operators.lua))</span><br/>

Provides functional forms of operators. Useful for having a common base.


<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Operators.Sign(<code><a href="Types#number">number</a> n</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#number">number</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `n`: The number to check the sign of.</li>
</ul>

Returns the sign of a number as a signed number.

Positive numbers result in `1`

Negative numbers result in <code>-1</code>

Zero results in `0`
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Operators.Add(<code><a href="Types#any">any</a> a, <a href="Types#any">any</a> b</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `a`: The first value to add.</li>
<li><span class="doc-arg-level doc-required">required</span>  `b`: The second value to add.</li>
</ul>

Adds two objects together. <code>a + b</code>
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Operators.AddN(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `...`: Values to add.</li>
</ul>

Adds any number of objects together. <code>a + b + c + d + ...</code>
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Operators.Subtract(<code><a href="Types#any">any</a> a, <a href="Types#any">any</a> b</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `a`: The value to subtract from.</li>
<li><span class="doc-arg-level doc-required">required</span>  `b`: The value to subtract.</li>
</ul>

Subtracts an object from another. <code>a - b</code>
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Operators.SubtractN(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `...`: The values to use in a subtraction expression.</li>
</ul>

Subtracts a series of objects from eachother. <code>a - b - c - d - ...</code>
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Operators.Multiply(<code><a href="Types#any">any</a> a, <a href="Types#any">any</a> b</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `a`: The first value to multiply.</li>
<li><span class="doc-arg-level doc-required">required</span>  `b`: The second value to multiply.</li>
</ul>

Multiplies two objects together. <code>a * b</code>
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Operators.MultiplyN(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `...`: The values to multiply together.</li>
</ul>

Multiples a series of objects together. <code>a * b * c * d * ...</code>
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Operators.Divide(<code><a href="Types#any">any</a> a, <a href="Types#any">any</a> b</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `a`: The dividend.</li>
<li><span class="doc-arg-level doc-required">required</span>  `b`: The divisor.</li>
</ul>

Performs division between two objects. <code>a / b</code>
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Operators.DivideN(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `...`: A list of objects to use in a chain division.</li>
</ul>

Divides a series of objects from the left. <code>a / b / c / d / ...</code>
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Operators.Power(<code><a href="Types#any">any</a> a, <a href="Types#any">any</a> b</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `a`: The base.</li>
<li><span class="doc-arg-level doc-required">required</span>  `b`: The exponent.</li>
</ul>

Performs exponentiation with two numbers. <code>a ^ b</code>
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Operators.PowerN(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `...`: The values to use in a chained exponentiation expression.</li>
</ul>

Raises values to powers given by a list in a left-associative way. <code>((((a ^ b) ^ c) ^ d) ^ ...)</code>
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Operators.Concat(<code><a href="Types#any">any</a> a, <a href="Types#any">any</a> b</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `a`: The first value to concat.</li>
<li><span class="doc-arg-level doc-required">required</span>  `b`: The second value to concat.</li>
</ul>

Performs concatenation with two objects. <code>a .. b</code>
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Operators.ConcatN(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `...`: The values to concat.</li>
</ul>

Performs concatenation with a list of objects. <code>a .. b .. c .. d .. ...</code>
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Operators.Equal(<code><a href="Types#any">any</a> a, <a href="Types#any">any</a> b</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#bool">bool</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `a`: The first value.</li>
<li><span class="doc-arg-level doc-required">required</span>  `b`: The second value.</li>
</ul>

Returns whether two values are equal. Uses the <code>__eq</code> metamethod.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Operators.GreaterThan(<code><a href="Types#any">any</a> a, <a href="Types#any">any</a> b</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#bool">bool</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `a`: The first value.</li>
<li><span class="doc-arg-level doc-required">required</span>  `b`: The second value.</li>
</ul>

Returns whether a is greater than b. Uses the <code>__le</code> metamethod if available, otherwise uses <code>__lt</code> and <code>__eq</code>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Operators.GreaterThanEqualTo(<code><a href="Types#any">any</a> a, <a href="Types#any">any</a> b</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#bool">bool</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `a`: The first value.</li>
<li><span class="doc-arg-level doc-required">required</span>  `b`: The second value.</li>
</ul>

Returns whether a is greater than or equal to b. Uses the <code>__lt</code> and <code>__eq</code> metamethods.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Operators.LessThan(<code><a href="Types#any">any</a> a, <a href="Types#any">any</a> b</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#bool">bool</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `a`: The first value.</li>
<li><span class="doc-arg-level doc-required">required</span>  `b`: The second value.</li>
</ul>

Returns whether a is less than b. Uses the <code>__lt</code> metamethod.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Operators.LessThanEqualTo(<code><a href="Types#any">any</a> a, <a href="Types#any">any</a> b</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#bool">bool</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `a`: The first value.</li>
<li><span class="doc-arg-level doc-required">required</span>  `b`: The second value.</li>
</ul>

Returns whether a is less than or equal to b. Uses the <code>__le</code> metamethod if available, otherwise uses <code>__lt</code> and <code>__eq</code>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Operators.NotEqual(<code><a href="Types#any">any</a> a, <a href="Types#any">any</a> b</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#bool">bool</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `a`: The first value.</li>
<li><span class="doc-arg-level doc-required">required</span>  `b`: the second value.</li>
</ul>

Returns whether two values are not equal. Uses the <code>__eq</code> metamethod.

<hr />
## Properties
[none]