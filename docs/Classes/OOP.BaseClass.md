<h1 class="class-title">OOP.BaseClass</h1>
<span class="file-link">(in [./Carbon/OOP.lua](https://github.com/lua-carbon/carbon/tree/master/./Carbon/OOP.lua))</span><br/>

Body for both <a href="Classes/OOP.Class">OOP.Class</a> and <a href="Classes/OOP.StaticClass">OOP.StaticClass</a> base classes.


<hr />
## Methods
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> BaseClass:Attributes(<code><a href="Types#dictionary">dictionary</a> attributes</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `attributes`: The attributes to give to the object.</li>
</ul>

Adds attributes to the class. Overwrites existing attributes.
The attributes parameter is only shallow copied, keep this in mind.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> BaseClass:GetAttribute(<code><a href="Types#any">any</a> attribute</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#any">any</a>?</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `attribute`: The attribute identifier to look up.</li>
</ul>

Returns the value of the given attribute for this class.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> BaseClass:GetMember(<code><a href="Types#any">any</a> key</code>)</h4>
<p class="method-returns bold">Returns <code><a href="Types#any">any</a>?</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `key`: The key of the member to get.</li>
</ul>

Returns a defined member in the class, if it is set.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> BaseClass:Inherits(<code>...</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">

</ul>

Inherits from classes, taking on their inheritable attributes, members, metatables, and type information.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> BaseClass:Members(<code><a href="Types#dictionary">dictionary</a> members</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `members`: The member to give to instances of this class.</li>
</ul>

Adds members to the class. Overwrites existing member entries.
The members parameter is only shallow copied, keep this in mind.
<hr/>
<h4 class="method-name"><span class="doc-scope doc-class">class</span> <span class="doc-visibility doc-public">public</span> BaseClass:Metatable(<code><a href="Types#dictionary">dictionary</a> metatable</code>)</h4>
<p class="method-returns bold">Returns <code>self</code></p>
<ul class="doc-arg-list">
<li><span class="doc-arg-level doc-required">required</span>  `metatable`: The metatable to give to instances of this class.</li>
</ul>

Adds metatables to the class. Overwrites existing metatable entries.
The metatable parameter is only shallow copied, keep this in mind.

<hr />
## Properties
#### <span class="doc-visibility doc-public">public</span> <code>set</code> Is
The typecheck object for this class.
<hr/>
#### <span class="doc-visibility doc-private">private</span> <code>dictionary</code> __attributes
Holds class attributes.
<hr/>
#### <span class="doc-visibility doc-private">private</span> <code>dictionary</code> __base_members
Holds base class members so they can be overridden effectively.
<hr/>
#### <span class="doc-visibility doc-private">private</span> <code>dictionary</code> __members
Holds user-defined class members.
<hr/>
#### <span class="doc-visibility doc-private">private</span> <code>dictionary</code> __metatable
Holds metatable to be applied to instances.