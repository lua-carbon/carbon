<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Testing</h1>
<span class="file-link">(in [./Carbon/Testing/_.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Testing/_.lua))</span><br/>

Manages execution of tests for Carbon.

**Inherits [none]**

## Methods
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Testing:GetResults()</h4>
**<span class="method-returns">Returns <code>table</code></span>**



Aggregates and returns the overall results for the tests that have been run.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Testing:Prerequisite(<code>Test test</code>)</h4>
**<span class="method-returns">Returns <code>void</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `test`: The test to mark.

Marks that a given test is a prerequisite of this test.
Should only be used within tests.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Testing:Requires(<code>any module</code>)</h4>
**<span class="method-returns">Returns <code>void</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `module`: The module to test before this one.

Denotes that this module will not test correcly if another module failed any tests.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Testing:RunAllTests()</h4>
**<span class="method-returns">Returns <code>void</code></span>**



Runs all the tests.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Testing:RunTest(<code>Test test</code>)</h4>
**<span class="method-returns">Returns <code>void</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `test`: The test to run.

Runs a test if it has not been run already.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Testing:RunTestList(<code>table test</code>)</h4>
**<span class="method-returns">Returns <code>void</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `test`: The test container to run.

Runs a list or dictionary full of tests.

<hr/>
<h4 class="method-name"><img class="doc-image" alt="public" src="https://img.shields.io/badge/ -public-11b237.svg?style=flat-square" />  Testing:TestFor(<code>any module, Test test</code>)</h4>
**<span class="method-returns">Returns <code>void</code></span>**

- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `module`: The module to associate a test wtith.
- <img class="doc-image" alt="required" src="https://img.shields.io/badge/%20-required-ff9600.svg?style=flat-square" />  `test`: The test to associate with this module.

Associates a test as necessary to prove functionality of a module.


## Properties
[none]
