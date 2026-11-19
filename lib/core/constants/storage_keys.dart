/// Claves para SharedPreferences y FlutterSecureStorage.
class StorageKeys {
  const StorageKeys._();

  // Preferencias locales (SharedPreferences)
  static const String selectedLanguage = 'selected_language';
  static const String themeMode = 'theme_mode';
  static const String soundEffectsEnabled = 'sound_effects_enabled';
  static const String hapticsEnabled = 'haptics_enabled';
  static const String onboardingCompleted = 'onboarding_completed';
  static const String pendingSyncQueue = 'pending_sync_queue';

  // Almacenamiento seguro (FlutterSecureStorage)
  static const String accessToken = 'secure_access_token';
  static const String refreshToken = 'secure_refresh_token';
  static const String cachedUserId = 'secure_cached_user_id';
}
