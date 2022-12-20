import 'package:flutter_test/flutter_test.dart';
import 'package:typed_result/typed_result.dart';

void main() {
  group('when', () {
    test('should invoke only the success block when it is success', () {
      int success = 0;
      int failure = 0;
      const Ok("").when(
        success: (_) {
          success += 1;
        },
        failure: (_) {
          failure += 1;
        },
      );
      expect(success, 1);
      expect(failure, 0);
    });

    test('should invoke only the failure block when it is failure', () {
      int success = 0;
      int failure = 0;
      const Err("").when(
        success: (_) {
          success += 1;
        },
        failure: (_) {
          failure += 1;
        },
      );
      expect(success, 0);
      expect(failure, 1);
    });
  });
}
