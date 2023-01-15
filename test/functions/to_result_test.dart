import 'package:test/test.dart';
import 'package:typed_result/typed_result.dart';

void main() {
  group('toResult', () {
    test('should return success when it is a not-null value', () {
      String? value = "a";
      var result = value.toResultOr(() => 1);
      expect(result, isA<Ok<String>>());
      expect((result as Ok).value, "a");
    });

    test('should return failure when it is a null value', () {
      String? value;
      var result = value.toResultOr(() => 1);
      expect(result, isA<Err<int>>());
      expect((result as Err).error, 1);
    });
  });
}
