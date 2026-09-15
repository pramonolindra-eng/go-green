import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../app/design_system/design_system.dart';
import '../../components/manual_illustrations.dart';
import '../../widgets/widgets.dart';

/// Buang Sampah tab — pick a waste category, then attach photo
/// documentation for verification.
///
/// Category selection state lives here for now; once `models/` has a
/// `WasteCategory` enum and `services/` can submit reports, this
/// becomes the entry point to that flow.
class BuangSampahScreen extends StatefulWidget {
  const BuangSampahScreen({super.key});

  @override
  State<BuangSampahScreen> createState() => _BuangSampahScreenState();
}

class _BuangSampahScreenState extends State<BuangSampahScreen> {
  int? _selectedIndex = 0;

  static const _categories = <(IconData icon, String label)>[
    (LucideIcons.recycle, 'Plastik'),
    (LucideIcons.fileText, 'Kertas'),
    (LucideIcons.wine, 'Kaca'),
    (LucideIcons.circle, 'Logam'),
    (LucideIcons.leaf, 'Organik'),
    (LucideIcons.ellipsis, 'Lainnya'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [const BackButton(), Text('Buang Sampah', style: AppTextStyles.h4)]),
          const SizedBox(height: AppSpacing.xxs),
          Text(
            'Pilih jenis sampah yang akan kamu buang\ndan unggah foto sebagai dokumentasi.',
            style: AppTextStyles.bodySmall,
          ),
          const SizedBox(height: AppSpacing.lg),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: AppSpacing.sm,
              crossAxisSpacing: AppSpacing.sm,
              childAspectRatio: 1.1,
            ),
            itemBuilder: (context, index) {
              final category = _categories[index];
              return CategoryTile(
                icon: category.$1,
                label: category.$2,
                selected: _selectedIndex == index,
                onTap: () => setState(() => _selectedIndex = index),
              );
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          DottedDocumentationBox(onTap: () {}),
          const SizedBox(height: AppSpacing.lg),
          PrimaryButton(
            label: 'Kirim',
            onPressed: _selectedIndex == null ? null : () {},
          ),
          const SizedBox(height: 4),
          const SizedBox(height: 78, width: double.infinity, child: ManualIllustration(type: ManualIllustrationType.leaves)),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}

/// Dashed-border upload box for the documentation photo — placeholder
/// for now; wiring to `image_picker` (or similar) happens once camera
/// access is prioritized.
class DottedDocumentationBox extends StatelessWidget {
  const DottedDocumentationBox({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.radiusMd,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
        decoration: BoxDecoration(
          color: AppColors.surfaceMuted,
          borderRadius: AppRadius.radiusMd,
          border: Border.all(color: AppColors.border, width: 1.4),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(LucideIcons.camera, color: AppColors.textSecondary),
            const SizedBox(height: AppSpacing.xs),
            Text('Foto Dokumentasi', style: AppTextStyles.labelMedium),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              'Ambil foto atau pilih dari galeri',
              style: AppTextStyles.caption,
            ),
          ],
        ),
      ),
    );
  }
}
