/// Base failure class for use case error handling
class UseCaseFailure {
  final String message;
  final Object? error;

  const UseCaseFailure(this.message, [this.error]);

  @override
  String toString() => 'UseCaseFailure: $message';
}