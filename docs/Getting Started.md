<link rel="stylesheet" href="../style.css" type="text/css" />
# Getting Started with Carbon
Carbon is easy to set up, both as a component in a regular Lua project, or as a [Graphene][graphene] submodule. The latter form is recommended for new projects using Carbon.

## Plain Lua Module
Stick the `Carbon` folder anywhere and call `require` on it:

```lua
local Carbon = require("Carbon")

print("Running Carbon Version", Carbon.VersionString)
```

*Note: You'll need `./?/init.lua` in your Lua require path. Most installations will have this.*

## Graphene Submodule (Application)
If writing an application instead of a library, and you'd like to use Graphene's pathing options, there are a couple extra steps, but you'll get several extra features:
- Graphene-driven namespacing
- Carbide Lua support
- Automatic pathing and multiple Lua support.

First off, install [Graphene][graphene] into the root of your project. You can either pull the latest 1.x version from the [Graphene repository][graphene], or simply move and rename `Carbon/init.lua`. It's recommended to call the file `graphene.lua`.

From there, in the file that gets executed first in your project, like `main.lua` in LÖVE, use the following code:

```lua
-- Initialize Graphene
local MyGame = require("graphene")

-- Let Graphene know that 'Carbon' is a standalone library
MyGame:AddGrapheneSubmodule("Carbon")

-- You can now reference Carbon as MyGame.Carbon!
local Carbon = MyGame.Carbon
print("Running Carbon Version", Carbon.VersionString)
```

## Graphene Submodule (Library)
If writing a library using Graphene, integrating Carbon is straightforward, just like an application.

Make sure your [Graphene][graphene]-enabled library is using a version at least as new as the one Carbon uses, or just take Carbon's `init.lua` and use it in your library directly.

In your library's root `_.lua` file, which initializes the module, use the following snippet:

```lua
local MyLibrary = (...)

-- Let Graphene know that 'Carbon' is a standalone library
MyLibrary:AddGrapheneSubmodule("Carbon")

-- You can now reference Carbon as MyLibrary.Carbon!
local Carbon = MyLibrary.Carbon
print("Running Carbon Version", Carbon.VersionString)
```

## Hoisting and Merging Library's Carbon Dependencies
When using multiple libraries that depend on Carbon, you might end up with several copies of it in your working directory. You can avoid this using Graphene's `Alias` mechanism.

If you have two libraries, named `A` and `B` that both embed Carbon as `A.Carbon` and `B.Carbon`, you can move one of their Carbon installations to the root and add a Graphene alias in a couple of different ways.

*Note: This requires your code to have a root-level Graphene installation of its own, so follow the above section on setting that up if need be.*

In your initialization file (`_.lua` for libraries, `main.lua` for applications):

```lua
-- Change MyThing to the name of your application or library namespace; see above

-- We have a Carbon install in the root of our codebase!
local Carbon = MyThing.Carbon

-- Add aliases for both libraries
MyThing:AddGrapheneAlias("A.Carbon", Carbon)
MyThing:AddGrapheneAlias("B.Carbon", Carbon)

-- Now, both of these libraries will use the same Carbon installation.
print(MyThing.A)
print(MyThing.B)
```

[graphene]: https://github.com/lua-carbon/graphene