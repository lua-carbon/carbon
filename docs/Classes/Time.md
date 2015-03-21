<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Time</h1>
<span class="file-link">(in [./Carbon/Time.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Time.lua))</span><br/>

Provides utilities for working with time.

**Inherits [none]**

## Methods
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Time.Sleep(<code>[unumber](Types#unumber) seconds</code>)</h4>

- <img alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />&nbsp;&nbsp;`seconds`: The number of seconds to sleep.

**Returns  [void](Types#void)**

Sleeps using the system timer.
If no timer providers are available, will not do anything.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Time.Get()</h4>



**Returns  [unumber](Types#unumber)**

public [unumber](Types#unumber) Time.Get()

Returns a benchmarking time using the highest precision internal timer.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Time.Days(<code>[unumber](Types#unumber) days</code>)</h4>



**Returns  [unumber](Types#unumber)**

public [unumber](Types#unumber) Time.Days([unumber](Types#unumber) days)

Converts the given number of days to seconds.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Time.Hours(<code>[unumber](Types#unumber) hours</code>)</h4>



**Returns  [unumber](Types#unumber)**

public [unumber](Types#unumber) Time.Hours([unumber](Types#unumber) hours)

Converts the given number of hours to seconds.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Time.Milliseconds(<code>[unumber](Types#unumber) milliseconds</code>)</h4>



**Returns  [unumber](Types#unumber)**

public [unumber](Types#unumber) Time.Milliseconds([unumber](Types#unumber) milliseconds)

Converts the given number of milliseconds to seconds.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Time.Minutes(<code>[unumber](Types#unumber) minutes</code>)</h4>



**Returns  [unumber](Types#unumber)**

public [unumber](Types#unumber) Time.Minutes([unumber](Types#unumber) minutes)

Converts the given number of minutes to seconds.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Time.Nanoseconds(<code>[unumber](Types#unumber) nanoseconds</code>)</h4>



**Returns  [unumber](Types#unumber)**

public [unumber](Types#unumber) Time.Nanoseconds([unumber](Types#unumber) nanoseconds)

Converts the given number of nanoseconds to seconds.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Time.Seconds(<code>[unumber](Types#unumber) seconds</code>)</h4>



**Returns  [unumber](Types#unumber)**

public [unumber](Types#unumber) Time.Seconds([unumber](Types#unumber) seconds)

Converts the given number of seconds to seconds.
Not very useful.

<hr/>
<h4 class="method-name"><img alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Time.Weeks(<code>[unumber](Types#unumber) weeks</code>)</h4>



**Returns  [unumber](Types#unumber)**

public [unumber](Types#unumber) Time.Weeks([unumber](Types#unumber) weeks)

Converts the given number of weeks to seconds.


## Properties
[none]
