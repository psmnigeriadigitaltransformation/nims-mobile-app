sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T payload;

  const Success(this.payload);
}

class Error<T> extends Result<T> {
  final String message;
  final Exception? exception;
  final StackTrace? stackTrace;

  const Error(this.message, {this.exception, this.stackTrace});
}
