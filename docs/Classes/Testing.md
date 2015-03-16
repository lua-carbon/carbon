<h1 class="class-title">Testing</h1>
<span class="file-link">(in [./Carbon/Testing/_.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Testing/_.lua))</span><br/>
Manages execution of tests for Carbon.

**Inherits [none]**

## Methods
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Testing:TestFor(<code>any module, Test test</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`module`: The module to associate a test wtith.
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`test`: The test to associate with this module.

**Returns  void**

Associates a test as necessary to prove functionality of a module.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Testing:Requires(<code>any module</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`module`: The module to test before this one.

**Returns  void**

Denotes that this module will not test correcly if another module failed any tests.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Testing:Prerequisite(<code>Test test</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`test`: The test to mark.

**Returns  void**

Marks that a given test is a prerequisite of this test.
Should only be used within tests.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Testing:RunTest(<code>Test test</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`test`: The test to run.

**Returns  void**

Runs a test if it has not been run already.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Testing:RunTestList(<code>table test</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`test`: The test container to run.

**Returns  void**

Runs a list or dictionary full of tests.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Testing:RunAllTests()


**Returns  void**

Runs all the tests.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) Testing:GetResults()


**Returns  table**

Aggregates and returns the overall results for the tests that have been run.


## Properties
[none]
