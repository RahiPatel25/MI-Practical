/// DATA STATE
abstract class DataState<T> {
  final T? data;
  final Exception? error;

  const DataState({this.data, this.error});
}

/// Success
class Success<T> extends DataState<T> {
  const Success(T data) : super(data: data);
}

/// Failure
class Failure<T> extends DataState<T> {
  const Failure(Exception exception) : super(error: exception);
}
