class ResultWrapper<T> {
  final ResultStatus status;
  final T? data;
  final String? message;
  final Exception? error;

  const ResultWrapper(
      {this.data, required this.status, this.message, this.error});

  static ResultWrapper<T> loading<T>({T? data}) =>
      ResultWrapper<T>(data: data, status: ResultStatus.loading);

  static ResultWrapper<T> failed<T>({Exception? error, T? data}) =>
      ResultWrapper<T>(error: error, data: data, status: ResultStatus.failed);

  static ResultWrapper<T> success<T>({T? data}) =>
      ResultWrapper<T>(data: data, status: ResultStatus.success);
}

enum ResultStatus { loading, success, failed }
