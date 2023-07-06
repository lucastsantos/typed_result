// ignore_for_file: avoid_print

import 'package:typed_result/typed_result.dart';

class DateException implements Exception {}

class ChildDateException implements DateException {}

/// This method is a simulation of a real repository call,
/// which is most likely to have a custom class representing the expected failures.
/// In this example, the method proceeds normally with an Ok with the current date if [forceFailure] is false.
/// If [forceFailure] is true, then it returns an Err with a custom exception class.
Result<DateTime, DateException> getDate(bool forceFailure) {
  var now = DateTime.now();
  if (!forceFailure) {
    return Ok(now);
  } else {
    return Err(DateException());
  }
}

var ok = getDate(false);
var err = getDate(true);

/// Sample for showing what attributes a Result instance has.
void instances() {
  print("\nInspecting instances of Result");
  print(ok);
  print("ok.isSuccess: ${ok.isSuccess}");
  print("ok.isFailure: ${ok.isFailure}");

  print(err);
  print("err.isSuccess: ${err.isSuccess}");
  print("err.isFailure: ${err.isFailure}");
}

/// Sample for showing how to get the values from a Result.
void getters() {
  print("\n`get`");
  print(ok.get());
  print(err.get());

  print("\n`getOr`");
  print(ok.getOr(() => DateTime(2000)));
  print(err.getOr(() => DateTime(2000)));

  print("\n`getOrThrow`");
  print(ok.getOrThrow());
  try {
    err.getOrThrow();
  } catch (e) {
    print("Exception was thrown because it was a failure result");
  }

  print("\n`getError`");
  print(ok.getError());
  print(err.getError());

  print("\n`getErrorOr`");
  print(ok.getErrorOr(() => ChildDateException()));
  print(err.getErrorOr(() => ChildDateException()));

  print("\n`getErrorOrThrow`");
  try {
    ok.getErrorOrThrow();
  } catch (e) {
    print("Exception was thrown because it was a success result");
  }
  print(err.getErrorOrThrow());
}

/// Sample for showing how to transforming the current Result value into a new Result.
void map() {
  print("\n`map`");
  print(ok.map((value) => "Mapping success at $value"));
  print(err.map(noop));

  print("\n`mapError`");
  print(ok.mapError(noop));
  print(err.mapError((_) => "Mapping error"));

  print("\n`mapBoth`");
  print(ok.mapBoth(
    success: (_) => "Mapping a success value",
    failure: noop,
  ));
  print(err.mapBoth(
    success: noop,
    failure: (_) => "Mapping a failure value",
  ));
}

/// Sample for showing how to invoke block based on the Result outcome.
void on() {
  print("\n`on`");
  ok
      .onSuccess((_) => print("onSuccess"))
      .onFailure(noop);
  err
      .onSuccess(noop)
      .onFailure((_) => print("onFailure"));
}

/// Sample for showing an alternative on how to invoke block based on the Result outcome.
void when() {
  print("\n`when`");
  ok.when(
    success: (_) => print("When [success]"),
    failure: noop,
  );
  err.when(
    success: noop,
    failure: (_) => print("When [failure]"),
  );
}

/// Sample for showing how safely call a method, transforming any exception into a Result error.
void catching() {
  print("\n`runCatching`");
  print(runCatching(() => DateTime.now()));
  print(runCatching(() => throw DateException()));
}

/// Sample for showing how to transform any object into a Result, based on it's nullability.
void toResult() {
  print("\n`toResult`");
  print(DateTime.now().toResultOr(() => DateException()));
  print(null.toResultOr(() => DateException()));
}

/// Sample for showing extensions for handling with Future
Future<void> future() async {
  print("\n`Futures`");
  final futureOk = Future.value(ok); // Future<Result<DateTime, DateException>>
  final futureErr = Future.value(err); // Future<Result<DateTime, DateException>>

  await futureOk.when(success: (value) => print("Future(ok).when(success): $value"), failure: noop);
  await futureErr.when(success: noop, failure: (error) => print("Future(err).when(failure): $error"));

  await futureOk.onSuccess((value) => print("Future(ok).onSuccess: $value"));
  await futureErr.onSuccess(noop);

  await futureOk.onFailure(print);
  await futureErr.onFailure((error) => print("Future(err).onFailure: $error"));
}

void main() async {
  instances();
  getters();
  map();
  on();
  when();
  catching();
  toResult();
  await future();
}

void noop(dynamic param) => print("A stub method that is never called; Used for demonstration purposes");