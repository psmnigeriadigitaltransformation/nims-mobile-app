import 'package:flutter/material.dart';

class NIMSPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool loading;
  final bool enabled;

  const NIMSPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.loading = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
      child: SizedBox(
        width: double.infinity,
        child: FilledButton(
          style: Theme.of(context).filledButtonTheme.style?.copyWith(
            backgroundColor: enabled
                ? Theme.of(context).filledButtonTheme.style?.backgroundColor
                : WidgetStateProperty.all(
                    Theme.of(context).colorScheme.tertiaryContainer,
                  ),
          ),
          onPressed: loading
              ? null
              : enabled
              ? onPressed
              : null,
          child: loading
              ? SizedBox(
                  height: 22,
                  width: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : Text(text),
        ),
      ),
    );
  }
}
