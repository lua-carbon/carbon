<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Time</h1>
<span class="file-link">(in [./Carbon/Time.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Time.lua))</span><br/>

Provides utilities for working with time.

**Inherits [none]**

## Methods
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Time.Sleep(<code>[unumber](Types#unumber) seconds</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`seconds`: The number of seconds to sleep.

**Returns  [void](Types#void)**

Sleeps using the system timer.
If no timer providers are available, will not do anything.

<hr/>
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Time.Get()


**Returns  [unumber](Types#unumber)**

Returns a benchmarking time using the highest precision internal timer.

<hr/>
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Time.Days(<code>[unumber](Types#unumber) days</code>)


**Returns  [unumber](Types#unumber)**

Converts the given number of days to seconds.

<hr/>
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Time.Hours(<code>[unumber](Types#unumber) hours</code>)


**Returns  [unumber](Types#unumber)**

Converts the given number of hours to seconds.

<hr/>
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Time.Milliseconds(<code>[unumber](Types#unumber) milliseconds</code>)


**Returns  [unumber](Types#unumber)**

Converts the given number of milliseconds to seconds.

<hr/>
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Time.Minutes(<code>[unumber](Types#unumber) minutes</code>)


**Returns  [unumber](Types#unumber)**

Converts the given number of minutes to seconds.

<hr/>
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Time.Nanoseconds(<code>[unumber](Types#unumber) nanoseconds</code>)


**Returns  [unumber](Types#unumber)**

Converts the given number of nanoseconds to seconds.

<hr/>
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Time.Seconds(<code>[unumber](Types#unumber) seconds</code>)


**Returns  [unumber](Types#unumber)**

Converts the given number of seconds to seconds.
Not very useful.

<hr/>
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Time.Weeks(<code>[unumber](Types#unumber) weeks</code>)


**Returns  [unumber](Types#unumber)**

Converts the given number of weeks to seconds.


## Properties
[none]
