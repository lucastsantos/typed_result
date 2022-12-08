import 'package:flutter_test/flutter_test.dart';
import 'package:typed_result/typed_result.dart';

void main() {
  group('map', () {
    test('should transform when its success', () {
      var result = const Ok(1).map((e) => e.toString());
      expect(result.runtimeType, Ok<String>);
      expect((result as Ok).value, "1");
    });

    test('should preserve value when its an error', () {
      var result = const Err('error').map((_) => 1);
      expect(result.runtimeType, Err<String>);
      expect((result as Err).error, 'error');
    });
  });

  group('mapError', () {
    test('should preserve value when its success', () {
      var result = const Ok(1).mapError((e) => e.toString());
      expect(result.runtimeType, Ok<int>);
      expect((result as Ok).value, 1);
    });

    test('should transform when its an error', () {
      var result = const Err('error').mapError((_) => 1);
      expect(result.runtimeType, Err<int>);
      expect((result as Err).error, 1);
    });
  });

  group('mapBoth', () {
    test('should map with success block when its success', () {
      var result = const Ok(1).mapBoth(
        success: (e) => "a",
        error: (e) => 0,
      );
      expect(result.runtimeType, Ok<String>);
      expect((result as Ok).value, "a");
    });

    test('should map with error block when its an error', () {
      var result = const Err(1).mapBoth(
        success: (e) => "a",
        error: (e) => 0,
      );
      expect(result.runtimeType, Err<int>);
      expect((result as Err).error, 0);
    });
  });
}
