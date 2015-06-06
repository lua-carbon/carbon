<h1 class="class-title">Functional</h1>
<span class="file-link">(in [./Carbon/Functional.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Functional.lua))</span><br/>

Provides an interface for functional programming.

*This module may be slated for significant changes in the future.*


<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Functional.All(<code><a href="Types#table">table</a> objects</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#bool">bool</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `objects`: The values to check for truthiness.</li>
</ul>

Returns whether all the values in the table are truthy.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Functional.AllTuple(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#bool">bool</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `...`: The values to check for truthiness.</li>
</ul>

Returns whether all the values in the tuple are truthy.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Functional.Any(<code><a href="Types#table">table</a> objects</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#bool">bool</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `objects`: The values to check for truthiness.</li>
</ul>

Returns whether any one of the values in the table is truthy.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Functional.AnyTuple(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#bool">bool</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `...`: The values to check for truthiness.</li>
</ul>

Returns whether any one of the values in the tuple is truthy.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Functional.Filter(<code><a href="Types#function">function</a> <a href="Types#bool">bool</a> method(<a href="Types#any">any</a> value), <a href="Types#list">list</a> list</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#list">list</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `method`: The method to use for filtering. Takes in a valid and returns whether it should stay.</li>
<li><span class="doc-arg-level doc-required">required</span>  `list`: The list of values to filter over.</li>
</ul>

Uses a function to filter a list of values.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Functional.Map(<code><a href="Types#function">function</a> <a href="Types#any">any</a> method(<a href="Types#any">any</a> value), <a href="Types#list">list</a> list</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#list">list</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `method`: The method to use for mapping. Takes in a value and returns a transformed version of it.</li>
<li><span class="doc-arg-level doc-required">required</span>  `list`: The list of values to map over.</li>
</ul>

Uses a function to perform a mapping of values.

This method (erroneously) modified the list before 1.1.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Functional.Range(<code>number a, number b</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#list">list</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `a`: The number to start at.</li>
<li><span class="doc-arg-level doc-required">required</span>  `b`: The number to end at.</li>
</ul>

Creates a range in the form of a <a href="Types#list">list</a>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Functional.Reduce(<code><a href="Types#function">function</a> T method(T total, T current), <a href="Types#list">list</a> list</code>)</h4>
<p class="method-returns bold">Returns <code>T</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `method`: The method to use for reduction. Accepts the total and the current value, returns the new total.</li>
<li><span class="doc-arg-level doc-required">required</span>  `list`: The list of values to reduce over.</li>
</ul>

Performs a reduction over the list with the given function.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Functional.Unpack(<code><a href="Types#table">table</a> object</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#tuple">tuple</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `object`: The table to unpack.</li>
</ul>

Unpacks the table into a tuple. The same as <code>unpack</code> and <code>table.unpack</code>.

**DEPRECATED** in 1.1: Use Carbon.Unpack (added in 1.0.1)
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Functional.ViewReverse(<code><a href="Types#list">list</a> list</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#userdata">userdata</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `list`: The list to create a view for.</li>
</ul>

Creates a view that returns all values of the list reversed.

<hr />
## Properties
[none]