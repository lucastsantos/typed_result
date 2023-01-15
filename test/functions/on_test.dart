import 'package:test/test.dart';
import 'package:typed_result/typed_result.dart';

void main() {
  group('onSuccess', () {
    test('callback should be called when it is success', () {
      int value = 0;
      const Ok("").onSuccess((_) {
        value += 1;
      });
      expect(value, 1);
    });

    test('callback should not be called when it is failure', () {
      int value = 0;
      const Err("").onSuccess((_) {
        value += 1;
      });
      expect(value, 0);
    });
  });

  group('onFailure', () {
    test('callback should not be called when it is success', () {
      int value = 0;
      const Ok("").onFailure((_) {
        value += 1;
      });
      expect(value, 0);
    });

    test('callback should be called when it is failure', () {
      int value = 0;
      const Err("").onFailure((_) {
        value += 1;
      });
      expect(value, 1);
    });
  });
}
