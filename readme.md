![Carbon for Lua][carbon_banner]

![shield_license]
![shield_build]
![shield_tests]

![shield_release_version]
![shield_prerelease_version]
![shield_dev_version]

Carbon is a full suite intended to make Lua more semantic, expressive, and powerful. It aims to provide a set of functionality comparable to .NET, and runs on Lua 5.1 and LuaJIT on any platform. Carbon will take advantage of a few extras if it finds that they're installed, like LuaJIT's FFI, LuaSocket, and LÖVE.

Carbon uses a custom cross-platform loader and namespacing provider, [Graphene][graphene] along with a large set of semantic utility libraries providing object orientation, strong typing facilities, data structure utilities, asynchronous events and I/O, testing, profiling, and math utilities.

You can see Carbon's documentation at [http://carbon.lpghatguy.com](http://carbon.lpghatguy.com), which works much better than GitHub's in-tree markdown viewer.

See [changes.md](changes.md) for the release and change history of Carbon.

[graphene]: https://github.com/lua-carbon/graphene
[carbon_banner]: https://raw.githubusercontent.com/lua-carbon/carbon/master/assets/carbon-banner.png
[carbon_icon]: https://raw.githubusercontent.com/lua-carbon/carbon/master/assets/carbon-icon.png

[shield_license]: https://img.shields.io/badge/license-zlib/libpng-333333.svg?style=flat-square
[shield_build]: https://img.shields.io/badge/build-passing-brightgreen.svg?style=flat-square
[shield_tests]: https://img.shields.io/badge/tests-72/72-brightgreen.svg?style=flat-square
[shield_release_version]: https://img.shields.io/badge/release-1.1.2-brightgreen.svg?style=flat-square
[shield_prerelease_version]: https://img.shields.io/badge/prerelease-none-lightgrey.svg?style=flat-square
[shield_dev_version]: https://img.shields.io/badge/development-1.2.0/2.0.0-orange.svg?style=flat-square