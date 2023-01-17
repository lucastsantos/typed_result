import 'package:matcher/matcher.dart';

import '../type/err.dart';

class HasResultError extends CustomMatcher {
  HasResultError(matcher) : super("Has a failure result with a error that is", "error", matcher);
  featureValueOf(actual) => (actual as Err).error;
}
