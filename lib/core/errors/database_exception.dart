import 'package:cognitive_app/core/errors/app_exception.dart';

/// Excepcion lanzada ante errores de lectura/escritura en Supabase o almacenamiento local.
class DatabaseException extends AppException {
  const DatabaseException(
    super.message, {
    super.code,
    super.cause,
  });

  factory DatabaseException.notFound([String entity = 'Registro']) {
    return DatabaseException(
      '$entity no encontrado.',
      code: 'NOT_FOUND',
    );
  }

  factory DatabaseException.unauthorized() {
    return const DatabaseException(
      'No tienes permisos para realizar esta operación.',
      code: 'UNAUTHORIZED',
    );
  }
}
