<link rel="stylesheet" href="../style.css" type="text/css" />
# Carbon for Lua

Carbon is a full suite intended to make Lua more semantic, expressive, and powerful. It aims to provide a set of functionality comparable to .NET, and runs on Lua 5.1 and above on any platform. Carbon will take advantage of a few extra if it finds that they're installed, like LuaJIT's FFI, LuaSocket, and LÖVE.

Carbon uses a custom cross-platform loader and namespacing provider, [Graphene][graphene] along with a large set of semantic utility libraries providing object orientation, strong typing facilities, data structure utilities, asynchronous events and I/O, testing, profiling, and math utilities.

[graphene]: https://github.com/lua-carbon/graphene