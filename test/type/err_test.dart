import 'package:test/test.dart';
import 'package:typed_result/typed_result.dart';

void main() {
  test('isSuccess should return false', () {
    expect(const Err(0).isSuccess, false);
  });
  test('isFailure should return true', () {
    expect(const Err(0).isFailure, true);
  });
  group("equals", () {
    test('two Err results with same values should be equal', () {
      expect(const Err(0) == const Err(0), true);
    });
    test('two Err results with different values should not be equal', () {
      expect(const Err(0) == const Err(1), false);
    });
  });
  group("hashcode", () {
    test('two Err results with same values should generate same hashcode', () {
      expect(const Err(0).hashCode == const Err(0).hashCode, true);
    });
    test(
        'two Err results with different values should not generate same hashcode',
        () {
      expect(const Err(0).hashCode == const Err(1).hashCode, false);
    });
  });
}
