import 'package:flutter/material.dart';

import '../../app/design_system/design_system.dart';

/// A single selectable tile in the waste-category grid on "Buang
/// Sampah" (e.g. Plastik, Kertas, Kaca, Logam, Organik, Lainnya).
///
/// Also generically useful anywhere else a small icon + label choice
/// grid is needed (marketplace categories, article topics, etc.).
class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
    this.tintColor = AppColors.primary,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Color tintColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.radiusMd,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        decoration: BoxDecoration(
          color: selected ? tintColor.withValues(alpha: 0.10) : AppColors.surface,
          borderRadius: AppRadius.radiusMd,
          border: Border.all(
            color: selected ? tintColor : AppColors.border,
            width: selected ? 1.6 : 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: selected ? tintColor : AppColors.textSecondary),
            const SizedBox(height: AppSpacing.xs),
            Text(
              label,
              style: AppTextStyles.labelMedium.copyWith(
                color: selected ? AppColors.textPrimary : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
