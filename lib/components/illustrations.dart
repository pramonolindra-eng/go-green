import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Central registry of every illustration asset path in
/// `assets/illustrations/`.
///
/// Screens should reference these constants instead of hardcoding
/// asset path strings, so a renamed/moved file only needs updating in
/// one place.
abstract class AppIllustrations {
  AppIllustrations._();

  // ---------------------------------------------------------------------
  // Main scene illustrations — one per primary screen.
  // ---------------------------------------------------------------------

  static const heroHome = 'assets/illustrations/hero_home.svg';
  static const throwingTrash = 'assets/illustrations/throwing_trash.svg';
  static const reward = 'assets/illustrations/reward.svg';
  static const article = 'assets/illustrations/article.svg';
  static const marketplace = 'assets/illustrations/marketplace_bag.svg';
  static const supplier = 'assets/illustrations/supplier.svg';
  static const activity = 'assets/illustrations/activity.svg';
  static const profile = 'assets/illustrations/profile.svg';

  // ---------------------------------------------------------------------
  // Reusable decorative / utility assets.
  // ---------------------------------------------------------------------

  static const plantDecor = 'assets/illustrations/plant_decor.svg';
  static const leafElement = 'assets/illustrations/leaf_element.svg';
  static const recycleSymbol = 'assets/illustrations/recycle_symbol.svg';
  static const earthIllustration = 'assets/illustrations/earth_illustration.svg';
  static const ecoCommunity = 'assets/illustrations/eco_community.svg';
  static const natureBackground = 'assets/illustrations/nature_background.svg';
  static const emptyState = 'assets/illustrations/empty_state.svg';
  static const loading = 'assets/illustrations/loading.svg';
}

/// Thin wrapper around [SvgPicture.asset] with a sane default
/// `BoxFit` and a [height]-only sizing pattern that matches how
/// illustrations are placed across the app (see
/// `SizedBox(height: ..., child: SvgIllustration(...))` usage in the
/// screens).
///
/// Keeping this in one place means every illustration gets the same
/// `fit` and error-handling behavior without repeating
/// `SvgPicture.asset(..., fit: BoxFit.contain)` everywhere.
class SvgIllustration extends StatelessWidget {
  const SvgIllustration(
    this.assetName, {
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
  });

  final String assetName;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    if (assetName.toLowerCase().endsWith('.png') ||
        assetName.toLowerCase().endsWith('.jpg') ||
        assetName.toLowerCase().endsWith('.jpeg')) {
      return Image.asset(
        assetName,
        height: height,
        width: width,
        fit: fit,
        alignment: alignment,
        filterQuality: FilterQuality.high,
      );
    }
    return SvgPicture.asset(
      assetName,
      height: height,
      width: width,
      fit: fit,
      alignment: alignment,
    );
  }
}

/// Faint corner leaf clusters used behind the Login / Sign Up forms,
/// echoing the reference design's plant decorations. Purely
/// decorative — wrapped in [IgnorePointer] so it never intercepts
/// taps meant for the form above it.
class AuthLeafDecoration extends StatelessWidget {
  const AuthLeafDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            left: -18,
            bottom: -12,
            child: Opacity(
              opacity: 0.5,
              child: Transform.rotate(
                angle: -0.3,
                child: const SizedBox(
                  height: 90,
                  width: 90,
                  child: SvgIllustration(AppIllustrations.leafElement),
                ),
              ),
            ),
          ),
          Positioned(
            right: -10,
            bottom: 10,
            child: Opacity(
              opacity: 0.35,
              child: Transform.rotate(
                angle: 2.4,
                child: const SizedBox(
                  height: 60,
                  width: 60,
                  child: SvgIllustration(AppIllustrations.leafElement),
                ),
              ),
            ),
          ),
          Positioned(
            right: 40,
            bottom: -20,
            child: Opacity(
              opacity: 0.6,
              child: const SizedBox(
                height: 80,
                width: 80,
                child: SvgIllustration(AppIllustrations.plantDecor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
