import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';

import '../../../../../../core/ui/widgets/nims_error_button.dart';
import '../../../../../../core/ui/widgets/nims_round_icon_button.dart';
import '../../../../../../core/ui/widgets/nims_secondary_button.dart';

class SpecimenDeletionConfirmationDialog extends StatelessWidget {
  final DomainSample sample;
  final Function(DomainSample) onDelete;

  const SpecimenDeletionConfirmationDialog({
    super.key,
    required this.sample,
    required this.onDelete,
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
                "Are you sure you want to delete the specimen?",
                style: TextTheme.of(context).titleSmall,
                textAlign: TextAlign.center,
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 3,
                horizontal: 6,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                color: Theme.of(context).colorScheme.tertiaryContainer,
              ),
              child: Text(
                textAlign: TextAlign.center,
                sample.sampleCode,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Expanded(child:  ,),
                const SizedBox(width: 20),
                Text(sample.age, style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(width: 20),
                Text(
                  sample.gender,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
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
                      onDelete(sample);
                      context.pop();
                    },
                  ),
                ),
                SizedBox(height: 16),
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
