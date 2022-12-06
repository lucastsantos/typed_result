import '../type/err.dart';
import '../type/ok.dart';
import '../type/result.dart';

extension Map<T, E> on Result<T, E> {
  /// Map a [Result]<T, E> to a [Result]<U, E>
  Result<U, E> map<U>(U Function(T) transform) {
    var result = this;
    if(result is Ok<T>) {
      return Ok<U>(transform(result.value));
    } else {
      return result as Err<E>;
    }
  }

  /// Map a [Result]<T, E> to a [Result]<T, F>
  Result<T, F> mapError<F>(F Function(E) transform) {
    var result = this;
    if(result is Err<E>) {
      return Err<F>(transform(result.error));
    } else {
      return result as Ok<T>;
    }
  }
}