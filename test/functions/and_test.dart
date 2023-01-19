import 'package:test/test.dart';
import 'package:typed_result/typed_result.dart';

void main() {
  group('and', () {
    test('should return provided result when it is success', () {
      Result<int, int> result = const Ok(1);
      expect(result.and(const Ok(2)).get(), 2);
      expect(result.and(const Err(2)).getError(), 2);
    });

    test('should return current result when it is failure', () {
      Result<int, int> result = const Err(1);
      expect(result.and(const Ok(2)).get(), isNull);
      expect(result.and(const Err(2)).getError(), 1);
    });
  });

  group('andThen', () {
    test('should return provided result when it is success', () {
      Result<int, int> result = const Ok(1);
      expect(result.andThen((_) => Ok("a")).get(), "a");
      expect(result.andThen((e) => Err(e + 1)).getError(), 2);
    });

    test('should return current result when it is failure', () {
      Result<int, int> result = const Err(1);
      expect(result.andThen((e) => Ok("a")).get(), isNull);
      expect(result.andThen((e) => Err(e + 1)).getError(), 1);
    });
  });
}
