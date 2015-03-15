# Time
Provides utilities for working with time.

**Inherits [none]**

## Methods
#### void Time.Sleep(ufloat seconds)
- seconds: The number of seconds to sleep.

Sleeps using the system timer.
If no timer providers are available, will not do anything.


#### ufloat Time.Get()


Returns a benchmarking time using the highest precision internal timer.


#### ufloat Time.Weeks(ufloat weeks)


Converts the given number of weeks to seconds.


#### ufloat Time.Days(ufloat days)


Converts the given number of days to seconds.


#### ufloat Time.Hours(ufloat hours)


Converts the given number of hours to seconds.


#### ufloat Time.Minutes(ufloat minutes)


Converts the given number of minutes to seconds.


#### ufloat Time.Seconds(ufloat seconds)


Converts the given number of seconds to seconds.
Not very useful.


#### ufloat Time.Milliseconds(ufloat milliseconds)


Converts the given number of milliseconds to seconds.


#### ufloat Time.Nanoseconds(ufloat nanoseconds)


Converts the given number of nanoseconds to seconds.


## Properties
[none]


