import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui/widgets/nims_error_button.dart';
import '../../../../core/ui/widgets/nims_round_icon_button.dart';
import '../../../../core/ui/widgets/nims_secondary_button.dart';
import 'nims_primary_button.dart';

class NIMSAlertDialog extends StatelessWidget {
  final String message;
  final VoidCallback onTapActionButton;
  final String actionButtonLabel;
  final bool showCancelButton;

  const NIMSAlertDialog({
    super.key,
    required this.message,
    required this.onTapActionButton,
    required this.actionButtonLabel,
    this.showCancelButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showCancelButton)
              Row(
                children: [
                  NIMSRoundIconButton(
                    icon: Icons.close,
                    onPressed: context.pop,
                  ),
                  Spacer(),
                  SizedBox(width: 40),
                ],
              ),

            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              child: Text(
                "Alert",
                style: TextTheme.of(context).titleSmall,
                textAlign: TextAlign.center,
              ),
            ),

            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              child: Text(
                message,
                maxLines: 3,
                style: TextTheme.of(context).bodySmall,
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 40),

            /// -------------------------------
            /// CONFIRM + CANCEL BUTTONS
            /// -------------------------------
            NIMSPrimaryButton(text: actionButtonLabel, onPressed: onTapActionButton),

            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
