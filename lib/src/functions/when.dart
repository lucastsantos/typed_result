import '../type/err.dart';
import '../type/ok.dart';
import '../type/result.dart';

extension WhenResult<T, E> on Result<T, E> {
  /// Invokes [success] or [failure] block
  /// depending if this result is a success or a failure.
  Result<T, E> when(
      {required void Function(T value) success,
      required void Function(E error) failure}) {
    var result = this;
    if (result is Ok<T>) {
      success(result.value);
    } else {
      failure((result as Err<E>).error);
    }
    return this;
  }
}
