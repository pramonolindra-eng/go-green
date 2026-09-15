import 'package:flutter/material.dart';

import '../../app/design_system/design_system.dart';
import '../../components/illustrations.dart';

/// Standard centered loading indicator, tinted to the brand green.
/// Use inside a screen body while data is being fetched.
///
/// Renders `assets/illustrations/loading.svg` (a dashed ring around a
/// leaf) and continuously rotates it — a friendlier, on-brand stand-in
/// for a bare [CircularProgressIndicator].
class AppLoadingIndicator extends StatefulWidget {
  const AppLoadingIndicator({super.key, this.message});

  final String? message;

  @override
  State<AppLoadingIndicator> createState() => _AppLoadingIndicatorState();
}

class _AppLoadingIndicatorState extends State<AppLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1100),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RotationTransition(
            turns: _controller,
            child: const SizedBox(
              height: 48,
              width: 48,
              child: SvgIllustration(AppIllustrations.loading),
            ),
          ),
          if (widget.message != null) ...[
            const SizedBox(height: AppSpacing.md),
            Text(widget.message!, style: AppTextStyles.bodySmall),
          ],
        ],
      ),
    );
  }
}
