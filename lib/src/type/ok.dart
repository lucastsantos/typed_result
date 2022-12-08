import 'result.dart';

class Ok<T> extends Result<T, Never> {
  final T value;

  const Ok(this.value);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Ok<T> && other.value == value;
  }

  @override
  bool get isFailure => false;

  @override
  bool get isSuccess => true;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Result: Ok=$value';
}
