import '../type/err.dart';
import '../type/ok.dart';
import '../type/result.dart';

extension On<T, E> on Result<T, E> {
  Result<T, E> onSuccess(void Function(T) block) {
    var result = this;
    if (result is Ok<T>) {
      block(result.value);
    }
    return this;
  }

  Result<T, E> onFailure(void Function(E) block) {
    var result = this;
    if (result is Err<E>) {
      block(result.error);
    }
    return this;
  }
}
