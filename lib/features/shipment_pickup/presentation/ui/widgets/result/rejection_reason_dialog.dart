import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/core/domain/models/result.dart';

import '../../../../../../core/ui/widgets/nims_error_button.dart';
import '../../../../../../core/ui/widgets/nims_round_icon_button.dart';
import '../../../../../../core/ui/widgets/nims_secondary_button.dart';
import '../../../../../../core/utils/constants.dart';

class RejectionReasonDialog extends StatefulWidget {
  final LabResult? result;
  final String? sampleCode;
  final String? age;
  final String? gender;

  const RejectionReasonDialog({
    super.key,
    this.result,
    this.sampleCode,
    this.age,
    this.gender,
  });

  @override
  State<RejectionReasonDialog> createState() => _RejectionReasonDialogState();
}

class _RejectionReasonDialogState extends State<RejectionReasonDialog> {
  String? selectedReason;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Get display values from result or fallback to direct parameters
    final displaySampleCode = widget.result?.sampleCode ?? widget.sampleCode ?? "Unknown";
    final displayAge = widget.result?.age ?? widget.age ?? "";
    final displayGender = widget.result?.gender ?? widget.gender ?? "";

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
                NIMSRoundIconButton(icon: Icons.close, onPressed: () => context.pop(null)),
                Spacer(),
                Text(
                  "Rejection Reason",
                  style: TextTheme.of(context).titleSmall,
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                SizedBox(width: 40),
              ],
            ),

            SizedBox(height: 8),

            Row(
              children: [
                const Spacer(),
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
                    displaySampleCode,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                const SizedBox(width: 24),
                Text(displayAge, style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(width: 24),
                Text(displayGender, style: Theme.of(context).textTheme.bodySmall),
                const Spacer(),
              ],
            ),

            SizedBox(height: 40),

            /// -------------------------------
            /// REASON FOR REJECTION INPUT
            /// -------------------------------
            DropdownMenu<String>(
              trailingIcon: Icon(Icons.keyboard_arrow_down_rounded),
              selectedTrailingIcon: Icon(Icons.keyboard_arrow_up_rounded),
              width: size.width - 100,
              label: Text("Reason for Rejection"),
              dropdownMenuEntries: [
                ...Constants.reasonsForRejection.map(
                  (reason) => DropdownMenuEntry(
                    value: reason,
                    labelWidget: Center(
                      child: Text(
                        reason,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    label: reason,
                    style: ButtonStyle().copyWith(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.25,
                            color: Theme.of(
                              context,
                            ).colorScheme.outline,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              onSelected: (value) {
                setState(() {
                  selectedReason = value;
                });
              },
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
                    onPressed: selectedReason != null
                        ? () => context.pop(selectedReason)
                        : null,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: NIMSSecondaryButton(
                    text: "Cancel",
                    onPressed: () => context.pop(null),
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
