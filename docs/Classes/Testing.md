# Testing
Manages execution of tests for Carbon.

**Inherits [none]**

## Methods
#### ![public][public] void Testing:TestFor(any module, Test test)
- ![required][required] module: The module to associate a test wtith.
- ![required][required] test: The test to associate with this module.

Associates a test as necessary to prove functionality of a module.


#### ![public][public] void Testing:Requires(any module)
- ![required][required] module: The module to test before this one.

Denotes that this module will not test correcly if another module failed any tests.


#### ![public][public] void Testing:Prerequisite(Test test)
- ![required][required] test: The test to mark.

Marks that a given test is a prerequisite of this test.
Should only be used within tests.


#### ![public][public] void Testing:RunTest(Test test)
- ![required][required] test: The test to run.

Runs a test if it has not been run already.


#### ![public][public] void Testing:RunTestList(table test)
- ![required][required] test: The test container to run.

Runs a list or dictionary full of tests.


#### ![public][public] void Testing:RunAllTests()


Runs all the tests.


#### ![public][public] table Testing:GetResults()


Aggregates and returns the overall results for the tests that have been run.


## Properties
[none]


[public]: https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square
[required]: https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square