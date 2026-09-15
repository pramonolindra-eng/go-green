import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../app/design_system/design_system.dart';
import 'app_text_field.dart';

/// Search bar used at the top of Artikel and Marketplace screens.
class AppSearchField extends StatelessWidget {
  const AppSearchField({
    super.key,
    this.controller,
    this.hintText = 'Cari...',
    this.onChanged,
    this.onFilterTap,
  });

  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;

  /// Optional trailing filter/sort icon action (funnel icon in the
  /// reference marketplace/article screens).
  final VoidCallback? onFilterTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppTextField(
            controller: controller,
            hintText: hintText,
            prefixIcon: LucideIcons.search,
            onChanged: onChanged,
          ),
        ),
        if (onFilterTap != null) ...[
          const SizedBox(width: AppSpacing.sm),
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: AppColors.surfaceMuted,
              borderRadius: AppRadius.radiusMd,
            ),
            child: IconButton(
              onPressed: onFilterTap,
              icon: const Icon(LucideIcons.slidersHorizontal, size: 20),
            ),
          ),
        ],
      ],
    );
  }
}
