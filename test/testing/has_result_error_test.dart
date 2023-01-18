import 'package:test/test.dart';
import 'package:typed_result/typed_result.dart';

void main() {
  group('HasResultError', () {
    test('should succeed when matching with a failure result', () {
      expect(const Err(1), HasResultError(isA<int>()));
      expect(const Err(1), HasResultError(equals(1)));
      expect(const Err(1), HasResultError((e) => e + 1 == 2));
      expect(const Err("abc"),
          HasResultError(allOf(equals("abc"), contains("a"), isNotEmpty)));
    });

    test('should fail when matching with a success result', () {
      try {
        expect(const Ok(1), HasResultError(equals(1)));
        fail("It was expected to fail");
      } catch (e) {
        if (e is! TestFailure) {
          rethrow;
        } else {
          expect(e.message,
              contains("is not a subtype of type \\\'Err<dynamic>\\\'"));
        }
      }
    });

    test('should fail when actual object is not a result', () {
      try {
        expect(1, HasResultError(equals(1)));
        fail("It was expected to fail");
      } catch (e) {
        if (e is! TestFailure) {
          rethrow;
        } else {
          expect(e.message,
              contains("is not a subtype of type \\\'Err<dynamic>\\\'"));
        }
      }
    });
  });
}
