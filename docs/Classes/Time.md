<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Time</h1>
<span class="file-link">(in [./Carbon/Time.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Time.lua))</span><br/>

Provides utilities for working with time.

**Inherits [none]**

<hr />
## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Time.Get()</h4>
**<span class="method-returns">Returns <code><a href="Types#unumber">unumber</a></code></span>**



Returns a benchmarking time using the highest precision internal timer.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Time.Sleep(<code><a href="Types#unumber">unumber</a> seconds</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#void">void</a></code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `seconds`: The number of seconds to sleep.

Sleeps using the system timer.
If no timer providers are available, will not do anything.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Time.Days(<code><a href="Types#unumber">unumber</a> days</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#unumber">unumber</a></code></span>**



Converts the given number of days to seconds.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Time.Hours(<code><a href="Types#unumber">unumber</a> hours</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#unumber">unumber</a></code></span>**



Converts the given number of hours to seconds.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Time.Milliseconds(<code><a href="Types#unumber">unumber</a> milliseconds</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#unumber">unumber</a></code></span>**



Converts the given number of milliseconds to seconds.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Time.Minutes(<code><a href="Types#unumber">unumber</a> minutes</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#unumber">unumber</a></code></span>**



Converts the given number of minutes to seconds.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Time.Nanoseconds(<code><a href="Types#unumber">unumber</a> nanoseconds</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#unumber">unumber</a></code></span>**



Converts the given number of nanoseconds to seconds.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Time.Seconds(<code><a href="Types#unumber">unumber</a> seconds</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#unumber">unumber</a></code></span>**



Converts the given number of seconds to seconds.
Not very useful.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Time.Weeks(<code><a href="Types#unumber">unumber</a> weeks</code>)</h4>
**<span class="method-returns">Returns <code><a href="Types#unumber">unumber</a></code></span>**



Converts the given number of weeks to seconds.


<hr />
## Properties
[none]
