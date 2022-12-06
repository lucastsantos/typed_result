import 'package:flutter_test/flutter_test.dart';
import 'package:typed_result/src/functions/get.dart';
import 'package:typed_result/typed_result.dart';

void main() {
  group('get', () {
    test('should return value when its success', () {
      Result<int, String> result = const Ok(1);
      expect(result.get(), 1);
    });

    test('should return null when its an error', () {
      Result<int, String> result = const Err('1');
      expect(result.get(), null);
    });
  });

  group('getOr', () {
    test('should return value when its success', () {
      Result<int, String> result = const Ok(1);
      expect(result.getOr(() => 2), 1);
    });

    test('should return default value when its an error', () {
      Result<int, String> result = const Err('1');
      expect(result.getOr(() => 2), 2);
    });
  });
}
