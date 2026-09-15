import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../widgets/widgets.dart';
import '../artikel/artikel_screen.dart';
import '../buang_sampah/buang_sampah_screen.dart';
import '../home/home_screen.dart';
import '../poin_reward/poin_reward_screen.dart';
import '../profile/profile_screen.dart';

/// The main app shell: bottom navigation across the five primary
/// destinations — Home, Buang Sampah, Poin & Reward, Artikel, Profil.
///
/// Marketplace is intentionally NOT a tab here — it's reached by
/// pushing `AppRoutes.marketplace` from a Home quick action, since the
/// reference flow treats it as a secondary destination with its own
/// back button. See `app/routes.dart` for the reasoning; flip that
/// decision by adding a sixth [NavItemData] + screen here if the real
/// product decision lands differently.
class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _currentIndex = 0;

  static const _navItems = [
    NavItemData(icon: LucideIcons.house, activeIcon: LucideIcons.house, label: 'Home'),
    NavItemData(icon: LucideIcons.trash2, activeIcon: LucideIcons.trash2, label: 'Buang Sampah'),
    NavItemData(icon: LucideIcons.award, activeIcon: LucideIcons.award, label: 'Poin'),
    NavItemData(icon: LucideIcons.fileText, activeIcon: LucideIcons.fileText, label: 'Artikel'),
    NavItemData(icon: LucideIcons.user, activeIcon: LucideIcons.user, label: 'Profil'),
  ];

  /// Passed down to [HomeScreen] so its hero button and menu cards can
  /// jump straight to another tab instead of only navigating via the
  /// bottom bar.
  void _goToTab(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    final tabs = [
      HomeScreen(onNavigateToTab: _goToTab),
      const BuangSampahScreen(),
      const PoinRewardScreen(),
      const ArtikelScreen(),
      const ProfileScreen(),
    ];

    return AppScaffold(
      body: IndexedStack(index: _currentIndex, children: tabs),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        items: _navItems,
        onTap: _goToTab,
      ),
    );
  }
}
