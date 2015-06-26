# Carbon Change Log

![1.2.0](https://img.shields.io/badge/1.2.0-latest-brightgreen.svg?style=flat-square)
- Update to Graphene 1.1.11, fixes several issues
- Added "cancel" and "die" return strings for Nanotube events
- Added `Carbon.Serialization` to provide object serialization
	- Implemented SimpleJSON serializer for the time being
- Added `Carbon.None` for specifying "none" but not "nil"
- Added `Carbon.Maybe` for specifying a state between "true" and "false".
- Added `Carbide.Parse` as a general parsing interface
- Added `BaseClass:GetAttribute` and `BaseClass:GetMember` for querying fields in classes
- Added `ExperimentalFeatures` attribute
- Moved Carbide out into Callisto, with a wrapper API to preserve compatibility
	- Improved parsing rigidity and output formatting
	- Added QUE methods (`method?()`)
	- Added default arguments (`method(x=5)`)
	- Deprecated LOUD_DIRECTIVES, use PascalDirectives instead (see documentation)
- Changed `Carbon.Enable` and `Carbon.Disable` to accept multiple features
- Deprecated `Carbon.Serializable` in favor of the `Serialization` module
- Fixed return value of `Nanotube:Fire`
- Fixed OOP breaking when `RemoveDeprecated` is enabled

![1.1.2](https://img.shields.io/badge/1.1.2-unsupported-red.svg?style=flat-square)
- Update to Graphene 1.1.9, multiple fixes
- Fixed documentation format to use `extra_css`
- Fixed OOP to run even with `RemoveDeprecated` enabled
- Fixed `InstancedMetatable` attribute
- Fixed `InstanceIndirection` attribute

![1.1.1](https://img.shields.io/badge/1.1.1-unsupported-red.svg?style=flat-square)
- Added `Object.Class` and `Class.ClassPointer` for referencing classes
- Deprecated `Object.class` and `Class.__class_reference`

![1.1.0](https://img.shields.io/badge/1.1.0-unsupported-red.svg?style=flat-square)
- Update to Graphene 1.1.7, fixes Lua 5.1 and LOVE compatibility
- Improved Carbide parsing rigidity.
- Improved overall math performance.
- Attribute identifiers now do not have to be strings.
- Added `Carbon.Deprecated` to handle deprecated things.
- Added `#CARBIDE_EXTENSIONS` directive to enable optional extensions.
- Added `Logging` module for advanced logging.
- Added `Bench` class for benchmarking.
- Added `Exception:ThrowIf` as a `Carbon.Assert` replacement.
- Added fat-arrow lambda syntax (`=>`)
- Added custom allocators in the form of the `Allocator` attribute.
- Added new Quaternion methods:
	- `Quaternion:LooseConjugate`
	- `Quaternion:LooseMultiplyLooseLoose`
	- `Quaternion:TransformVector`
	- `Quaternion:MultiplyLoose!`
- Deprecated `Functional.Unpack`; use `Carbon.Unpack` instead.
- Deprecated `Object.self` for indirected instances.
- Deprecated `Operators` now that lambdas are within reach.
- Deprecated `Carbon.Error` and `Carbon.Assert`:
	- Use `Exception:Throw` and `Exception:ThrowIf` instead with exceptions.
	- Use `error` and `assert` for other objects.
- Fixed several OOP issues relating to copying.
- Fixed `Carbon.IsObject` failing to detect `Is` object.
- Fixed attributes applying when they aren't inherited.
- Fixed Matrix3x3 quaternion methods.
- Fixed `Functional.Map` changing the original list.

![1.0.1](https://img.shields.io/badge/1.0.1-unsupported-red.svg?style=flat-square)
- Upgraded to Graphene 1.1.3, fixes several issues
- Added missing `Carbon.Unpack` method for faster unpacking
- Added alias to `Graphene.Support` as `Carbon.Support`
- Added `SyntaxErrorException` for Carbide
- Added the notion of 'features' for supporting edge features
	- Added `Carbon.Features`, `Carbon.Enable`, `Carbon.Disable`, and `Carbon.Enabled`
- Fixed `List:Clear` not returning self
- Fixed `Set:ToList`
- Improved Carbide to throw exceptions when faults occur
- Improved documentation on matrix methods
- Improved test coverage

![1.0.0](https://img.shields.io/badge/1.0.0-unsupported-red.svg?style=flat-square)
- Initial release