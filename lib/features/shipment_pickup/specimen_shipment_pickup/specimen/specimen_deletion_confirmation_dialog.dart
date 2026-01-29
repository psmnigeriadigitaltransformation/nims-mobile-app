import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/ui/theme/colors.dart';

import '../../../../core/ui/widgets/nims_error_button.dart';
import '../../../../core/ui/widgets/nims_round_icon_button.dart';
import '../../../../core/ui/widgets/nims_secondary_button.dart';

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
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header with close button
            Row(
              children: [
                NIMSRoundIconButton(icon: Icons.close, onPressed: context.pop),
                const Spacer(),
                const SizedBox(width: 40),
              ],
            ),

            const SizedBox(height: 16),

            // Warning icon
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.errorContainer.withAlpha(100),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.delete_outline_rounded,
                size: 32,
                color: Theme.of(context).colorScheme.error,
              ),
            ),

            const SizedBox(height: 16),

            // Title
            Text(
              "Delete Specimen?",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            Text(
              "This action cannot be undone.",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),

            // Specimen info card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline.withAlpha(100),
                  width: 1,
                ),
                color: Theme.of(context).colorScheme.surfaceContainerHighest.withAlpha(50),
              ),
              child: Column(
                children: [
                  // Patient code
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: NIMSColors.blue02.withAlpha(100),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.person_outline_rounded,
                          size: 20,
                          color: NIMSColors.blue05,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Patient Code",
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              sample.patientCode,
                              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Sample code, age, gender row
                  Row(
                    children: [
                      // Sample code
                      Expanded(
                        flex: 2,
                        child: _buildInfoItem(
                          context,
                          label: "Sample Code",
                          value: sample.sampleCode,
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Age
                      Expanded(
                        child: _buildInfoItem(
                          context,
                          label: "Age",
                          value: sample.age,
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Gender
                      Expanded(
                        child: _buildInfoItem(
                          context,
                          label: "Gender",
                          value: sample.gender,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: NIMSSecondaryButton(
                    text: "Cancel",
                    onPressed: context.pop,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: NIMSErrorButton(
                    text: "Delete",
                    onPressed: () {
                      onDelete(sample);
                      context.pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
