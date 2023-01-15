import 'package:test/test.dart';
import 'package:typed_result/typed_result.dart';

void main() {
  group('ResultErrorEquals', () {
    test('should succeed with a failure result with same value', () {
      expect(const Err(1), isResultErrorEquals(1));
    });

    test('should fail with a different type', () {
      try {
        expect(const Ok(1), isResultErrorEquals(1));
        fail("It was expected to fail");
      } catch (e) {
        if (e is! TestFailure) {
          rethrow;
        } else {
          expect(e.message, contains("is not a failure result"));
        }
      }
    });

    test('should fail with a failure result of different type', () {
      try {
        expect(const Err(1), isResultErrorEquals(""));
        fail("It was expected to fail");
      } catch (e) {
        if (e is! TestFailure) {
          rethrow;
        } else {
          expect(e.message, contains("is not equal to"));
        }
      }
    });

    test('should fail with a failure result with different value', () {
      try {
        expect(const Err(1), isResultErrorEquals(2));
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
