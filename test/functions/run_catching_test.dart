import 'package:flutter_test/flutter_test.dart';
import 'package:typed_result/typed_result.dart';

void main() {
  group('runCatching', () {
    test('should return success when block finishes normally', () {
      var result = runCatching(() => 1);
      expect(result.runtimeType, Ok<int>);
      expect((result as Ok).value, 1);
    });

    test('should return error when block throws Exception', () {
      var result = runCatching(() => throw Exception("a"));
      expect(result.runtimeType, Err<Object>);
    });

    test('should return error when block throws Error', () {
      var result = runCatching(() => throw Error());
      expect(result.runtimeType, Err<Object>);
    });
  });
}
