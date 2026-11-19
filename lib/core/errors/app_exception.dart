/// Excepcion base para todos los errores controlados de la aplicacion.
class AppException implements Exception {
  const AppException(
    this.message, {
    this.code,
    this.cause,
  });

  final String message;
  final String? code;
  final Object? cause;

  @override
  String toString() {
    if (code != null) {
      return 'AppException($code): $message';
    }
    return 'AppException: $message';
  }
}
