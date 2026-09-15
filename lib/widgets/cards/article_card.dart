import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../app/design_system/design_system.dart';
import '../../components/manual_illustrations.dart';

/// A single article row: thumbnail, category, title, date and a
/// trailing arrow — used for the "Artikel Terbaru" teaser on Home.
///
/// [thumbnailIcon] stands in for a real cover photo until articles
/// have actual images; swap the `Container` below for an `Image`/
/// `CachedNetworkImage` once `models/article.dart` and real data
/// exist.
class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.title,
    required this.category,
    required this.date,
    this.thumbnailIcon = LucideIcons.leaf,
    this.imageAsset,
    this.thumbnailIllustration,
    this.onTap,
  });

  final String title;
  final String category;
  final String date;
  final IconData thumbnailIcon;
  final String? imageAsset;
  final ManualIllustrationType? thumbnailIllustration;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: AppRadius.radiusLg,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            borderRadius: AppRadius.radiusLg,
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow.withValues(alpha: 0.05),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  color: AppColors.paleGreen,
                  borderRadius: AppRadius.radiusMd,
                ),
                child: thumbnailIllustration != null
                    ? ManualIllustration(type: thumbnailIllustration!)
                    : imageAsset != null
                        ? Image.asset(imageAsset!, fit: BoxFit.cover, filterQuality: FilterQuality.high)
                        : Icon(thumbnailIcon, color: AppColors.primary, size: 26),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      category,
                      style: AppTextStyles.labelMedium.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(date, style: AppTextStyles.caption),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.xs),
              const Icon(
                LucideIcons.chevronRight,
                size: 18,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
