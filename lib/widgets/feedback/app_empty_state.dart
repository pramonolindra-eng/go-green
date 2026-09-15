import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../app/design_system/design_system.dart';
import '../buttons/primary_button.dart';

/// Shown when a list/section has nothing to display yet — e.g. no
/// activity history, no search results, empty marketplace category.
///
/// A real illustration (SVG from `assets/illustrations/`) can later
/// replace the [icon] fallback by passing [illustration].
class AppEmptyState extends StatelessWidget {
  const AppEmptyState({
    super.key,
    required this.title,
    this.description,
    this.icon = LucideIcons.leaf,
    this.illustration,
    this.actionLabel,
    this.onActionTap,
  });

  final String title;
  final String? description;
  final IconData icon;
  final Widget? illustration;
  final String? actionLabel;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            illustration ??
                Container(
                  height: 88,
                  width: 88,
                  decoration: const BoxDecoration(
                    color: AppColors.paleGreen,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 36, color: AppColors.primary),
                ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.h4,
            ),
            if (description != null) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(
                description!,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySmall,
              ),
            ],
            if (actionLabel != null) ...[
              const SizedBox(height: AppSpacing.lg),
              PrimaryButton(
                label: actionLabel!,
                onPressed: onActionTap,
                expand: false,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
