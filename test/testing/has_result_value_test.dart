import 'package:test/test.dart';
import 'package:typed_result/typed_result.dart';

void main() {
  group('HasResultValue', () {
    test('should succeed when matching with a success result', () {
      expect(const Ok(1), HasResultValue(isA<int>()));
      expect(const Ok(1), HasResultValue(equals(1)));
      expect(const Ok(1), HasResultValue((e) => e + 1 == 2));
      expect(const Ok("abc"),
          HasResultValue(allOf(equals("abc"), contains("a"), isNotEmpty)));
    });

    test('should fail when matching with a failure result', () {
      try {
        expect(const Err(1), HasResultValue(equals(1)));
        fail("It was expected to fail");
      } catch (e) {
        if (e is! TestFailure) {
          rethrow;
        } else {
          expect(e.message,
              contains("is not a subtype of type \\\'Ok<dynamic>\\\'"));
        }
      }
    });

    test('should fail when actual object is not a result', () {
      try {
        expect(1, HasResultValue(equals(1)));
        fail("It was expected to fail");
      } catch (e) {
        if (e is! TestFailure) {
          rethrow;
        } else {
          expect(e.message,
              contains("is not a subtype of type \\\'Ok<dynamic>\\\'"));
        }
      }
    });
  });
}
