import 'package:matcher/matcher.dart';

import '../type/ok.dart';

class HasResultValue extends CustomMatcher {
  HasResultValue(matcher) : super("Has a success result with a value that is", "value", matcher);
  featureValueOf(actual) => (actual as Ok).value;
}
