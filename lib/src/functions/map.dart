import '../type/err.dart';
import '../type/ok.dart';
import '../type/result.dart';

extension MapResult<T, E> on Result<T, E> {
  /// Map a [Result]<T, E> to a [Result]<U, E>.
  Result<U, E> map<U>(U Function(T value) transform) {
    var result = this;
    if (result is Ok<T>) {
      return Ok<U>(transform(result.value));
    } else {
      return result as Err<E>;
    }
  }

  /// Map a [Result]<T, E> to a [Result]<T, F>.
  Result<T, F> mapError<F>(F Function(E error) transform) {
    var result = this;
    if (result is Err<E>) {
      return Err<F>(transform(result.error));
    } else {
      return result as Ok<T>;
    }
  }

  /// Map a [Result]<T, E> to a [Result]<U, F>.
  Result<U, F> mapBoth<U, F>(
      {required U Function(T value) success,
      required F Function(E error) failure}) {
    var result = this;
    if (result is Ok<T>) {
      return Ok<U>(success(result.value));
    } else {
      return Err<F>(failure((result as Err<E>).error));
    }
  }

  /// Transforms a success into an error if it satisfies the given [predicate],
  /// otherwise return this Result.
  Result<T, E> toErrorIf(
    bool Function(T value) predicate,
    E Function(T value) transform,
  ) {
    final result = this;
    if (result is Ok<T>) {
      if (predicate(result.value)) {
        return Err(transform(result.value));
      } else {
        return result;
      }
    } else {
      return result;
    }
  }
}
