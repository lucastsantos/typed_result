import 'package:flutter_test/flutter_test.dart';
import 'package:typed_result/typed_result.dart';

void main() {
  group('get', () {
    test('should return value when it is success', () {
      Result<int, String> result = const Ok(1);
      expect(result.get(), 1);
    });

    test('should return null when it is failure', () {
      Result<int, String> result = const Err('1');
      expect(result.get(), null);
    });
  });

  group('getOr', () {
    test('should return value when it is success', () {
      Result<int, String> result = const Ok(1);
      expect(result.getOr(() => 2), 1);
    });

    test('should return default value when it is failure', () {
      Result<int, String> result = const Err('1');
      expect(result.getOr(() => 2), 2);
    });
  });

  group('getOrThrow', () {
    test('should return value normally when it is success', () {
      Result<int, String> result = const Ok(1);
      expect(result.getOrThrow(), 1);
    });

    test('should throw when it is failure', () {
      Result<int, String> result = const Err('1');
      expect(() => result.getOrThrow(), throwsException);
    });
  });
}
