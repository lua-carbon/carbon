<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Testing.TestResult</h1>
<span class="file-link">(in [./Carbon/Testing/TestResult.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Testing/TestResult.lua))</span><br/>

An object to signal success and failure conditions to the test engine.


<hr />
## Methods
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> TestResult:New(<code>Test test</code>)</h4>
<p class="method-returns bold">Returns <code>TestResult</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `test`: The test that will use this TestResult.</li>
</ul>

Creates a new TestResult object for unit tests to fill.
<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> TestResult:Assert(<code>bool condition, string message</code>)</h4>
<p class="method-returns bold">Returns <code>bool</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `condition`: Condition to check.</li>
<li><span class="doc-arg-level doc-required">required</span>  `message`: Message to report on failure.</li>
</ul>

Checks the given condition and adds a pass if it is true, or fails with the given message.
<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> TestResult:Fail(<code>string message</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `message`: The error message to store.</li>
</ul>

Marks the test as a failure and increments the failure counter.
<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> TestResult:Message(<code>string message</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `message`: A message to record.</li>
</ul>

Records a message about the test without failing the test.
<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> TestResult:Pass()</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">

</ul>

Marks that a component of the TestResult has passed.
<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> TestResult:Warn(<code>string message</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `message`: A warning to issue.</li>
</ul>

Issues a warning without failing the test.

<hr />
## Properties
[none]