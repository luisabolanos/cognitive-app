import 'dart:math';

/// Generador aleatorio para estimulos y secuencias en los ejercicios cognitivos.
class RandomUtils {
  const RandomUtils._();

  static final Random _random = Random();

  /// Retorna un entero aleatorio entre [min] (inclusivo) y [max] (inclusivo).
  static int intInRange(int min, int max) {
    if (max <= min) return min;
    return min + _random.nextInt(max - min + 1);
  }

  /// Selecciona un elemento aleatorio de una lista no vacia.
  static T pickOne<T>(List<T> items) {
    if (items.isEmpty) {
      throw ArgumentError('Cannot pick an element from an empty list.');
    }
    return items[_random.nextInt(items.length)];
  }

  /// Retorna una copia mezclada aleatoriamente de la lista [items].
  static List<T> shuffled<T>(Iterable<T> items) {
    final copy = List<T>.from(items);
    copy.shuffle(_random);
    return copy;
  }
}
