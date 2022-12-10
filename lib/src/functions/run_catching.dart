import '../type/err.dart';
import '../type/ok.dart';
import '../type/result.dart';

/// Executes the provided block, catching any exception if thrown.
/// If the block finishes normally, a [Ok] will be returned with the value returned.
/// Any exception thrown will create an [Err] of [Object] type.
Result<T, Object> runCatching<T>(T Function() block) {
  try {
    return Ok<T>(block());
  } catch (e) {
    return Err<Object>(e);
  }
}
