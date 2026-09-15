import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../app/design_system/design_system.dart';
import '../../components/manual_illustrations.dart';
import '../../widgets/widgets.dart';

/// Poin & Reward tab — balance card, Reward/Riwayat Poin toggle, and
/// a list of redeemable rewards.
class PoinRewardScreen extends StatefulWidget {
  const PoinRewardScreen({super.key});

  @override
  State<PoinRewardScreen> createState() => _PoinRewardScreenState();
}

class _PoinRewardScreenState extends State<PoinRewardScreen> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Poin & Reward', style: AppTextStyles.h3),
          const SizedBox(height: AppSpacing.sm),
          Container(
            height: 82,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.paleGreen,
              borderRadius: AppRadius.radiusLg,
            ),
            child: Stack(
              children: [
                const Positioned(right: -2, top: -8, width: 145, height: 100, child: ManualIllustration(type: ManualIllustrationType.reward)),
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Row(children: [
                    const CircleAvatar(backgroundColor: AppColors.primary, child: Icon(LucideIcons.leaf, color: Colors.white, size: 18)),
                    const SizedBox(width: AppSpacing.sm),
                    Text('Total Poin Kamu\n1.250', style: AppTextStyles.h4.copyWith(color: AppColors.darkGreen)),
                  ]),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          const PointsBalanceCard(points: 1250, label: 'Total Poin Kamu'),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: _ToggleButton(
                  label: 'Reward',
                  selected: _tabIndex == 0,
                  onTap: () => setState(() => _tabIndex = 0),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: _ToggleButton(
                  label: 'Riwayat Poin',
                  selected: _tabIndex == 1,
                  onTap: () => setState(() => _tabIndex = 1),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Tukar Poin dengan Reward', style: AppTextStyles.h4),
          const SizedBox(height: AppSpacing.sm),
          if (_tabIndex == 0)
            Column(
              children: [
                const _RewardRow(type: ManualIllustrationType.marketplacePlant, title: 'Tumbler Ramah Lingkungan', points: '500 Poin'),
                const _RewardRow(type: ManualIllustrationType.marketplacePlant, title: 'Bibit Tanaman', points: '1.000 Poin'),
                const _RewardRow(type: ManualIllustrationType.reward, title: 'Voucher Belanja Hijau', points: '1.500 Poin'),
              ],
            )
          else
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(color: AppColors.surface, borderRadius: AppRadius.radiusLg),
              child: Row(children: [const Icon(LucideIcons.history, color: AppColors.primary), const SizedBox(width: AppSpacing.md), Expanded(child: Text('Belum ada riwayat poin.', style: AppTextStyles.bodyMedium))]),
            ),
        ],
      ),
    );
  }
}

class _ToggleButton extends StatelessWidget {
  const _ToggleButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.radiusFull,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.surfaceMuted,
          borderRadius: AppRadius.radiusFull,
        ),
        child: Text(
          label,
          style: AppTextStyles.labelMedium.copyWith(
            color: selected ? AppColors.textOnDark : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}


class _RewardRow extends StatelessWidget {
  const _RewardRow({required this.type, required this.title, required this.points});
  final ManualIllustrationType type;
  final String title;
  final String points;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: AppRadius.radiusMd),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: AppRadius.radiusSm,
            child: Container(color: AppColors.paleGreen, height: 54, width: 54, child: ManualIllustration(type: type)),
          ),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: AppTextStyles.labelMedium),
            const SizedBox(height: 4),
            Text(points, style: AppTextStyles.caption.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600)),
          ])),
          const SizedBox(width: 8),
          SizedBox(
            width: 62,
            height: 36,
            child: OutlinedButton(onPressed: () {}, style: OutlinedButton.styleFrom(padding: EdgeInsets.zero), child: const Text('Tukar')),
          ),
        ],
      ),
    );
  }
}
