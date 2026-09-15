import 'package:flutter/material.dart';

import '../../app/design_system/design_system.dart';

/// Thin wrapper around [Scaffold] that applies the app's standard
/// background color and horizontal page padding, so individual
/// screens don't each re-declare `EdgeInsets.symmetric(horizontal: 16)`.
///
/// Screens that need full-bleed content (e.g. a hero illustration)
/// can set [applyHorizontalPadding] to false and handle their own
/// padding per-section instead.
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.applyHorizontalPadding = true,
    this.backgroundColor = AppColors.background,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool applyHorizontalPadding;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        child: applyHorizontalPadding
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.pageHorizontal,
                ),
                child: body,
              )
            : body,
      ),
    );
  }
}
