import 'package:matcher/matcher.dart';

import '../type/err.dart';

ResultErrorEquals<E> isResultErrorEquals<E>(E error) => ResultErrorEquals<E>(error);

class ResultErrorEquals<E> extends Matcher {
  final E error;

  ResultErrorEquals(this.error);

  @override
  Description describe(Description description) => description.addDescriptionOf(Err(error));

  @override
  bool matches(item, Map matchState) {
    if (item is! Err<E>) {
      return false;
    }
    return item.error == error;
  }

  @override
  Description describeMismatch(item, Description mismatchDescription, Map matchState, bool verbose) {
    if (item is! Err) {
      return mismatchDescription.add("is not a failure result");
    } else {
      return mismatchDescription.add("is a failure result, but `${item.error}` is not equal to `$error`");
    }
  }
}