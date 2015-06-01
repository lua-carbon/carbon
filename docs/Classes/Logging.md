<link href="../../style.css" rel="stylesheet" type="text/css"/>
<h1 class="class-title">Logging</h1>
<span class="file-link">(in [./Carbon/Logging.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Logging.lua))</span><br/>

Provides logging facilities.


<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Logging.Message(<code><a href="Types#string">string</a> msg</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `msg`: The message to send.</li>
</ul>

Reports a message to the log.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Logging.MessageOnce(<code><a href="Types#string">string</a> msg</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `msg`: The message to send.</li>
</ul>

Reports a message to the log, once per message body.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Logging.Notice(<code><a href="Types#string">string</a> msg</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `msg`: The notice to send.</li>
</ul>

Reports a notice to the log if <code>ReportingLevel</code> &gt;= 2.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Logging.NoticeOnce(<code><a href="Types#string">string</a> msg</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `msg`: The notice to send.</li>
</ul>

Reports a notice to the log if <code>ReportingLevel</code> &gt;= 2, once per message body.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Logging.SetOutputHandle(<code>file handle</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `handle`: The file handle to use for logging.t</li>
</ul>

Sets a new handle for outputting logs with.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Logging.Warn(<code><a href="Types#string">string</a> msg</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `msg`: The warning to send.</li>
</ul>

Reports a warning to the log if <code>ReportingLevel</code> &gt;= 1.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Logging.Warn(<code><a href="Types#string">string</a> msg</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `msg`: The error to send.</li>
</ul>

Reports an error to the log and throws an error.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Logging.WarnOnce(<code><a href="Types#string">string</a> msg</code>)</h4>
<p class="method-returns bold">Returns <code></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `msg`: The warning to send.</li>
</ul>

Reports a warning to the log if <code>ReportingLevel</code> &gt;= 1, once per message body.

<hr />
## Properties
#### <span class="doc-visibility doc-public">public</span> <code><a href="Types#unumber">unumber</a></code> ReportingLevel
The level of messages to report. Messages are always outputted.

- 0 - Errors only
- 1 - Errors and warnings
- 2 - Errors, warnings, and notices