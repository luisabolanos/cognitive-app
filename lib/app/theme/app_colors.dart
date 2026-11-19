import 'package:flutter/material.dart';

/// Dominios cognitivos oficiales de Cognitive App (Seccion 3 y 7.2 del Design System).
enum CognitiveCategory {
  workingMemory(
    code: 'WORKING_MEMORY',
    labelEs: 'Memoria de trabajo',
    color: Color(0xFF7166E8),
    gradientEnd: Color(0xFFA99FFF),
    icon: Icons.psychology_outlined,
  ),
  attention(
    code: 'ATTENTION',
    labelEs: 'Atención',
    color: Color(0xFFE5A13D),
    gradientEnd: Color(0xFFFFD17B),
    icon: Icons.visibility_outlined,
  ),
  inhibition(
    code: 'INHIBITION',
    labelEs: 'Inhibición',
    color: Color(0xFFE56C78),
    gradientEnd: Color(0xFFFFA0A7),
    icon: Icons.verified_user_outlined,
  ),
  cognitiveFlexibility(
    code: 'COGNITIVE_FLEXIBILITY',
    labelEs: 'Flexibilidad cognitiva',
    color: Color(0xFF269EAC),
    gradientEnd: Color(0xFF65D0D0),
    icon: Icons.shuffle_rounded,
  ),
  processingSpeed(
    code: 'PROCESSING_SPEED',
    labelEs: 'Velocidad de procesamiento',
    color: Color(0xFF397CD8),
    gradientEnd: Color(0xFF79B5FA),
    icon: Icons.bolt_rounded,
  ),
  logicalReasoning(
    code: 'LOGICAL_REASONING',
    labelEs: 'Razonamiento lógico',
    color: Color(0xFF8D68CC),
    gradientEnd: Color(0xFFC2A1F1),
    icon: Icons.lightbulb_outline_rounded,
  ),
  visuospatial(
    code: 'VISUOSPATIAL',
    labelEs: 'Visoespacial',
    color: Color(0xFF299D76),
    gradientEnd: Color(0xFF7BD9A9),
    icon: Icons.category_outlined,
  ),
  language(
    code: 'LANGUAGE',
    labelEs: 'Lenguaje',
    color: Color(0xFFD16C9B),
    gradientEnd: Color(0xFFF2A7CA),
    icon: Icons.translate_rounded,
  ),
  planning(
    code: 'PLANNING',
    labelEs: 'Planificación',
    color: Color(0xFFB17B39),
    gradientEnd: Color(0xFFE6BC72),
    icon: Icons.account_tree_outlined,
  ),
  problemSolving(
    code: 'PROBLEM_SOLVING',
    labelEs: 'Resolución de problemas',
    color: Color(0xFF56718E),
    gradientEnd: Color(0xFF94B1D0),
    icon: Icons.extension_outlined,
  );

  const CognitiveCategory({
    required this.code,
    required this.labelEs,
    required this.color,
    required this.gradientEnd,
    required this.icon,
  });

  final String code;
  final String labelEs;
  final Color color;
  final Color gradientEnd;
  final IconData icon;

  LinearGradient get gradient => LinearGradient(
        colors: [color, gradientEnd],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
}

/// Paleta de colores oficial: Modern Cognitive Minimalism (Design System V1.0).
abstract final class AppColors {
  // 2.1. Colores de marca
  static const Color primary = Color(0xFF635BDB); // Indigo
  static const Color secondary = Color(0xFF13A88A); // Teal / Verde menta
  static const Color accent = Color(0xFFFFB84D); // Amber (rachas y logros)
  static const Color accentAmber = Color(0xFFFFB84D);
  static const Color accentLavender = Color(0xFF9B8AFB);

  // 2.2. Tema Claro explicito
  static const Color lightBackground = Color(0xFFF4F6FA);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceSecondary = Color(0xFFEDF0F7);
  static const Color lightPrimary = Color(0xFF635BDB);
  static const Color lightText = Color(0xFF18243A);
  static const Color lightTextSecondary = Color(0xFF68758A);
  static const Color lightBorder = Color(0xFFE5E9F1);
  static const Color lightSuccess = Color(0xFF16A57A);
  static const Color lightWarning = Color(0xFFE99A38);
  static const Color lightError = Color(0xFFE45C69);
  static const Color lightInfo = Color(0xFF3885DC);

  // 2.3. Tema Oscuro explicito
  static const Color darkBackground = Color(0xFF101827);
  static const Color darkSurface = Color(0xFF192538);
  static const Color darkSurfaceSecondary = Color(0xFF223149);
  static const Color darkPrimary = Color(0xFF948BFF);
  static const Color darkText = Color(0xFFF2F5FC);
  static const Color darkTextSecondary = Color(0xFFA1AEC2);
  static const Color darkBorder = Color(0xFF2B3A50);
  static const Color darkSuccess = Color(0xFF39C99B);
  static const Color darkWarning = Color(0xFFFFC16B);
  static const Color darkError = Color(0xFFFF7582);
  static const Color darkInfo = Color(0xFF70B5FF);

  // Tokens semanticos por defecto
  static const Color success = lightSuccess;
  static const Color warning = lightWarning;
  static const Color error = lightError;
  static const Color info = lightInfo;

  // 3. Colores de las 10 categorias cognitivas
  static const Color workingMemory = Color(0xFF7166E8);
  static const Color attention = Color(0xFFE5A13D);
  static const Color inhibition = Color(0xFFE56C78);
  static const Color cognitiveFlexibility = Color(0xFF269EAC);
  static const Color processingSpeed = Color(0xFF397CD8);
  static const Color logicalReasoning = Color(0xFF8D68CC);
  static const Color visuospatial = Color(0xFF299D76);
  static const Color language = Color(0xFFD16C9B);
  static const Color planning = Color(0xFFB17B39);
  static const Color problemSolving = Color(0xFF56718E);
}
