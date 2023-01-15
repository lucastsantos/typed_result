import 'package:test/test.dart';
import 'package:typed_result/typed_result.dart';

void main() {
  group('map', () {
    test('should transform when it is success', () {
      var result = const Ok(1).map((e) => e.toString());
      expect(result, isA<Ok<String>>());
      expect((result as Ok).value, "1");
    });

    test('should preserve value when it is failure', () {
      var result = const Err('error').map((_) => 1);
      expect(result, isA<Err<String>>());
      expect((result as Err).error, 'error');
    });
  });

  group('mapError', () {
    test('should preserve value when it is success', () {
      var result = const Ok(1).mapError((e) => e.toString());
      expect(result, isA<Ok<int>>());
      expect((result as Ok).value, 1);
    });

    test('should transform when it is failure', () {
      var result = const Err('error').mapError((_) => 1);
      expect(result, isA<Err<int>>());
      expect((result as Err).error, 1);
    });
  });

  group('mapBoth', () {
    test('should map with success block when it is success', () {
      var result = const Ok(1).mapBoth(
        success: (e) => "a",
        failure: (e) => 0,
      );
      expect(result, isA<Ok<String>>());
      expect((result as Ok).value, "a");
    });

    test('should map with failure block when it is failure', () {
      var result = const Err(1).mapBoth(
        success: (e) => "a",
        failure: (e) => 0,
      );
      expect(result, isA<Err<int>>());
      expect((result as Err).error, 0);
    });
  });

  test('Map extension name should not conflict with Dart Map', () {
    Result<Map<String, String>, Never> result = const Ok(0).map((value) => {});
    expect(result, isA<Ok<Map<String, String>>>());
  });
}
