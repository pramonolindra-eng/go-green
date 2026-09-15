import 'package:flutter/material.dart';

import '../../app/design_system/design_system.dart';

/// Small circular icon button with a soft border — used for things like
/// the social-login row on the Login screen, or a leading back action.
class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = AppColors.surface,
    this.iconColor = AppColors.textPrimary,
    this.size = 44,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      shape: const CircleBorder(side: BorderSide(color: AppColors.border)),
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: size,
          height: size,
          child: Icon(icon, size: size * 0.45, color: iconColor),
        ),
      ),
    );
  }
}
