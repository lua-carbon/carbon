<link href="style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Time</h1>
<span class="file-link">(in [./Carbon/Time.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Time.lua))</span><br/>
Provides utilities for working with time.

**Inherits [none]**

## Methods
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Time.Sleep(<code>ufloat seconds</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`seconds`: The number of seconds to sleep.

**Returns  void**

Sleeps using the system timer.
If no timer providers are available, will not do anything.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Time.Get()


**Returns  ufloat**

Returns a benchmarking time using the highest precision internal timer.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Time.Weeks(<code>ufloat weeks</code>)


**Returns  ufloat**

Converts the given number of weeks to seconds.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Time.Days(<code>ufloat days</code>)


**Returns  ufloat**

Converts the given number of days to seconds.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Time.Hours(<code>ufloat hours</code>)


**Returns  ufloat**

Converts the given number of hours to seconds.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Time.Minutes(<code>ufloat minutes</code>)


**Returns  ufloat**

Converts the given number of minutes to seconds.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Time.Seconds(<code>ufloat seconds</code>)


**Returns  ufloat**

Converts the given number of seconds to seconds.
Not very useful.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Time.Milliseconds(<code>ufloat milliseconds</code>)


**Returns  ufloat**

Converts the given number of milliseconds to seconds.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Time.Nanoseconds(<code>ufloat nanoseconds</code>)


**Returns  ufloat**

Converts the given number of nanoseconds to seconds.


## Properties
[none]
