/// Utilidades de fechas y formateo de duraciones de juego.
class AppDateUtils {
  const AppDateUtils._();

  /// Verifica si dos fechas corresponden al mismo dia calendario.
  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  /// Verifica si [current] es exactamente el dia siguiente a [previous].
  static bool isNextDay(DateTime previous, DateTime current) {
    final prevDate = DateTime(previous.year, previous.month, previous.day);
    final currDate = DateTime(current.year, current.month, current.day);
    return currDate.difference(prevDate).inDays == 1;
  }

  /// Formatea milisegundos o segundos en formato mm:ss para temporizadores.
  static String formatDurationSeconds(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
