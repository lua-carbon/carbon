<h1 class="class-title">Testing</h1>
<span class="file-link">(in [./Carbon/Testing/_.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Testing/_.lua))</span><br/>

Manages execution of tests for Carbon.


<hr />
## Methods
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> Testing:GetResults()</h4>
<p class="method-returns bold">Returns <code>table</code></p>
<ul class="doc-arg-list">

</ul>

Aggregates and returns the overall results for the tests that have been run.
<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> Testing:Prerequisite(<code>Test test</code>)</h4>
<p class="method-returns bold">Returns <code>void</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `test`: The test to mark.</li>
</ul>

Marks that a given test is a prerequisite of this test.
Should only be used within tests.
<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> Testing:Requires(<code>any module</code>)</h4>
<p class="method-returns bold">Returns <code>void</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `module`: The module to test before this one.</li>
</ul>

Denotes that this module will not test correcly if another module failed any tests.
<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> Testing:RunAllTests()</h4>
<p class="method-returns bold">Returns <code>void</code></p>
<ul class="doc-arg-list">

</ul>

Runs all the tests.
<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> Testing:RunTest(<code>Test test</code>)</h4>
<p class="method-returns bold">Returns <code>void</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `test`: The test to run.</li>
</ul>

Runs a test if it has not been run already.
<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> Testing:RunTestList(<code>table test</code>)</h4>
<p class="method-returns bold">Returns <code>void</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `test`: The test container to run.</li>
</ul>

Runs a list or dictionary full of tests.
<hr/>
<h4 class="method-name"><span class="doc-unknown">unknown</span> <span class="doc-visibility doc-public">public</span> Testing:TestFor(<code>any module, Test test</code>)</h4>
<p class="method-returns bold">Returns <code>void</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `module`: The module to associate a test wtith.</li>
<li><span class="doc-arg-level doc-required">required</span>  `test`: The test to associate with this module.</li>
</ul>

Associates a test as necessary to prove functionality of a module.

<hr />
## Properties
[none]