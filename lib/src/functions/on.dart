import '../type/err.dart';
import '../type/ok.dart';
import '../type/result.dart';

extension OnResult<T, E> on Result<T, E> {
  /// Invokes [block] only if this is a success.
  Result<T, E> onSuccess(void Function(T value) block) {
    var result = this;
    if (result is Ok<T>) {
      block(result.value);
    }
    return this;
  }

  /// Invokes [block] only if this is a failure.
  Result<T, E> onFailure(void Function(E error) block) {
    var result = this;
    if (result is Err<E>) {
      block(result.error);
    }
    return this;
  }
}
