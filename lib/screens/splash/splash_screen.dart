import 'package:flutter/material.dart';

import '../../app/design_system/design_system.dart';
import '../../app/routes.dart';
import '../../components/illustrations.dart';
import '../../components/manual_illustrations.dart';

/// Splash screen — brand mark, tagline, auto-advances to Login.
///
/// The hand-cradling-a-globe-with-leaves illustration is
/// `assets/illustrations/earth_illustration.svg`, rendered by
/// `_BrandGlobeIllustration` below.
///
/// Entrance is a subtle fade + upward slide for the brand text, and a
/// fade + scale-in for the illustration, driven by a single
/// [AnimationController] so everything stays in sync.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _textSlide;
  late final Animation<double> _illustrationScale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _textSlide = Tween<Offset>(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _illustrationScale = Tween<double>(begin: 0.85, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.login);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.xl,
          ),
          child: Column(
            children: [
              const Spacer(flex: 2),
              FadeTransition(
                opacity: _fade,
                child: SlideTransition(
                  position: _textSlide,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 42,
                        width: 52,
                        child: SvgIllustration(AppIllustrations.leafElement),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text('Go Green', style: AppTextStyles.h1),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        'Small Actions, Big Impact',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(flex: 3),
              FadeTransition(
                opacity: _fade,
                child: ScaleTransition(
                  scale: _illustrationScale,
                  child: const _BrandGlobeIllustration(),
                ),
              ),
              const Spacer(flex: 3),
              FadeTransition(opacity: _fade, child: const _ProgressDots()),
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),
    );
  }
}

/// Hand-cradling-a-globe-with-leaves illustration used on the splash
/// screen, from `assets/illustrations/earth_illustration.svg`.
class _BrandGlobeIllustration extends StatelessWidget {
  const _BrandGlobeIllustration();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 255,
      width: 255,
      child: ManualIllustration(type: ManualIllustrationType.splash),
    );
  }
}

class _ProgressDots extends StatelessWidget {
  const _ProgressDots();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        final active = index == 0;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          height: 6,
          width: active ? 20 : 6,
          decoration: BoxDecoration(
            color: active ? AppColors.primary : AppColors.border,
            borderRadius: AppRadius.radiusFull,
          ),
        );
      }),
    );
  }
}
