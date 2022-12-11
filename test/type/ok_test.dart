import 'package:flutter_test/flutter_test.dart';
import 'package:typed_result/typed_result.dart';

void main() {
  test('isSuccess should return true', () {
    expect(const Ok(0).isSuccess, true);
  });
  test('isFailure should return false', () {
    expect(const Ok(0).isFailure, false);
  });
  group("equals", () {
    test('two Ok results with same values should be equal', () {
      expect(const Ok(0) == const Ok(0), true);
    });
    test('two Ok results with different values should not be equal', () {
      expect(const Ok(0) == const Ok(1), false);
    });
  });
  group("hashcode", () {
    test('two Ok results with same values should generate same hashcode', () {
      expect(const Ok(0).hashCode == const Ok(0).hashCode, true);
    });
    test('two Ok results with different values should not generate same hashcode', () {
      expect(const Ok(0).hashCode == const Ok(1).hashCode, false);
    });
  });
}
