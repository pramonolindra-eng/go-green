import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../app/design_system/design_system.dart';
import '../../app/routes.dart';
import '../../components/illustrations.dart';
import '../../components/manual_illustrations.dart';
import '../../widgets/widgets.dart';

/// Home tab — greeting header, search bar, hero banner, main menu,
/// points summary and a latest-article teaser.
///
/// [onNavigateToTab] lets the hero button and menu cards jump straight
/// to another tab inside [MainNavScreen] (e.g. tapping "Buang Sampah"
/// switches the bottom nav to that tab) instead of only being
/// reachable via the bottom bar itself. It's optional so `HomeScreen`
/// still works if ever previewed/tested on its own.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.onNavigateToTab});

  final ValueChanged<int>? onNavigateToTab;

  // Tab indices inside MainNavScreen — see main_nav_screen.dart.
  static const _tabBuangSampah = 1;
  static const _tabPoinReward = 2;
  static const _tabArtikel = 3;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _HomeHeader(),
          const SizedBox(height: AppSpacing.md),
          AppSearchField(hintText: 'Cari artikel, produk, atau fitur...'),
          const SizedBox(height: AppSpacing.lg),
          _HeroBanner(
            onPressed: () => onNavigateToTab?.call(_tabBuangSampah),
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              Text('Menu Utama', style: AppTextStyles.h4),
              const SizedBox(width: AppSpacing.xs),
              const Opacity(
                opacity: 0.7,
                child: SizedBox(
                  height: 16,
                  width: 16,
                  child: SvgIllustration(AppIllustrations.leafElement),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Expanded(
                child: MenuActionCard(
                  icon: LucideIcons.trash2,
                  label: 'Buang Sampah',
                  onTap: () => onNavigateToTab?.call(_tabBuangSampah),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: MenuActionCard(
                  icon: LucideIcons.award,
                  label: 'Poin & Reward',
                  onTap: () => onNavigateToTab?.call(_tabPoinReward),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: MenuActionCard(
                  icon: LucideIcons.fileText,
                  label: 'Artikel',
                  onTap: () => onNavigateToTab?.call(_tabArtikel),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: MenuActionCard(
                  icon: LucideIcons.store,
                  label: 'Marketplace',
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.marketplace);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          PointsHeroCard(
            points: 1250,
            onHistoryTap: () => onNavigateToTab?.call(_tabPoinReward),
          ),
          const SizedBox(height: AppSpacing.lg),
          SectionHeader(
            title: 'Artikel Terbaru',
            actionLabel: 'Lihat Semua',
            onActionTap: () => onNavigateToTab?.call(_tabArtikel),
          ),
          const SizedBox(height: AppSpacing.sm),
          ArticleCard(
            title: '5 Cara Sederhana Menjaga Lingkungan di Sekitar Kita',
            category: 'Lingkungan',
            date: '28 Agu 2025',
            thumbnailIcon: LucideIcons.leaf,
            thumbnailIllustration: ManualIllustrationType.article,
            onTap: () => onNavigateToTab?.call(_tabArtikel),
          ),
        ],
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hi, Jack!', style: AppTextStyles.h3),
              Text(
                'Small actions, big impact.',
                style: AppTextStyles.bodySmall,
              ),
            ],
          ),
        ),
        AppIconButton(icon: LucideIcons.bell, onPressed: () {}),
        const SizedBox(width: AppSpacing.sm),
        const CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.paleGreen,
          child: Icon(LucideIcons.user, color: AppColors.primary),
        ),
      ],
    );
  }
}

/// The "Buang Sampah, Dapat Poin!" hero banner — dark-green card with
/// a faint oversized recycle icon watermark, and a light CTA button
/// that reads well against the dark fill.
class _HeroBanner extends StatelessWidget {
  const _HeroBanner({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: AppRadius.radiusLg,
          child: Container(
            height: 235,
            color: const Color(0xFFD7EBC8),
            child: Stack(
              children: [
                Positioned.fill(child: CustomPaint(painter: _HeroBackgroundPainter())),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 17, 4, 14),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 11,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                              decoration: BoxDecoration(color: AppColors.primaryDark, borderRadius: BorderRadius.circular(999)),
                              child: Text('Ayo Mulai!', style: AppTextStyles.caption.copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
                            ),
                            const SizedBox(height: 9),
                            Text('Buang Sampah\nDapat Poin!', style: AppTextStyles.h2.copyWith(color: AppColors.darkGreen, height: 1.05)),
                            const SizedBox(height: 8),
                            Text('Jaga lingkungan, kumpulkan poin, tukar dengan reward menarik.', style: AppTextStyles.bodySmall.copyWith(color: AppColors.darkGreen.withValues(alpha: .75), height: 1.25)),
                            const Spacer(),
                            SizedBox(
                              height: 38,
                              child: ElevatedButton.icon(
                                onPressed: onPressed,
                                icon: const Icon(LucideIcons.arrowRight, size: 17),
                                label: const Text('Mulai Sekarang'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryDark,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(horizontal: 14),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 0),
                      const Expanded(
                        flex: 10,
                        child: SizedBox(height: double.infinity, child: ManualIllustration(type: ManualIllustrationType.hero)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            const SizedBox(width: 6),
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.border,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.border,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}



class _HeroBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFFBBDDAE).withValues(alpha: .55);
    final path = Path()..moveTo(0, size.height * .74);
    path.quadraticBezierTo(size.width * .25, size.height * .55, size.width * .5, size.height * .76);
    path.quadraticBezierTo(size.width * .72, size.height * .94, size.width, size.height * .68);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
    final p2 = Paint()..color = Colors.white.withValues(alpha: .18);
    canvas.drawCircle(Offset(size.width * .82, size.height * .17), 42, p2);
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
