import '../type/err.dart';
import '../type/ok.dart';
import '../type/result.dart';

extension GetAllResult<T, E> on Iterable<Result<T, E>> {
  /// Retrieves all success values from a collection
  List<T> getAll() {
    return whereType<Ok<T>>().map((e) => e.value).toList(growable: false);
  }

  /// Retrieves all error values from a collection
  List<E> getAllErrors() {
    return whereType<Err<E>>().map((e) => e.error).toList(growable: false);
  }
}
