import '../type/err.dart';
import '../type/ok.dart';
import '../type/result.dart';

extension PartitionResult<T, E> on Iterable<Result<T, E>> {
  /// Partitions a collection of Results into two separate lists based on their types.
  ///
  /// This function iterates over the input collection of Results and categorizes them into two lists:
  /// one for successful results (Ok) containing values of type [V],
  /// and another for error results (Err) containing errors of type [E].
  /// It returns a Pair of these two lists.
  (List<T>, List<E>) partition() {
    List<T> values = [];
    List<E> errors = [];

    forEach((result) {
      if (result is Ok<T>) {
        values.add(result.value);
      } else if (result is Err<E>) {
        errors.add(result.error);
      }
    });

    return (values, errors);
  }
}
