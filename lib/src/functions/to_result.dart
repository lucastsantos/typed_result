import '../type/err.dart';
import '../type/ok.dart';
import '../type/result.dart';

extension ObjectToResult<T> on T? {
  /// Creates a [Result]<T, E> based on the nullability of the current object.
  /// If current object is not null, then creates an [Ok]<T> with it.
  /// If not, then creates an [Err]<E> using [provider] callback.
  Result<T, E> toResultOr<E>(E Function() provider) {
    var object = this;
    if (object is T) {
      return Ok<T>(object);
    } else {
      return Err<E>(provider());
    }
  }
}
