import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/ui/widgets/nims_error_button.dart';
import '../../../../../core/ui/widgets/nims_round_icon_button.dart';
import '../../../../../core/ui/widgets/nims_secondary_button.dart';
import '../../../../dashboard/domain/mock.dart';

class RejectionReasonDialog extends StatelessWidget {
  const RejectionReasonDialog({super.key});


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                    "PC-288939-29930",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                const SizedBox(width: 24),
                Text("20 Y", style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(width: 24),
                Text("M", style: Theme.of(context).textTheme.bodySmall),
                const Spacer(),
              ],
            ),

            SizedBox(height: 40),

            /// -------------------------------
            ///REASON FOR REJECTION INPUT
            /// -------------------------------
            DropdownMenu<String>(
              trailingIcon: Icon(Icons.keyboard_arrow_down_rounded),
              selectedTrailingIcon: Icon(Icons.keyboard_arrow_up_rounded),
              width: size.width - 100,
              label: Text("Reason for Rejection"),
              dropdownMenuEntries: [
                ...Mock.reasonsForRejection.map(
                  (facility) => DropdownMenuEntry(
                    value: facility,
                    labelWidget: Center(
                      child: Text(
                        facility,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    label: facility,
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
              onSelected: (value) {},
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
                    onPressed: context.pop,
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
