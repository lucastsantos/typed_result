import 'package:test/test.dart';
import 'package:typed_result/typed_result.dart';

void main() {
  group('partition', () {
    test('should return only values if there is no failure', () {
      List<Result<int, int>> results = [const Ok(1), const Ok(2)];
      final (values, errors) = results.partition();
      expect(values, [1, 2]);
      expect(errors, isEmpty);
    });

    test('should return only failures if there is no success', () {
      List<Result<int, int>> results = [const Err(1), const Err(2)];
      final (values, errors) = results.partition();
      expect(values, isEmpty);
      expect(errors, [1, 2]);
    });

    test('should correctly return with a mix of success and failure', () {
      List<Result<int, int>> results = [const Ok(1), const Err(2)];
      final (values, errors) = results.partition();
      expect(values, [1]);
      expect(errors, [2]);
    });
  });
}
