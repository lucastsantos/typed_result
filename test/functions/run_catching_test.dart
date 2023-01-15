import 'package:test/test.dart';
import 'package:typed_result/typed_result.dart';

void main() {
  group('runCatching', () {
    test('should return success when block finishes normally', () {
      var result = runCatching(() => 1);
      expect(result, isA<Ok<int>>());
      expect((result as Ok).value, 1);
    });

    test('should return failure when block throws Exception', () {
      var result = runCatching(() => throw Exception());
      expect(result, isA<Err<Object>>());
    });

    test('should return failure when block throws Error', () {
      var result = runCatching(() => throw Error());
      expect(result, isA<Err<Object>>());
    });
  });
}
