<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Time</h1>
<span class="file-link">(in [./Carbon/Time.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Time.lua))</span><br/>

Provides utilities for working with time.

<span class="bold">Inherits [none]</span>

<hr />
## Methods
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> Time.Get()</h4>
<p class="method-returns bold">Returns <code><a href="Types#unumber">unumber</a></code></p>
<ul class="doc-arg-list">

</ul>

Returns a benchmarking time using the highest precision internal timer.
<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> Time.Sleep(<code><a href="Types#unumber">unumber</a> seconds</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `seconds`: The number of seconds to sleep.</li>
</ul>

Sleeps using the system timer.
If no timer providers are available, will not do anything.
<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> Time.Days(<code><a href="Types#unumber">unumber</a> days</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#unumber">unumber</a></code></p>
<ul class="doc-arg-list">

</ul>

Converts the given number of days to seconds.
<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> Time.Hours(<code><a href="Types#unumber">unumber</a> hours</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#unumber">unumber</a></code></p>
<ul class="doc-arg-list">

</ul>

Converts the given number of hours to seconds.
<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> Time.Milliseconds(<code><a href="Types#unumber">unumber</a> milliseconds</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#unumber">unumber</a></code></p>
<ul class="doc-arg-list">

</ul>

Converts the given number of milliseconds to seconds.
<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> Time.Minutes(<code><a href="Types#unumber">unumber</a> minutes</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#unumber">unumber</a></code></p>
<ul class="doc-arg-list">

</ul>

Converts the given number of minutes to seconds.
<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> Time.Nanoseconds(<code><a href="Types#unumber">unumber</a> nanoseconds</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#unumber">unumber</a></code></p>
<ul class="doc-arg-list">

</ul>

Converts the given number of nanoseconds to seconds.
<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> Time.Seconds(<code><a href="Types#unumber">unumber</a> seconds</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#unumber">unumber</a></code></p>
<ul class="doc-arg-list">

</ul>

Converts the given number of seconds to seconds.
Not very useful.
<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> Time.Weeks(<code><a href="Types#unumber">unumber</a> weeks</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#unumber">unumber</a></code></p>
<ul class="doc-arg-list">

</ul>

Converts the given number of weeks to seconds.

<hr />
## Properties
[none]