import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Centralized typography for Go Green.
///
/// Headings use Poppins (SemiBold/Bold) for a friendly-but-premium feel,
/// body copy uses Inter for clean readability at small sizes.
///
/// These are the raw text styles — for widgets, prefer reading them via
/// `Theme.of(context).textTheme` once `AppTheme` wires them in, and only
/// reach for `AppTextStyles` directly when you need a one-off variant
/// (e.g. a colored/underlined link).
abstract class AppTextStyles {
  AppTextStyles._();

  static TextStyle get _headingBase => GoogleFonts.poppins(
        color: AppColors.textPrimary,
        height: 1.25,
      );

  static TextStyle get _bodyBase => GoogleFonts.inter(
        color: AppColors.textPrimary,
        height: 1.45,
      );

  // ---------------------------------------------------------------------
  // Display / Headings
  // ---------------------------------------------------------------------

  static TextStyle get h1 => _headingBase.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get h2 => _headingBase.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get h3 => _headingBase.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get h4 => _headingBase.copyWith(
        fontSize: 17,
        fontWeight: FontWeight.w600,
      );

  // ---------------------------------------------------------------------
  // Body
  // ---------------------------------------------------------------------

  static TextStyle get bodyLarge => _bodyBase.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get bodyMedium => _bodyBase.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get bodySmall => _bodyBase.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      );

  // ---------------------------------------------------------------------
  // Emphasis / UI text
  // ---------------------------------------------------------------------

  static TextStyle get labelLarge => _bodyBase.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelMedium => _bodyBase.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get button => _bodyBase.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.textOnDark,
      );

  static TextStyle get caption => _bodyBase.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      );

  static TextStyle get link => _bodyBase.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      );
}
