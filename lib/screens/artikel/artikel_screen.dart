import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../app/design_system/design_system.dart';
import '../../components/manual_illustrations.dart';
import '../../widgets/widgets.dart';

class ArtikelScreen extends StatefulWidget {
  const ArtikelScreen({super.key});
  @override State<ArtikelScreen> createState() => _ArtikelScreenState();
}

class _ArtikelScreenState extends State<ArtikelScreen> {
  int _selectedChip = 0;
  static const chips = ['Semua', 'Penghijauan', 'Gaya Hidup', 'Lingkungan'];
  static const data = [
    ('5 Cara Sederhana Menjaga Lingkungan di Sekitar Kita', '28 Agu 2025', ManualIllustrationType.article),
    ('Manfaat Menanam Pohon untuk Kehidupan', '27 Agu 2025', ManualIllustrationType.articleTree),
    ('Tips Mengurangi Sampah Plastik di Rumah', '26 Agu 2025', ManualIllustrationType.articlePlastic),
    ('Mengenal Jenis-Jenis Sampah dan Cara Pengelolaannya', '25 Agu 2025', ManualIllustrationType.waste),
  ];
  @override Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: AppSpacing.md),
      Row(children: [const BackButton(), Text('Artikel', style: AppTextStyles.h4)]),
      const SizedBox(height: AppSpacing.sm),
      AppSearchField(hintText: 'Cari artikel...', onFilterTap: () {}),
      const SizedBox(height: AppSpacing.sm),
      SizedBox(height: 34, child: ListView.separated(scrollDirection: Axis.horizontal, itemCount: chips.length, separatorBuilder: (_, _) => const SizedBox(width: 8), itemBuilder: (_, i) => ChoiceChip(label: Text(chips[i]), selected: i == _selectedChip, onSelected: (_) => setState(() => _selectedChip = i), labelStyle: AppTextStyles.labelMedium.copyWith(color: i == _selectedChip ? Colors.white : AppColors.textSecondary)))),
      const SizedBox(height: AppSpacing.sm),
      Expanded(child: ListView.separated(itemCount: data.length, separatorBuilder: (_, _) => const SizedBox(height: 10), itemBuilder: (_, i) {
        final d = data[i];
        return Material(color: Colors.white, borderRadius: AppRadius.radiusMd, child: InkWell(borderRadius: AppRadius.radiusMd, onTap: () {}, child: Padding(padding: const EdgeInsets.all(8), child: Row(children: [ClipRRect(borderRadius: AppRadius.radiusSm, child: Container(height: 64, width: 64, color: AppColors.paleGreen, child: ManualIllustration(type: d.$3))), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: AppColors.paleGreen, borderRadius: AppRadius.radiusFull), child: Text('Penghijauan', style: AppTextStyles.caption.copyWith(color: AppColors.primary))), const SizedBox(height: 5), Text(d.$1, maxLines: 2, overflow: TextOverflow.ellipsis, style: AppTextStyles.labelMedium.copyWith(fontSize: 12)), const SizedBox(height: 3), Text(d.$2, style: AppTextStyles.caption)])), const Icon(LucideIcons.chevronRight, size: 18, color: AppColors.textSecondary)]))));
      }))
    ]);
  }
}
