import 'package:test/test.dart';
import 'package:typed_result/typed_result.dart';

void main() {
  group('ResultValueEquals', () {
    test('should succeed with a success result with same value', () {
      expect(const Ok(1), isResultValueEquals(1));
    });

    test('should fail with a different type', () {
      try {
        expect(const Err(1), isResultValueEquals(1));
        fail("It was expected to fail");
      } catch (e) {
        if (e is! TestFailure) {
          rethrow;
        } else {
          expect(e.message, contains("is not a success result"));
        }
      }
    });

    test('should fail with a success result of different type', () {
      try {
        expect(const Ok(1), isResultValueEquals(""));
        fail("It was expected to fail");
      } catch (e) {
        if (e is! TestFailure) {
          rethrow;
        } else {
          expect(e.message, contains("is not equal to"));
        }
      }
    });

    test('should fail with a success result with different value', () {
      try {
        expect(const Ok(1), isResultValueEquals(2));
        fail("It was expected to fail");
      } catch (e) {
        if (e is! TestFailure) {
          rethrow;
        } else {
          expect(e.message, contains("is not equal to"));
        }
      }
    });
  });
}
