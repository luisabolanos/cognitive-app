/// Utilidades para formatear puntajes, porcentajes de precision y tiempos de reaccion.
class NumberUtils {
  const NumberUtils._();

  /// Formatea un porcentaje de precision (ej. 87.5 -> "87.5%").
  static String formatAccuracy(double accuracy, {int decimals = 1}) {
    final clamped = accuracy.clamp(0.0, 100.0);
    return '${clamped.toStringAsFixed(decimals)}%';
  }

  /// Formatea un tiempo de reaccion en milisegundos (ej. 420 -> "420 ms").
  static String formatReactionTime(int? milliseconds) {
    if (milliseconds == null || milliseconds <= 0) {
      return '-- ms';
    }
    return '$milliseconds ms';
  }
}
