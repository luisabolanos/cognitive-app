/// Runtime configuration supplied through --dart-define.
///
/// Never put Supabase service-role keys or database passwords in this file.
class Environment {
  const Environment._();

  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');
}
