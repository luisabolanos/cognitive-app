import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cognitive_app/app/routes/route_names.dart';
import 'package:cognitive_app/app/theme/app_colors.dart';
import 'package:cognitive_app/app/theme/app_dimensions.dart';
import 'package:cognitive_app/app/theme/app_text_styles.dart';
import 'package:cognitive_app/app/theme/app_theme.dart';
import 'package:cognitive_app/core/utils/date_utils.dart';
import 'package:cognitive_app/core/utils/number_utils.dart';
import 'package:cognitive_app/core/utils/validation_utils.dart';
import 'package:cognitive_app/core/widgets/app_button.dart';
import 'package:cognitive_app/core/widgets/app_dialog.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouteNames.login,
    routes: [
      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => const _ModernCognitiveMinimalismShowcase(),
      ),
      GoRoute(
        path: RouteNames.register,
        builder: (context, state) =>
            const Scaffold(body: Center(child: Text('Register Page'))),
      ),
      GoRoute(
        path: RouteNames.home,
        builder: (context, state) =>
            const Scaffold(body: Center(child: Text('Home Page'))),
      ),
      GoRoute(
        path: RouteNames.exercises,
        builder: (context, state) =>
            const Scaffold(body: Center(child: Text('Exercises Page'))),
      ),
      GoRoute(
        path: RouteNames.exerciseDetail,
        builder: (context, state) => Scaffold(
          body: Center(
            child: Text('Exercise Detail: ${state.pathParameters['id']}'),
          ),
        ),
      ),
      GoRoute(
        path: RouteNames.game,
        builder: (context, state) => Scaffold(
          body: Center(child: Text('Game: ${state.pathParameters['id']}')),
        ),
      ),
      GoRoute(
        path: RouteNames.profile,
        builder: (context, state) =>
            const Scaffold(body: Center(child: Text('Profile Page'))),
      ),
      GoRoute(
        path: RouteNames.progress,
        builder: (context, state) =>
            const Scaffold(body: Center(child: Text('Progress Page'))),
      ),
      GoRoute(
        path: RouteNames.ranking,
        builder: (context, state) =>
            const Scaffold(body: Center(child: Text('Ranking Page'))),
      ),
      GoRoute(
        path: RouteNames.settings,
        builder: (context, state) =>
            const Scaffold(body: Center(child: Text('Settings Page'))),
      ),
    ],
  );
});

/// Showcase interactivo del Design System V1.0: Modern Cognitive Minimalism.
class _ModernCognitiveMinimalismShowcase extends ConsumerStatefulWidget {
  const _ModernCognitiveMinimalismShowcase();

  @override
  ConsumerState<_ModernCognitiveMinimalismShowcase> createState() =>
      _ModernCognitiveMinimalismShowcaseState();
}

class _ModernCognitiveMinimalismShowcaseState
    extends ConsumerState<_ModernCognitiveMinimalismShowcase> {
  final _formKey = GlobalKey<FormState>();
  int _selectedNavIndex = 0;
  CognitiveCategory? _selectedCategory;
  String _gameFeedback = 'Presiona una opción para probar el estímulo (64 px)';
  bool _lastAnswerCorrect = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = screenWidth >= AppDimensions.tabletBreakpoint;

    return Scaffold(
      bottomNavigationBar: isDesktop
          ? null
          : NavigationBar(
              selectedIndex: _selectedNavIndex,
              onDestinationSelected: (idx) =>
                  setState(() => _selectedNavIndex = idx),
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home_rounded),
                  label: 'Inicio',
                ),
                NavigationDestination(
                  icon: Icon(Icons.grid_view_outlined),
                  selectedIcon: Icon(Icons.grid_view_rounded),
                  label: 'Juegos',
                ),
                NavigationDestination(
                  icon: Icon(Icons.insights_outlined),
                  selectedIcon: Icon(Icons.insights_rounded),
                  label: 'Progreso',
                ),
                NavigationDestination(
                  icon: Icon(Icons.emoji_events_outlined),
                  selectedIcon: Icon(Icons.emoji_events_rounded),
                  label: 'Ranking',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_outline_rounded),
                  selectedIcon: Icon(Icons.person_rounded),
                  label: 'Perfil',
                ),
              ],
            ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isDesktop) _buildDesktopSidebar(isDark),
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: AppDimensions.maxContentWidth,
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(AppDimensions.spacing6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildHeader(isDark),
                        const SizedBox(height: AppDimensions.spacing6),
                        _buildStreakAndDailyChallenge(isDark, screenWidth),
                        const SizedBox(height: AppDimensions.spacing8),
                        _buildCategoriesFilter(isDark),
                        const SizedBox(height: AppDimensions.spacing6),
                        _buildPilotExercisesGrid(isDark, screenWidth),
                        const SizedBox(height: AppDimensions.spacing8),
                        _buildGameArenaPreview(isDark),
                        const SizedBox(height: AppDimensions.spacing8),
                        _buildAuthAndComponentsPreview(isDark),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 8. Responsive Design: Sidebar para Web / Desktop (>= 900 px).
  Widget _buildDesktopSidebar(bool isDark) {
    final surfaceColor =
        isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;
    final items = const [
      (Icons.home_rounded, 'Inicio'),
      (Icons.grid_view_rounded, 'Juegos'),
      (Icons.insights_rounded, 'Progreso'),
      (Icons.emoji_events_rounded, 'Ranking'),
      (Icons.person_rounded, 'Perfil'),
    ];

    return Container(
      width: 240,
      height: double.infinity,
      decoration: BoxDecoration(
        color: surfaceColor,
        border: Border(right: BorderSide(color: borderColor)),
      ),
      padding: const EdgeInsets.all(AppDimensions.spacing5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.psychology_rounded,
                  color: Colors.white,
                  size: 22,
                ),
              ),
              const SizedBox(width: AppDimensions.spacing3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'COGNITIVE',
                      style: AppTextStyles.h4.copyWith(letterSpacing: 0.8),
                    ),
                    Text(
                      'Minimalism V1.0',
                      style: AppTextStyles.micro.copyWith(
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing8),
          ...List.generate(items.length, (index) {
            final selected = _selectedNavIndex == index;
            final activeColor =
                isDark ? AppColors.darkPrimary : AppColors.lightPrimary;
            return Padding(
              padding: const EdgeInsets.only(bottom: AppDimensions.spacing2),
              child: InkWell(
                borderRadius:
                    BorderRadius.circular(AppDimensions.buttonRadius),
                onTap: () => setState(() => _selectedNavIndex = index),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.spacing4,
                    vertical: AppDimensions.spacing3,
                  ),
                  decoration: BoxDecoration(
                    color: selected
                        ? activeColor.withValues(alpha: 0.14)
                        : Colors.transparent,
                    borderRadius:
                        BorderRadius.circular(AppDimensions.buttonRadius),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        items[index].$1,
                        size: 20,
                        color: selected
                            ? activeColor
                            : (isDark
                                ? AppColors.darkTextSecondary
                                : AppColors.lightTextSecondary),
                      ),
                      const SizedBox(width: AppDimensions.spacing3),
                      Text(
                        items[index].$2,
                        style: AppTextStyles.body.copyWith(
                          fontWeight:
                              selected ? FontWeight.w600 : FontWeight.w400,
                          color: selected
                              ? activeColor
                              : (isDark
                                  ? AppColors.darkText
                                  : AppColors.lightText),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  /// 6.1. Header con saludo, principio rector y selector de tema Light / Dark.
  Widget _buildHeader(bool isDark) {
    final textSecondary =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'MODERN COGNITIVE MINIMALISM',
                style: AppTextStyles.micro.copyWith(
                  color: isDark ? AppColors.darkPrimary : AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppDimensions.spacing1),
              Text(
                'Hola, Luisa',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: AppDimensions.spacing1),
              Text(
                'Entrenar sin distracciones. Visualizar el progreso sin abrumar.',
                style: AppTextStyles.body.copyWith(color: textSecondary),
              ),
            ],
          ),
        ),
        const SizedBox(width: AppDimensions.spacing4),
        // Toggle Tema Claro / Oscuro
        OutlinedButton.icon(
          onPressed: () => ref.read(themeModeProvider.notifier).toggle(),
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(140, AppDimensions.smallButtonHeight),
          ),
          icon: Icon(
            isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            size: 18,
          ),
          label: Text(isDark ? 'Tema Claro' : 'Tema Oscuro'),
        ),
      ],
    );
  }

  /// 6.1. Racha diaria + Reto Diario (unico elemento con gradiente destacado, radio 24px).
  Widget _buildStreakAndDailyChallenge(bool isDark, double screenWidth) {
    final dailyChallengeCard = Container(
      padding: const EdgeInsets.all(AppDimensions.spacing6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.featuredCardRadius),
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.accentLavender],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.spacing3,
                  vertical: AppDimensions.spacing1,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius:
                      BorderRadius.circular(AppDimensions.chipRadius),
                ),
                child: Text(
                  'RETO DIARIO  •  5 MIN',
                  style: AppTextStyles.micro.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Spacer(),
              const Icon(Icons.auto_awesome_rounded, color: Colors.white),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing4),
          Text(
            'Sesión de Enfoque y Memoria',
            style: AppTextStyles.h2.copyWith(color: Colors.white),
          ),
          const SizedBox(height: AppDimensions.spacing2),
          Text(
            '3 ejercicios adaptativos seleccionados según tu precisión reciente (92.4%).',
            style: AppTextStyles.body.copyWith(
              color: Colors.white.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: AppDimensions.spacing5),
          SizedBox(
            width: 210,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primary,
                minimumSize:
                    const Size.fromHeight(AppDimensions.smallButtonHeight),
              ),
              icon: const Icon(Icons.play_arrow_rounded),
              label: const Text('Comenzar sesión'),
            ),
          ),
        ],
      ),
    );

    final streakCard = Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacing5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppDimensions.spacing2),
                  decoration: BoxDecoration(
                    color: AppColors.accentAmber.withValues(alpha: 0.16),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.local_fire_department_rounded,
                    color: AppColors.accentAmber,
                    size: 24,
                  ),
                ),
                const SizedBox(width: AppDimensions.spacing3),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '7 días',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      'Racha activa sin presión',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.spacing5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['L', 'M', 'X', 'J', 'V', 'S', 'D'].asMap().entries.map(
                (entry) {
                  final completed = entry.key < 5;
                  return Column(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: completed
                              ? AppColors.secondary
                              : (isDark
                                  ? AppColors.darkSurfaceSecondary
                                  : AppColors.lightSurfaceSecondary),
                        ),
                        child: Icon(
                          completed ? Icons.check_rounded : Icons.circle,
                          size: completed ? 16 : 6,
                          color: completed
                              ? Colors.white
                              : (isDark
                                  ? AppColors.darkTextSecondary
                                  : AppColors.lightTextSecondary),
                        ),
                      ),
                      const SizedBox(height: AppDimensions.spacing1),
                      Text(
                        entry.value,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  );
                },
              ).toList(),
            ),
            const SizedBox(height: AppDimensions.spacing4),
            Divider(
              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
            ),
            const SizedBox(height: AppDimensions.spacing2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMiniMetric('Precisión', NumberUtils.formatAccuracy(92.4)),
                _buildMiniMetric(
                  'Reacción',
                  NumberUtils.formatReactionTime(380),
                ),
                _buildMiniMetric('Sesiones', '24'),
              ],
            ),
          ],
        ),
      ),
    );

    if (screenWidth >= 780) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 6, child: dailyChallengeCard),
          const SizedBox(width: AppDimensions.spacing5),
          Expanded(flex: 4, child: streakCard),
        ],
      );
    }

    return Column(
      children: [
        dailyChallengeCard,
        const SizedBox(height: AppDimensions.spacing4),
        streakCard,
      ],
    );
  }

  Widget _buildMiniMetric(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelMedium),
        Text(value, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }

  /// 3 y 5.3. Identidad de las 10 categorias cognitivas (Chips radio 100px).
  Widget _buildCategoriesFilter(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '10 Dominios Cognitivos',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            if (_selectedCategory != null)
              TextButton(
                onPressed: () => setState(() => _selectedCategory = null),
                child: const Text('Ver todos'),
              ),
          ],
        ),
        const SizedBox(height: AppDimensions.spacing3),
        Wrap(
          spacing: AppDimensions.spacing2,
          runSpacing: AppDimensions.spacing2,
          children: CognitiveCategory.values.map((category) {
            final isSelected = _selectedCategory == category;
            return InkWell(
              borderRadius: BorderRadius.circular(AppDimensions.chipRadius),
              onTap: () => setState(() {
                _selectedCategory = isSelected ? null : category;
              }),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.spacing4,
                  vertical: AppDimensions.spacing2,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? category.color.withValues(alpha: 0.16)
                      : (isDark
                          ? AppColors.darkSurface
                          : AppColors.lightSurface),
                  borderRadius:
                      BorderRadius.circular(AppDimensions.chipRadius),
                  border: Border.all(
                    color: isSelected
                        ? category.color
                        : (isDark
                            ? AppColors.darkBorder
                            : AppColors.lightBorder),
                    width: isSelected ? 1.5 : 1.0,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      category.icon,
                      size: 16,
                      color: category.color,
                    ),
                    const SizedBox(width: AppDimensions.spacing2),
                    Text(
                      category.labelEs,
                      style: AppTextStyles.caption.copyWith(
                        color: isSelected
                            ? category.color
                            : (isDark
                                ? AppColors.darkText
                                : AppColors.lightText),
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  /// 11.1. Los 3 ejercicios piloto para validar el sistema: N-Back, Stroop, Corsi.
  Widget _buildPilotExercisesGrid(bool isDark, double screenWidth) {
    final pilotExercises = const [
      (
        title: 'N-Back',
        category: CognitiveCategory.workingMemory,
        description:
            'Identifica si el estímulo actual coincide con el presentado N pasos atrás.',
        level: 3,
        bestScore: 1480,
        avgTime: '410 ms',
      ),
      (
        title: 'Stroop',
        category: CognitiveCategory.inhibition,
        description:
            'Selecciona el color de la tinta ignorando el significado escrito de la palabra.',
        level: 4,
        bestScore: 1820,
        avgTime: '365 ms',
      ),
      (
        title: 'Bloques de Corsi',
        category: CognitiveCategory.visuospatial,
        description:
            'Memoriza y reproduce la secuencia exacta de posiciones espaciales.',
        level: 2,
        bestScore: 1250,
        avgTime: '520 ms',
      ),
    ];

    final cards = pilotExercises.map((ex) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.spacing5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: ex.category.color.withValues(alpha: 0.14),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      ex.category.icon,
                      color: ex.category.color,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: AppDimensions.spacing3),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ex.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          ex.category.labelEs,
                          style: AppTextStyles.caption.copyWith(
                            color: ex.category.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.spacing3,
                      vertical: AppDimensions.spacing1,
                    ),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.darkSurfaceSecondary
                          : AppColors.lightSurfaceSecondary,
                      borderRadius:
                          BorderRadius.circular(AppDimensions.chipRadius),
                    ),
                    child: Text(
                      'Nivel ${ex.level}',
                      style: AppTextStyles.caption.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.spacing3),
              Text(
                ex.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: AppDimensions.spacing4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildMiniMetric('Récord', '${ex.bestScore} pts'),
                  _buildMiniMetric('Reacción prom.', ex.avgTime),
                  SizedBox(
                    width: 110,
                    child: AppButton(
                      label: 'Entrenar',
                      size: AppButtonSize.small,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ejercicios Piloto (Sección 11.1)',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: AppDimensions.spacing3),
        if (screenWidth >= 960)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: cards[0]),
              const SizedBox(width: AppDimensions.spacing4),
              Expanded(child: cards[1]),
              const SizedBox(width: AppDimensions.spacing4),
              Expanded(child: cards[2]),
            ],
          )
        else
          Column(
            children: cards
                .map(
                  (c) => Padding(
                    padding:
                        const EdgeInsets.only(bottom: AppDimensions.spacing4),
                    child: c,
                  ),
                )
                .toList(),
          ),
      ],
    );
  }

  /// 6.3 y 8. Interfaz minimalista de juego (acotada a 560px incluso en monitores grandes).
  Widget _buildGameArenaPreview(bool isDark) {
    final successColor =
        isDark ? AppColors.darkSuccess : AppColors.lightSuccess;
    final errorColor = isDark ? AppColors.darkError : AppColors.lightError;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Previsualización de Interfaz de Juego (Sección 6.3 — Área acotada 560 px)',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: AppDimensions.spacing3),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppDimensions.gameArenaMaxWidth,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.spacing6),
                child: Column(
                  children: [
                    // Cabecera minimalista de juego
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'STROOP  •  NIVEL 4',
                          style: AppTextStyles.caption.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.timer_outlined,
                              size: 18,
                              color: AppColors.secondary,
                            ),
                            const SizedBox(width: AppDimensions.spacing1),
                            Text(
                              AppDateUtils.formatDurationSeconds(42),
                              style: AppTextStyles.gameTimer,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDimensions.spacing3),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: 0.65,
                        minHeight: 6,
                        backgroundColor: isDark
                            ? AppColors.darkSurfaceSecondary
                            : AppColors.lightSurfaceSecondary,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.secondary,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppDimensions.spacing8),
                    Text(
                      'Selecciona el color de la TINTA, no la palabra',
                      style: AppTextStyles.gameInstruction.copyWith(
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.spacing6),
                    // Estimulo central con maxima jerarquia visual (68 px)
                    Text(
                      'AZUL',
                      style: AppTextStyles.stroopStimulus.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.spacing6),
                    // Feedback inmediato con icono + texto (no depende solo del color)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.spacing4,
                        vertical: AppDimensions.spacing2,
                      ),
                      decoration: BoxDecoration(
                        color: (_lastAnswerCorrect ? successColor : errorColor)
                            .withValues(alpha: 0.14),
                        borderRadius:
                            BorderRadius.circular(AppDimensions.chipRadius),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _lastAnswerCorrect
                                ? Icons.check_circle_rounded
                                : Icons.info_outline_rounded,
                            size: 16,
                            color:
                                _lastAnswerCorrect ? successColor : errorColor,
                          ),
                          const SizedBox(width: AppDimensions.spacing2),
                          Text(
                            _gameFeedback,
                            style: AppTextStyles.caption.copyWith(
                              color: _lastAnswerCorrect
                                  ? successColor
                                  : errorColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppDimensions.spacing6),
                    // Botones de respuesta de juego: altura minima 64 px + Scale 0.97
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            label: 'AZUL',
                            size: AppButtonSize.gameResponse,
                            isOutlined: true,
                            onPressed: () => setState(() {
                              _lastAnswerCorrect = false;
                              _gameFeedback =
                                  'Incorrecto: leíste la palabra en vez del color.';
                            }),
                          ),
                        ),
                        const SizedBox(width: AppDimensions.spacing4),
                        Expanded(
                          child: AppButton(
                            label: 'VERDE MENTA',
                            size: AppButtonSize.gameResponse,
                            isSecondary: true,
                            onPressed: () => setState(() {
                              _lastAnswerCorrect = true;
                              _gameFeedback =
                                  '¡Correcto! Tiempo de reacción: 340 ms';
                            }),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// 5.3 y 6.6. Inputs (radio 12px) y validacion de formulario + modal (radio 28px).
  Widget _buildAuthAndComponentsPreview(bool isDark) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacing6),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Formulario & Controles UI Kit (Inputs 12 px • Botones 14 px • Cards 20 px)',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: AppDimensions.spacing4),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Correo electrónico',
                        hintText: 'luisa@cognitive.app',
                        prefixIcon: Icon(Icons.mail_outline_rounded),
                      ),
                      validator: ValidationUtils.validateEmail,
                    ),
                  ),
                  const SizedBox(width: AppDimensions.spacing4),
                  Expanded(
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Contraseña',
                        hintText: 'Mínimo 6 caracteres',
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                      ),
                      validator: ValidationUtils.validatePassword,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.spacing4),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      label: 'Validar Inputs',
                      icon: Icons.verified_outlined,
                      onPressed: () => _formKey.currentState?.validate(),
                    ),
                  ),
                  const SizedBox(width: AppDimensions.spacing4),
                  Expanded(
                    child: AppButton(
                      label: 'Probar Modal',
                      isOutlined: true,
                      onPressed: () {
                        AppDialog.showConfirm(
                          context,
                          title: 'Pausar sesión',
                          message:
                              'Tu progreso actual en el ejercicio se conservará.',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
