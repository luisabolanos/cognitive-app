/// Constantes generales de la aplicacion y nombres de tablas en Supabase.
class AppConstants {
  const AppConstants._();

  // Timeouts y limites generales
  static const Duration networkTimeout = Duration(seconds: 15);
  static const int defaultLeaderboardLimit = 50;
  static const int minPasswordLength = 6;
  static const int minUsernameLength = 3;

  // Nombres de tablas en Supabase
  static const String profilesTable = 'profiles';
  static const String languagesTable = 'languages';
  static const String exerciseCategoriesTable = 'exercise_categories';
  static const String exerciseCategoryTranslationsTable =
      'exercise_category_translations';
  static const String exercisesTable = 'exercises';
  static const String exerciseTranslationsTable = 'exercise_translations';
  static const String exerciseConfigurationsTable = 'exercise_configurations';
  static const String gameSessionsTable = 'game_sessions';
  static const String gameResultsTable = 'game_results';
  static const String userProgressTable = 'user_progress';
  static const String userStatsTable = 'user_stats';
  static const String streaksTable = 'streaks';
  static const String achievementsTable = 'achievements';
  static const String achievementTranslationsTable = 'achievement_translations';
  static const String userAchievementsTable = 'user_achievements';
  static const String leaderboardsTable = 'leaderboards';
}
