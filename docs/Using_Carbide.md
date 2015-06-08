# Using Carbide
Once you have a [Carbon application or library set up](Getting_Started) you can begin using the features that Callisto and Carbide add to Lua.

Carbide is an extension to Callisto, a superset of Lua. Callisto and Carbide Lua files have a `.clua` extension.

## Features and Extensions
The following features are exposed by Callisto and Carbide:
- Bang methods for in-place operations
	- `object:Bang!()` translates to `object:BangInPlace()`
- Increment operator (deprecated in 1.2.0)
	- `number++` translates to `number = number + 1`
- Mutating operators
	- `number += 2` translates to `number = number + 2`
	- Supported operators: `+=`, `-=`, `*=`, `/=`, `^=`
- Compound array lookups
	- `print(vec2->x, vec2->y)` translates to `print(vec2[1], vec2[2])`
	- Similar to GLSL's vector member lookups
	- Supports the following sets of lookups:
		- `(x, y, z, w)`
		- `(r, g, b, a)`
		- `(s, t, p, q)` (deprecated in 1.2.0)
		- `(u, v)` (deprecated in 1.2.0)
	- Lookups can be mixed
		- `print(vec2->x, vec2->r, vec2->y)` translates to `print(vec2[1], vec2[1], vec2[2])`
	- Lookups can be chained
		- `print(vec3->xyz)` is the same as `print(vec3->x, vec3->y, vec3->z)`
	- Lookups can **swizzle** 
		- `print(color3->gbr` is a fast way to switch around a color
- Fat-arrow lambdas (added in 1.1)
	- `(x) => x^2` translates to `function(x) return x^2 end`
	- Parentheses are required for both definitions and calls
- Default function arguments (added in 1.2)
	- `function(x=5) end` translates to
		- `function(x) x = (x ~= nil) and x or 5 end`

## Directives
Callisto also exposes a set of directives to control the flow of compilation.

Directives can appear in any place in the file, they affect compilation globally.

### Callisto Directives
- `#CALLISTO_EXTENSIONS <extension>, <extension>, ...` (added in 1.2.0)
	- Enables Callisto extensions, replaced `CARBIDE_EXTENSIONS` in 1.2.0

### Carbide Directives
- `#TEMPLATES_ENABLED`
	- Enables the templating engine for inline metaprogramming.
	- Templates can output Carbide Lua and it will be parsed correctly.
- `#TEMPLATE_LEVEL <level>`
	- Lets the templating engine know what level of templates to use.
	- Default: `#TEMPLATE_LEVEL 0`
- `#CARBIDE_EXTENSIONS <extension>, <extension>, ...` (deprecated in 1.2.0)
	- Enables Carbide extensions with given names.
- `#COMPILE_TO <target>`
	- Ouputs the source to a given target.
		- `stdout` writes out using `print`.
		- Other values write out to files.
- `#CARBIDE_FEATURE_LEVEL <level>` (deprecated, does nothing 1.2.0+)
	- Denotes that this file uses the given Carbide feature level
	- Default: `#CARBIDE_FEATURE_LEVEL 2`

## Using Callisto Features
Callisto's additions can be very helpful, especially when working with vectors:

```lua
local Carbon = (...)
local Vector2 = Carbon.Math.Vector2
local Vector3 = Carbon.Math.Vector3

local vec2 = Vector2(0, 0)
print(vec2) --> (0, 0)

-- Increment the x component
vec2->x++

-- Add 2 to the y component
vec2->y += 2

print(vec2) --> (1, 2)

-- Normalize the vector in-place using bang notation
vec2:Normalize!()

print(vec2) --> (0.447214, 0.894427)

-- Reinitialize the vector with zero values
vec2:Init(0, 0)
print(vec2) --> (0, 0)

print(vec2->x, vec2->y) -- 0	0
print(vec2->u, vec2->v) -- 0	0

-- Reverse the vector in-place
vec2:Init(vec2->yx)

-- Initialize a Vector3 with a Vector2 and an extra value
local vec3 = Vector3(vec2->xy, 3)

-- Collapse this Vector3's Y/Z down into a Vector2
vec2:Init(vec3->yz)
```

## Using Templates (Carbide only)
Carbide Lua files using the template features can use inline templates to enable metaprogramming within the metaprogramming. This can be humorously referred to as `(meta-)+programming`.

For example:

```lua
--#TEMPLATES_ENABLED
--#TEMPLATE_LEVEL 1

{!%
	print("This is run at compile time!")

	_(__engine:Render([[
		{%
			print("This is run in a compile-time template at compile time!")

			_([=[
				print("This is run at run time!")
			]=])
		%}
	]]))
%!}
```

When compiled, the code will output:
```html
This is run at compile time!
This is run in a compile-time template at compile time!
```

When run, the code will output:
```html
This is run at run time!
```