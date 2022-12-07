import '../type/err.dart';
import '../type/ok.dart';
import '../type/result.dart';

Result<T, Object> runCatching<T>(T Function() provider) {
  try {
    return Ok<T>(provider());
  } catch (e) {
    return Err<Object>(e);
  }
}
