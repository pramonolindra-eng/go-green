import 'package:flutter/material.dart';

/// Centralized color palette for Go Green.
///
/// Palette direction: natural green, dark forest green, soft green,
/// cream, white and soft gray — clean, modern, eco-friendly, premium
/// but approachable.
///
/// Usage: `AppColors.primary`, `AppColors.textSecondary`, etc.
/// Never hardcode a `Color(0x...)` value inside a screen or widget —
/// add it here first so the whole app stays in sync.
abstract class AppColors {
  AppColors._();

  // ---------------------------------------------------------------------
  // Brand greens
  // ---------------------------------------------------------------------

  /// Main brand green — primary buttons, active nav items, key accents.
  static const Color primary = Color(0xFF2E7D4F);

  /// Slightly deeper tone of primary, used for pressed/hover states.
  static const Color primaryDark = Color(0xFF23643E);

  /// Deep forest green — headlines on light backgrounds, dark surfaces,
  /// splash-screen backgrounds, high-emphasis text on cream.
  static const Color darkGreen = Color(0xFF163A2B);

  /// Soft, muted green — secondary accents, chips, subtle fills.
  static const Color lightGreen = Color(0xFFB7DEC0);

  /// Very pale green — tinted card backgrounds (e.g. points balance card).
  static const Color paleGreen = Color(0xFFE7F4EA);

  // ---------------------------------------------------------------------
  // Neutrals
  // ---------------------------------------------------------------------

  /// App scaffold background — soft cream, not pure white.
  static const Color background = Color(0xFFF6F7F1);

  /// Card / sheet / app-bar surface color.
  static const Color surface = Color(0xFFFFFFFF);

  /// Alternate cream surface for illustrated / hero sections.
  static const Color cream = Color(0xFFF3F1E7);

  /// Hairline dividers, input borders, unselected outlines.
  static const Color border = Color(0xFFE3E6DF);

  /// Soft gray fill (e.g. disabled states, skeletons, icon chips).
  static const Color surfaceMuted = Color(0xFFF0F1EC);

  // ---------------------------------------------------------------------
  // Text
  // ---------------------------------------------------------------------

  static const Color textPrimary = Color(0xFF1B231E);
  static const Color textSecondary = Color(0xFF6B756E);
  static const Color textDisabled = Color(0xFFA6ADA5);

  /// Text placed on top of a solid dark/green background.
  static const Color textOnDark = Color(0xFFFFFFFF);

  // ---------------------------------------------------------------------
  // Semantic
  // ---------------------------------------------------------------------

  static const Color success = Color(0xFF2E7D4F);
  static const Color warning = Color(0xFFE0A93A);
  static const Color error = Color(0xFFD9534F);
  static const Color info = Color(0xFF3B82C4);

  // ---------------------------------------------------------------------
  // Category tint colors (waste / marketplace categories, chips, etc.)
  // ---------------------------------------------------------------------

  static const Color tintPlastic = Color(0xFF4CAF7D);
  static const Color tintPaper = Color(0xFF8D6E63);
  static const Color tintGlass = Color(0xFF4FA9C9);
  static const Color tintMetal = Color(0xFF9AA5B1);
  static const Color tintOrganic = Color(0xFF8BC34A);
  static const Color tintOther = Color(0xFFB79ACC);

  /// Subtle shadow color used with low opacity for card elevation.
  static const Color shadow = Color(0xFF163A2B);
}
