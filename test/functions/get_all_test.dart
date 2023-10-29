import 'package:test/test.dart';
import 'package:typed_result/typed_result.dart';

void main() {
  group('getAll', () {
    test('should return success values from iterables', () {
      List<Result<int, int>> results = [
        const Err(1),
        const Ok(2),
        const Ok(3),
        const Err(4)
      ];
      expect(results.getAll(), [2, 3]);
    });

    test('should return empty list if has no elements', () {
      List<Result<int, int>> results = [];
      expect(results.getAll(), isEmpty);
    });

    test('should return empty list if has only failures', () {
      List<Result<int, int>> results = [const Err(1), const Err(2)];
      expect(results.getAll(), isEmpty);
    });
  });
}
