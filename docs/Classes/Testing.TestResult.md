<link href="style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Testing.TestResult</h1>
<span class="file-link">(in [./Carbon/Testing/TestResult.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Testing/TestResult.lua))</span><br/>
An object to signal success and failure conditions to the test engine.

**Inherits [none]**

## Methods
#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) TestResult:New(<code>Test test</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`test`: The test that will use this TestResult.

**Returns  TestResult**

Creates a new TestResult object for unit tests to fill.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) TestResult:Pass()


**Returns  self**

Marks that a component of the TestResult has passed.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) TestResult:Message(<code>string message</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`message`: A message to record.

**Returns  self**

Records a message about the test without failing the test.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) TestResult:Warn(<code>string message</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`message`: A warning to issue.

**Returns  self**

Issues a warning without failing the test.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) TestResult:Fail(<code>string message</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`message`: The error message to store.

**Returns  self**

Marks the test as a failure and increments the failure counter.


#### ![public](https://img.shields.io/badge/%20-public-11b237.svg?style=flat-square) TestResult:Assert(<code>bool condition, string message</code>)
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`condition`: Condition to check.
- ![required](https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square)&nbsp;&nbsp;`message`: Message to report on failure.

**Returns  bool**

Checks the given condition and adds a pass if it is true, or fails with the given message.


## Properties
[none]
