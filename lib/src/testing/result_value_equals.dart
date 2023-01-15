import 'package:matcher/matcher.dart';

import '../type/ok.dart';

ResultValueEquals<T> isResultValueEquals<T>(T value) => ResultValueEquals<T>(value);

class ResultValueEquals<T> extends Matcher {
  final T value;

  ResultValueEquals(this.value);

  @override
  Description describe(Description description) => description.addDescriptionOf(Ok(value));

  @override
  bool matches(item, Map matchState) {
    if (item is! Ok<T>) {
      return false;
    }
    return item.value == value;
  }

  @override
  Description describeMismatch(item, Description mismatchDescription, Map matchState, bool verbose) {
    if (item is! Ok) {
      return mismatchDescription.add("is not a success result");
    } else {
      return mismatchDescription.add("is a success result, but `${item.value}` is not equal to `$value`");
    }
  }
}
