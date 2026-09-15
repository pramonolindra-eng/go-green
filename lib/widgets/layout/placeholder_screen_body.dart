import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../app/design_system/design_system.dart';

/// Generic "not built yet" body for screens that only need to exist
/// for navigation-wiring purposes at this stage of the project.
///
/// Once a screen's real UI is implemented, delete the
/// [PlaceholderScreenBody] call inside it and build the real layout
/// in its place — the route/tab wiring around it does not need to
/// change.
class PlaceholderScreenBody extends StatelessWidget {
  const PlaceholderScreenBody({
    super.key,
    required this.title,
    this.icon = LucideIcons.wrench,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 72,
            width: 72,
            decoration: const BoxDecoration(
              color: AppColors.paleGreen,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primary, size: 30),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(title, style: AppTextStyles.h4),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Layar ini akan dibangun pada tahap berikutnya.',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySmall,
          ),
        ],
      ),
    );
  }
}
