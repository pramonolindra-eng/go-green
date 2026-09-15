import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../app/design_system/design_system.dart';
import '../../components/manual_illustrations.dart';
import '../../utils/formatters.dart';

/// Soft-green "Total Poin Kamu" summary card for the Home screen.
///
/// Deliberately a separate widget from [PointsBalanceCard] (which
/// stays dark-green and keeps living on Poin & Reward / Profile) —
/// Home calls for a lighter, more illustrative treatment, and forking
/// the widget avoids changing how those other screens already look.
class PointsHeroCard extends StatelessWidget {
  const PointsHeroCard({
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
        color: AppColors.paleGreen,
        borderRadius: AppRadius.radiusLg,
        border: Border.all(color: AppColors.lightGreen, width: 1),
      ),
      child: Stack(
        children: [
          // Soft decorative illustration — the reward/coins scene
          // peeking from behind the content, echoing the Poin &
          // Reward tab's illustration language.
          Positioned(
            right: -16,
            top: -20,
            child: Opacity(
              opacity: 0.16,
              child: SizedBox(
                height: 110,
                width: 140,
                child: ManualIllustration(type: ManualIllustrationType.reward),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  LucideIcons.award,
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
                        color: AppColors.darkGreen,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      formatPoints(points),
                      style: AppTextStyles.h2.copyWith(color: AppColors.darkGreen),
                    ),
                  ],
                ),
              ),
              if (onHistoryTap != null)
                TextButton.icon(
                  onPressed: onHistoryTap,
                  style: TextButton.styleFrom(foregroundColor: AppColors.primary),
                  icon: const Text('Lihat Riwayat'),
                  label: const Icon(LucideIcons.chevronRight, size: 16),
                  iconAlignment: IconAlignment.end,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
