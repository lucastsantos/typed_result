abstract class Result<T, E> {
  const Result();

  bool get isSuccess;
  bool get isFailure;
}