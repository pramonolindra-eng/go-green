import 'package:flutter/widgets.dart';

/// Data for a single [AppBottomNavBar] destination.
@immutable
class NavItemData {
  const NavItemData({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
}
