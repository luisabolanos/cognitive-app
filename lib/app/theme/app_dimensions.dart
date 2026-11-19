/// Dimensiones, espaciados, radios y breakpoints (Design System V1.0 - Secciones 5, 7.3 y 8).
abstract final class AppDimensions {
  // 5.1. Tokens de espaciado
  static const double spacing1 = 4.0;
  static const double spacing2 = 8.0;
  static const double spacing3 = 12.0;
  static const double spacing4 = 16.0;
  static const double spacing5 = 20.0;
  static const double spacing6 = 24.0;
  static const double spacing8 = 32.0;
  static const double spacing10 = 40.0;
  static const double spacing12 = 48.0;

  // Alias semanticos (7.3)
  static const double xs = spacing1;
  static const double sm = spacing2;
  static const double md = spacing4;
  static const double lg = spacing6;
  static const double xl = spacing8;
  static const double xxl = spacing12;

  static const double spaceXS = spacing1;
  static const double spaceS = spacing2;
  static const double spaceM = spacing4;
  static const double spaceL = spacing6;
  static const double spaceXL = spacing8;
  static const double spaceXXL = spacing12;

  // 5.2. Border radius por componente
  static const double inputRadius = 12.0;
  static const double buttonRadius = 14.0;
  static const double cardRadius = 20.0;
  static const double featuredCardRadius = 24.0;
  static const double modalRadius = 28.0;
  static const double chipRadius = 100.0;

  static const double radiusS = 8.0;
  static const double radiusM = inputRadius;
  static const double radiusL = cardRadius;
  static const double radiusXL = featuredCardRadius;

  // 5.3. Alturas y tamaños de componentes
  static const double smallButtonHeight = 40.0;
  static const double buttonHeight = 52.0;
  static const double gameButtonHeight = 64.0;
  static const double inputHeight = 54.0;
  static const double bottomNavigationHeight = 72.0;

  static const double iconSizeS = 18.0;
  static const double iconSizeM = 22.0;
  static const double iconSizeL = 28.0;

  // 8. Responsive Design & Breakpoints
  static const double mobileBreakpoint = 600.0;
  static const double tabletBreakpoint = 900.0;
  static const double wideDesktopBreakpoint = 1200.0;

  static const double maxContentWidth = 1200.0;
  static const double gameArenaMaxWidth = 560.0;
  static const double mobileHorizontalPadding = 20.0;
}
