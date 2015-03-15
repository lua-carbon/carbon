# Testing.TestResult
An object to signal success and failure conditions to the test engine.

**Inherits [none]**

## Methods
#### ![public][public] TestResult TestResult:New(Test test)
- ![required][required] test: The test that will use this TestResult.

Creates a new TestResult object for unit tests to fill.


#### ![public][public] self TestResult:Pass()


Marks that a component of the TestResult has passed.


#### ![public][public] self TestResult:Message(string message)
- ![required][required] message: A message to record.

Records a message about the test without failing the test.


#### ![public][public] self TestResult:Warn(string message)
- ![required][required] message: A warning to issue.

Issues a warning without failing the test.


#### ![public][public] self TestResult:Fail(string message)
- ![required][required] message: The error message to store.

Marks the test as a failure and increments the failure counter.


#### ![public][public] bool TestResult:Assert(bool condition, string message)
- ![required][required] condition: Condition to check.
- ![required][required] message: Message to report on failure.

Checks the given condition and adds a pass if it is true, or fails with the given message.


## Properties
[none]


[public]: https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square
[required]: https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square