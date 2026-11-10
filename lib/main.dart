import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:cognitive_app/app/app.dart';
import 'package:cognitive_app/app/config/environment.dart';

void main() async {
  // 1. Inicializar Flutter
  WidgetsFlutterBinding.ensureInitialized();

  if (Environment.supabaseUrl.isEmpty || Environment.supabaseAnonKey.isEmpty) {
    throw StateError(
      'Missing Supabase runtime configuration. Provide SUPABASE_URL and '
      'SUPABASE_ANON_KEY with --dart-define.',
    );
  }

  // 2. Inicializar Supabase
  await Supabase.initialize(
    url: Environment.supabaseUrl,
    publishableKey: Environment.supabaseAnonKey,
  );

  // 3. Inicializar otras dependencias
  // TODO: Agregar inicialización de dependencias locales (SharedPreferences, etc.)

  // 4. Ejecutar App
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
