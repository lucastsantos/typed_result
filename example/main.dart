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

void main() {
  "Creating instances of Result".log();
  var ok = getDate(false);
  ok.log();
  "ok.isSuccess: ${ok.isSuccess}".log();
  "ok.isFailure: ${ok.isFailure}".log();
  var err = getDate(true);
  err.log();
  "err.isSuccess: ${err.isSuccess}".log();
  "err.isFailure: ${err.isFailure}".log();

  "\n`get`".log();
  getDate(false).get().log();
  getDate(true).get().log();

  "\n`getOr`".log();
  getDate(false).getOr(() => DateTime(2000)).log();
  getDate(true).getOr(() => DateTime(2000)).log();

  "\n`getOrThrow`".log();
  getDate(false).getOrThrow().log();
  try {
    getDate(true).getOrThrow().log();
  } catch (e) {
    "Exception was thrown because it was a failure result".log();
  }

  "\n`getError`".log();
  getDate(false).getError().log();
  getDate(true).getError().log();

  "\n`getErrorOr`".log();
  getDate(false).getErrorOr(() => ChildDateException()).log();
  getDate(true).getErrorOr(() => ChildDateException()).log();

  "\n`getErrorOrThrow`".log();
  try {
    getDate(false).getErrorOrThrow().log();
  } catch (e) {
    "Exception was thrown because it was a success result".log();
  }
  getDate(true).getErrorOrThrow().log();

  "\n`map`".log();
  getDate(false).map((_) => "Mapping success").log();
  getDate(true)
      .map((_) => "Nothing happens; still an instance of DateException")
      .log();

  "\n`mapError`".log();
  getDate(false)
      .mapError((_) => "Nothing happens; still an instance of DateTime")
      .log();
  getDate(true).mapError((_) => "Mapping error").log();

  "\n`mapBoth`".log();
  getDate(false)
      .mapBoth(
        success: (_) => "Mapping success with failure alternative",
        failure: (_) => "Nothing happens",
      )
      .log();
  getDate(true)
      .mapBoth(
        success: (_) => "Nothing happens",
        failure: (_) => "Mapping failure with success alternative",
      )
      .log();

  "\n`on`".log();
  getDate(false)
      .onSuccess((_) => "On Success".log())
      .onFailure((_) => "Nothing happens".log());
  getDate(true)
      .onSuccess((_) => "Nothing happens".log())
      .onFailure((_) => "On Failure".log());

  "\n`when`".log();
  getDate(false).when(
    success: (_) => "When [success]".log(),
    failure: (_) => "Nothing happens".log(),
  );
  getDate(true).when(
    success: (_) => "Nothing happens".log(),
    failure: (_) => "When [failure]".log(),
  );

  "\n`runCatching`".log();
  runCatching(() => DateTime.now()).log();
  runCatching(() => throw DateException()).log();

  "\n`toResult`".log();
  DateTime.now().toResultOr(() => DateException()).log();
  null.toResultOr(() => DateException()).log();
}

/// Extension just to avoid the relevant code to be presented inside a parenthesis
extension Print on Object? {
  void log() {
    print(this);
  }
}
