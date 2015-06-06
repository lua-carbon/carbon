<h1 class="class-title">Nanotube</h1>
<span class="file-link">(in [./Carbon/Nanotube.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/Nanotube.lua))</span><br/>

Funnels events and provides an event loop.


<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Nanotube:New()</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Nanotube">Nanotube</a></code></p><h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> Nanotube:PlacementNew(<code><a href="Classes/Nanotube">Nanotube</a>? out</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Classes/Nanotube">Nanotube</a></code></p>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Nanotube:Init()</h4>
<p class="method-returns bold">Returns <code><a href="Types#void">void</a></code></p>
<ul class="doc-arg-list">

</ul>

Creates or initializes a <a href="Classes/Nanotube">Nanotube</a> object.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Nanotube:Fire(<code><a href="Types#string">string</a> name, ...</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#unumber">unumber</a></code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `name`: The name of the event to fire.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `...`: The arguments to pass to handlers for this event.</li>
</ul>

Fires an event by name and passes parameters to the handlers registered to it.

Returns the number of handlers that were triggered by this event.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Nanotube:On(<code><a href="Types#string">string</a> name, <a href="Types#function">function</a> method, [<a href="Types#number">number</a> priority]</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `name`: The name of the event to hook to.</li>
<li><span class="doc-arg-level doc-required">required</span>  `method`: The <a href="Types#function">function</a> to call when the event fires.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `priority`: The priority for this function call.</li>
</ul>

Hook up to an event with a method. An alias to <code>Hook</code>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Nanotube:Once(<code><a href="Types#string">string</a> name, <a href="Types#function">function</a> method, [<a href="Types#number">number</a> priority]</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `name`: The name of the event to hook to.</li>
<li><span class="doc-arg-level doc-required">required</span>  `method`: The <a href="Types#function">function</a> to call when the event fires.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `priority`: The priority for this function call.</li>
</ul>

Hook up to an event with a method called only once.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Nanotube:After(<code><a href="Types#unumber">unumber</a> seconds, <a href="Types#function">function</a> method</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `seconds`: The seconds to wait before firing the method.</li>
<li><span class="doc-arg-level doc-required">required</span>  `method`: The method to call.</li>
</ul>

Call the method once after a number of seconds have elapsed.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Nanotube:At(<code><a href="Types#unumber">unumber</a> time, <a href="Types#function">function</a> method</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `time`: The time to fire the method at.</li>
<li><span class="doc-arg-level doc-required">required</span>  `method`: The method to call.</li>
</ul>

Call the method once at an exact time relative to the application timer.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Nanotube:Every(<code><a href="Types#unumber">unumber</a> period, <a href="Types#function">function</a> method</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `period`: How many seconds should elapse between callings of the method.</li>
<li><span class="doc-arg-level doc-required">required</span>  `method`: The method to call.</li>
</ul>

Call the method every time a number of seconds have elapsed.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Nanotube:Hook(<code><a href="Types#string">string</a> name, <a href="Types#function">function</a> method, [<a href="Types#number">number</a> priority]</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `name`: The name of the event to hook to.</li>
<li><span class="doc-arg-level doc-required">required</span>  `method`: The <a href="Types#function">function</a> to call when the event fires.</li>
<li><span class="doc-arg-level doc-optional">optional</span>  `priority`: The priority for this function call.</li>
</ul>

Generic hook method used by <code>Once</code> and <code>On</code>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Nanotube:Loop()</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">

</ul>

Starts an event loop that automatically calls events.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Nanotube:Mirror(<code><a href="Types#string">string</a> name, <a href="Classes/Nanotube">Nanotube</a> tube</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `name`: The event to mirror.</li>
<li><span class="doc-arg-level doc-required">required</span>  `tube`: The <a href="Classes/Nanotube">Nanotube</a> to mirror the event to.</li>
</ul>

Mirrors an event onto another Nanotube so that it will be executed there as well as here.

For mirroring all events, use <code>MirrorAll</code>.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Nanotube:MirrorAll(<code><a href="Classes/Nanotube">Nanotube</a> tube</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `tube`: The <a href="Classes/Nanotube">Nanotube</a> to mirror events to.</li>
</ul>

Mirrors all events onto another Nanotube so that they will be executed there as well as here.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Nanotube:Step(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `...`: Arguments to pass to the "Step" event</li>
</ul>

Step the loop forward a single iteration and calls any outstanding events.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-object">object</span> <span class="doc-visibility doc-public">public</span> Nanotube:Stop()</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">

</ul>

Break out of a loop started by Nanotube:Loop()

<hr />
## Properties
#### <span class="doc-visibility doc-public">public</span> <code><a href="Classes/Nanotube">Nanotube</a></code> Nanotube.Global
A global Nanotube instance for use as a singleton.
<hr/>
#### <span class="doc-visibility doc-public">public</span> <code><a href="Types#bool">bool</a></code> Nanotube.StepPeriod
How long this instance should sleep between steps, in seconds. Only used if `UseSleep` is enabled.
<hr/>
#### <span class="doc-visibility doc-public">public</span> <code><a href="Types#bool">bool</a></code> Nanotube.UseSleep
Whether this instance should use Time.Sleep to prevent overutilization of the CPU.