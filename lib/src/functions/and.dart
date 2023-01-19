import '../type/err.dart';
import '../type/ok.dart';
import '../type/result.dart';

extension AndResult<T, E> on Result<T, E> {
  /// Returns the provided [result] if current result is success.
  /// Otherwise, return the current failure.
  Result<T, E> and(Result<T, E> result) {
    return this is Ok<T> ? result : this;
  }

  /// Maps current Result<T, E> into a new Result<U, E> provided by
  /// [transform] block if current result is success.
  /// Otherwise, return the current failure result.
  ///
  /// The key difference from `map` is that this method requires [transform] to
  /// provide a Result instead of a direct value.
  /// This makes [andThen] appropriate for cases where your [transform] block can fail.
  Result<U, E> andThen<U>(Result<U, E> Function(T) transform) {
    final result = this;
    return result is Ok<T> ? transform(result.value) : result as Err<E>;
  }
}
