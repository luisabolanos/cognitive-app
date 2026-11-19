import 'package:cognitive_app/core/errors/app_exception.dart';

/// Excepcion lanzada ante errores de configuracion o estado invalido en el motor de juegos.
class GameException extends AppException {
  const GameException(
    super.message, {
    super.code,
    super.cause,
  });

  factory GameException.invalidConfiguration(String exerciseCode) {
    return GameException(
      'Configuración inválida o incompleta para el ejercicio: $exerciseCode.',
      code: 'INVALID_GAME_CONFIG',
    );
  }

  factory GameException.invalidState(String details) {
    return GameException(
      'Estado de juego no válido: $details',
      code: 'INVALID_GAME_STATE',
    );
  }
}
