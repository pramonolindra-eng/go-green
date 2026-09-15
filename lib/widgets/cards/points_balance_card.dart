import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../app/design_system/design_system.dart';
import '../../utils/formatters.dart';

/// The green "Total Poin Kamu" balance card seen on Home, Poin & Reward
/// and Profile. Kept as one widget so the points display never drifts
/// out of sync between screens.
class PointsBalanceCard extends StatelessWidget {
  const PointsBalanceCard({
    super.key,
    required this.points,
    this.label = 'Total Poin Kamu',
    this.onHistoryTap,
  });

  final int points;
  final String label;
  final VoidCallback? onHistoryTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.darkGreen,
        borderRadius: AppRadius.radiusLg,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              LucideIcons.leaf,
              color: AppColors.textOnDark,
              size: 20,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.lightGreen,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  formatPoints(points),
                  style: AppTextStyles.h2.copyWith(color: AppColors.textOnDark),
                ),
              ],
            ),
          ),
          if (onHistoryTap != null)
            TextButton.icon(
              onPressed: onHistoryTap,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.textOnDark,
              ),
              icon: const Text('Lihat Riwayat'),
              label: const Icon(LucideIcons.chevronRight, size: 16),
              iconAlignment: IconAlignment.end,
            ),
        ],
      ),
    );
  }
}
