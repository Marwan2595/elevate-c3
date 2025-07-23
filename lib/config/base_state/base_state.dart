abstract class BaseState<T> {
  bool isLoading = false;
  String? errorMessage;
  T successData;

  BaseState({
    this.isLoading = false,
    this.errorMessage,
    required this.successData,
  });
}
