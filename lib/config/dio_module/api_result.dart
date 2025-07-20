sealed class ApiResult<T> {}

class ApiSuccessResult<T> extends ApiResult<T> {
  T data;
  ApiSuccessResult(this.data);
}

class ApiErrorResult<T> extends ApiResult<T> {
  final String errorMessage;

  ApiErrorResult(this.errorMessage);
}

class ApiStreamResult<T> extends ApiResult<T> {
  final Stream dataFlow;

  ApiStreamResult(this.dataFlow);
}
