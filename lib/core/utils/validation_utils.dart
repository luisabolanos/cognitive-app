import 'package:cognitive_app/core/constants/app_constants.dart';

/// Utilidades de validacion para formularios (Login, Registro, Perfil).
class ValidationUtils {
  const ValidationUtils._();

  static final RegExp _emailRegExp = RegExp(
    r'^[\w\-.+]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  static String? validateEmail(String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return 'Ingresa tu correo electrónico.';
    }
    if (!_emailRegExp.hasMatch(trimmed)) {
      return 'Ingresa un correo electrónico válido.';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final text = value ?? '';
    if (text.isEmpty) {
      return 'Ingresa tu contraseña.';
    }
    if (text.length < AppConstants.minPasswordLength) {
      return 'La contraseña debe tener al menos ${AppConstants.minPasswordLength} caracteres.';
    }
    return null;
  }

  static String? validateUsername(String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return 'Ingresa un nombre de usuario.';
    }
    if (trimmed.length < AppConstants.minUsernameLength) {
      return 'Debe tener al menos ${AppConstants.minUsernameLength} caracteres.';
    }
    return null;
  }
}
