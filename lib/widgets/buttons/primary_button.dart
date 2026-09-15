import 'package:flutter/material.dart';

import '../../app/design_system/design_system.dart';

/// The app's main call-to-action button — full-width, pill-shaped,
/// filled with [AppColors.primary].
///
/// Handles its own loading state so screens don't need to swap the
/// child in and out manually:
///
/// ```dart
/// PrimaryButton(
///   label: 'Log In',
///   isLoading: _isSubmitting,
///   onPressed: _submit,
/// )
/// ```
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.leadingIcon,
    this.expand = true,
    this.backgroundColor,
    this.foregroundColor,
  });

  final String label;

  /// Pass `null` to render the button as disabled.
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? leadingIcon;

  /// Whether the button should fill the available width.
  final bool expand;

  /// Override the theme's default green fill — used e.g. on the Home
  /// hero banner, where a light button reads better on a dark green
  /// background than the standard green-on-green would.
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final resolvedForeground = foregroundColor ?? AppColors.textOnDark;

    final child = isLoading
        ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2.4,
              valueColor: AlwaysStoppedAnimation<Color>(resolvedForeground),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (leadingIcon != null) ...[
                Icon(leadingIcon, size: 18, color: resolvedForeground),
                const SizedBox(width: AppSpacing.sm),
              ],
              Text(label),
            ],
          );

    final button = ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: backgroundColor == null && foregroundColor == null
          ? null
          : ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: resolvedForeground,
            ),
      child: child,
    );

    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }
}
