import 'result.dart';

class Err<E> extends Result<Never, E> {
  final E error;

  const Err(this.error);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Err<E> && other.error == error;
  }

  @override
  bool get isFailure => true;

  @override
  bool get isSuccess => false;

  @override
  int get hashCode => error.hashCode;

  @override
  String toString() => 'Result: Err=$error';
}