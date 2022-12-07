import '../type/err.dart';
import '../type/ok.dart';
import '../type/result.dart';

extension On<T, E> on Result<T, E> {
  Result<T, E> onSuccess(void Function(T) callback) {
    var result = this;
    if (result is Ok<T>) {
      callback(result.value);
    }
    return this;
  }

  Result<T, E> onFailure(void Function(E) callback) {
    var result = this;
    if (result is Err<E>) {
      callback(result.error);
    }
    return this;
  }
}