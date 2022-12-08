typed_result provide a convenience Result monad to represent success and error.

A `Result<T, E>` class can be either a success (`Ok<T>` class) or an error (`Err<E>` class).
```dart
// Result<T, E>  --+-- Ok<T>
//                 |
//                 +-- Err<E>
```

## Features

This package aims to provide convenience methods for:
- Getting a value [(`get`, `getOr`, `getOrThrow`, `getError`, `getErrorOr` and `getErrorOrThrow`)][get]
- Mapping a Result value into another Result [(`map`, `mapError` and `mapBoth`)][map]
- Execute a block based on the result [(`onSuccess` and `onFailure`)][on]
- Wrap a block, transforming it's exception into error [(`runCatching`)][run-catching]
- Wrap any value to a result based on the nullability [(`toResultOr`)][to-result]

## Usage
An `Result<T, E>` can't be instantiated directly.
To create a `Result`, simply create an instance of `Ok<T>` or `Err<E>`.

```dart
var ok = Ok(1); // as Ok<int>
var error = Err(""); // as Err<String>
Result<int, String> result = Ok(1); // as Result<int, *>

// As a return of a function
Result<int, String> getData() {
  if(condition) {
    return Ok(1);
  } else {
    return Err("");
  }
}
```

## Additional information

This package is hugely based on a [Kotlin library made by Michael Bull](https://github.com/michaelbull/kotlin-result/).

The motivation for creating this package comes from using this library in Kotlin projects and missing these features in Dart.

[get]: https://github.com/lucastsantos/typed_result/blob/master/lib/src/functions/get.dart
[map]: https://github.com/lucastsantos/typed_result/blob/master/lib/src/functions/map.dart
[on]: https://github.com/lucastsantos/typed_result/blob/master/lib/src/functions/on.dart
[run-catching]: https://github.com/lucastsantos/typed_result/blob/master/lib/src/functions/run_catching.dart
[to-result]: https://github.com/lucastsantos/typed_result/blob/master/lib/src/functions/to_result.dart