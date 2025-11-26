import 'package:flutter/material.dart';

class NIMSButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool loading;

  const NIMSButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: loading ? null : onPressed,
        child: loading
            ? SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            : Text(text),
      ),
    );
  }
}
