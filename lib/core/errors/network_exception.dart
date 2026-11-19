import 'package:cognitive_app/core/errors/app_exception.dart';

/// Excepcion lanzada ante fallos de conectividad o peticiones remotas.
class NetworkException extends AppException {
  const NetworkException(
    super.message, {
    super.code,
    super.cause,
  });

  factory NetworkException.noConnection() {
    return const NetworkException(
      'No hay conexión a internet. Verifica tu red e intenta nuevamente.',
      code: 'NO_CONNECTION',
    );
  }

  factory NetworkException.timeout() {
    return const NetworkException(
      'La solicitud tardó demasiado tiempo en responder.',
      code: 'TIMEOUT',
    );
  }
}
