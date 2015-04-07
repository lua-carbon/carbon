# Using Carbide
Once you have a [Carbon application or library set up](Getting_Started) you can begin using the features that Carbide adds to Lua.

Carbide Lua is a direct superset of Lua, implementing features in 'levels' that add various functionality at the compiler level. Files that end in a `.clua` extension are Carbide Lua files.

## Features and Levels
The following levels and features are exposed by Carbide Lua:

- Level 1:
	- Bang methods for in-place operations (`object:Bang!()` translates to `object:BangInPlace()`)
	- Increment operator (`number++` translates to `number = number + 1`, properly handles sub-expressions)
	- Mutating operators (`number += 2` translates to `number = number + 2`, properly handles sub-expressions)
		- Supported operators: `+=`, `-=`, `*=`, `/=`, `^=`
	- Direct Arrow Notation (DAN) for array lookups (`print(vec2->x, vec2->y)` translates to `print(vec2[1], vec2[2])`)
		- Similar to GLSL's vector member lookups
		- Supports the following sets of lookups:
			- `(x, y, z, w)`
			- `(r, g, b, a)`
			- `(s, t, p, q)`
			- `(u, v)`
		- Lookups can be mixed (`print(vec2->x, vec2->r, vec2->y)` translates to `print(vec2[1], vec2[1], vec2[2])`)

## Directives
Carbide also exposes a set of directives to control the flow of compilation.

Directives can appear in any place in the file, they affect compilation globally.

- `#CARBIDE_FEATURE_LEVEL <level>`
	- Denotes that this file uses the given Carbide feature level
	- Default: `#CARBIDE_FEATURE_LEVEL 2`
- `#TEMPLATES_ENABLED`
	- Enables the templating engine for inline metaprogramming.
	- Templates can output Carbide Lua and it will be parsed correctly.
- `#TEMPLATE_LEVEL <level>`
	- Lets the templating engine know what level of templates to use.
	- Default: `#TEMPLATE_LEVEL 0`

## Using Carbide Features
Carbide's additions can be very helpful, especially when working with vectors:

```lua
local Carbon = (...)
local Vector2 = Carbon.Math.Vector2

local vec2 = Vector2:New(0, 0)
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
```

## Using Templates
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