import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';

import '../../../../../core/ui/widgets/nims_error_button.dart';
import '../../../../../core/ui/widgets/nims_round_icon_button.dart';
import '../../../../../core/ui/widgets/nims_secondary_button.dart';

class ManifestDeletionConfirmationDialog extends StatelessWidget {
  final DomainManifest manifest;
  final VoidCallback onConfirmDelete;

  const ManifestDeletionConfirmationDialog({
    super.key,
    required this.manifest,
    required this.onConfirmDelete,
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
            Row(
              children: [
                NIMSRoundIconButton(icon: Icons.close, onPressed: context.pop),
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
                "Are you sure you want to delete the manifest?",
                style: TextTheme.of(context).titleSmall,
                textAlign: TextAlign.center,
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                color: Theme.of(context).colorScheme.tertiaryContainer,
              ),
              child: Text(
                textAlign: TextAlign.center,
                manifest.manifestNo,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),

            SizedBox(height: 4),

            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
              child: Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      "${manifest.sampleCount} Specimens",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  SizedBox(height: 24),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            manifest.sampleType,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        Image.asset(
                          "lib/core/ui/icons/ic_test_tube.png",
                          height: 16,
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            /// -------------------------------
            /// CONFIRM + CANCEL BUTTONS
            /// -------------------------------
            Row(
              children: [
                Expanded(
                  child: NIMSErrorButton(
                    text: "Confirm",
                    onPressed: () {
                      context.pop();
                      onConfirmDelete();
                    },
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: NIMSSecondaryButton(
                    text: "Cancel",
                    onPressed: context.pop,
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
