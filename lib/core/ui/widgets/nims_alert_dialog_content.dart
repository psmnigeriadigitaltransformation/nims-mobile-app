import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui/widgets/nims_error_button.dart';
import '../../../../core/ui/widgets/nims_round_icon_button.dart';
import '../../../../core/ui/widgets/nims_secondary_button.dart';
import 'nims_primary_button.dart';

class NIMSAlertDialogContent extends StatelessWidget {
  final String message;
  final VoidCallback onTapActionButton;
  final String actionButtonLabel;
  final bool showCancelButton;

  const NIMSAlertDialogContent({
    super.key,
    required this.message,
    required this.onTapActionButton,
    required this.actionButtonLabel,
    this.showCancelButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsetsGeometry.all(24),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.surface,
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  maxLines: 5,
                  style: TextTheme.of(context).bodySmall,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              SizedBox(height: 24),

              /// -------------------------------
              /// ACTION BUTTON
              /// -------------------------------
              NIMSPrimaryButton(
                text: actionButtonLabel,
                onPressed: onTapActionButton,
              ),

              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
