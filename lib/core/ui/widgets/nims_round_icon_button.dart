import 'package:flutter/material.dart';

class NIMSRoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const NIMSRoundIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      customBorder: CircleBorder(),
      onTap: onPressed,
      child: Container(
        padding: EdgeInsetsGeometry.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: BoxBorder.fromBorderSide(
            BorderSide(
              color: Theme.of(context).colorScheme.outline,
              width: 0.5,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
        ),
        child: Icon(icon, size: 16),
      ),
    );
  }
}
