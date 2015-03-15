# Exceptions.CodeGenerationException
An exception to be generated when generation of code fails.

**Inherits [Exception](Classes/Exception)**

## Methods
#### CodeGenerationException CodeGenerationException:New(string message, string code)
- message: A message explaining why code generation failed.
- code: The code that was generated.

Denotes that code generation failed in a metaprogramming-enabled module.


## Properties
#### string CodeGenerationException.Message
Contains a message about what went wrong generating code.


#### string CodeGenerationException.GeneratedCode
Contains the code that was generated and failed to meet the criteria.



