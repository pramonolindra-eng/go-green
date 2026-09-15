import 'package:flutter/material.dart';

import '../screens/auth/login_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/main_nav/main_nav_screen.dart';
import '../screens/marketplace/marketplace_screen.dart';
import '../screens/splash/splash_screen.dart';

/// Centralized route name constants for Go Green.
///
/// Keeping these as constants (instead of raw strings scattered across
/// `Navigator.pushNamed(...)` calls) avoids typos and makes it easy to
/// see every route the app supports in one place.
abstract class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';

  /// The main bottom-nav shell (Home, Buang Sampah, Poin & Reward,
  /// Artikel, Profil).
  static const String main = '/main';

  /// Pushed on top of the shell — reached from a quick action on Home
  /// or from a marketplace card, rather than being one of the five
  /// bottom-nav tabs. See `screens/main_nav/main_nav_screen.dart` for
  /// the tab list.
  static const String marketplace = '/marketplace';

  /// Waste submission flow (category pick + photo documentation +
  /// verification). Currently lives as a tab inside [main] rather than
  /// being pushed on its own — kept here as a reserved name in case a
  /// standalone "report waste" deep link is needed later.
  static const String buangSampah = '/buang-sampah';

  /// Maps a route name to the screen that should be pushed for it.
  ///
  /// Wired into `MaterialApp.onGenerateRoute` in `app/app.dart`. Add a
  /// new `case` here whenever a new top-level route is introduced —
  /// screens nested inside [MainNavScreen]'s tabs don't need an entry.
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case main:
        return MaterialPageRoute(builder: (_) => const MainNavScreen());
      case marketplace:
        return MaterialPageRoute(builder: (_) => const MarketplaceScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Route "${settings.name}" not found')),
          ),
        );
    }
  }
}
