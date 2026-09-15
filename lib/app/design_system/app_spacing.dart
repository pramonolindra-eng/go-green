/// Centralized spacing scale for Go Green.
///
/// Based on a 4px unit so paddings, gaps and margins stay consistent
/// across every screen. Prefer these constants over magic numbers.
///
/// Usage: `SizedBox(height: AppSpacing.md)`,
/// `EdgeInsets.all(AppSpacing.lg)`.
abstract class AppSpacing {
  AppSpacing._();

  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
  static const double xxxl = 64;

  /// Standard horizontal page padding used on most screens.
  static const double pageHorizontal = md;

  /// Standard vertical padding for the top safe area content.
  static const double pageVertical = md;
}
