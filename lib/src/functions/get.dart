import '../type/err.dart';
import '../type/ok.dart';
import '../type/result.dart';

extension Get<T, E> on Result<T, E> {
  T? get() {
    var result = this;
    return result is Ok<T> ? result.value : null;
  }

  T getOr(T Function() provider) {
    var result = this;
    return result is Ok<T> ? result.value : provider();
  }

  E? getError() {
    var result = this;
    return result is Err<E> ? result.error : null;
  }

  E getErrorOr(E Function() provider) {
    var result = this;
    return result is Err<E> ? result.error : provider();
  }
}
