import 'package:flutter/material.dart';

import '../../app/design_system/design_system.dart';

/// A lower-emphasis companion to [PrimaryButton] — outlined, transparent
/// fill. Used for secondary actions like "Batal" next to a primary
/// "Simpan"/"Kirim".
class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.leadingIcon,
    this.expand = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? leadingIcon;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final button = OutlinedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leadingIcon != null) ...[
            Icon(leadingIcon, size: 18, color: AppColors.darkGreen),
            const SizedBox(width: AppSpacing.sm),
          ],
          Text(label),
        ],
      ),
    );

    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }
}
