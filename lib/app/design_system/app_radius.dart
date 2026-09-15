import 'package:flutter/material.dart';

/// Centralized corner-radius scale for Go Green.
///
/// The reference UI leans on generously rounded cards, chips and
/// buttons — these constants keep that language consistent everywhere.
abstract class AppRadius {
  AppRadius._();

  static const double xs = 6;
  static const double sm = 10;
  static const double md = 16;
  static const double lg = 20;
  static const double xl = 28;

  /// Fully rounded — pills, circular icon chips, avatar frames.
  static const double full = 999;

  static BorderRadius get radiusXs => BorderRadius.circular(xs);
  static BorderRadius get radiusSm => BorderRadius.circular(sm);
  static BorderRadius get radiusMd => BorderRadius.circular(md);
  static BorderRadius get radiusLg => BorderRadius.circular(lg);
  static BorderRadius get radiusXl => BorderRadius.circular(xl);
  static BorderRadius get radiusFull => BorderRadius.circular(full);
}
