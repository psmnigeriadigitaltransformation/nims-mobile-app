import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projects/core/ui/theme/theme.dart';

import '../../../../core/ui/widgets/nims_primary_button.dart';
import '../../../../core/ui/widgets/nims_round_icon_button.dart';
import '../../../dashboard/domain/mock.dart';

class AddNewSpecimenDialog extends StatelessWidget {
  const AddNewSpecimenDialog({super.key});

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
                  "Add New Specimen",
                  style: TextTheme.of(context).titleSmall,
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                SizedBox(width: 40),
              ],
            ),
            SizedBox(height: 24),

            /// -------------------------------
            /// PATIENT CODE INPUT
            /// -------------------------------
            TextField(
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
              ),
              decoration: const InputDecoration(
                labelText: "Patient Code",
                hintText: "Patient Code",
                helperText: "",
                errorText: null,
              ),
            ),

            /// -------------------------------
            /// AGE + SEX INPUT
            /// -------------------------------
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsGeometry.only(top: 19),
                          child: TextField(
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                            decoration: const InputDecoration(
                              labelText: "Age",
                              hintText: "Age",
                              helperText: "",
                              errorText: null,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: DropdownMenu<String>(
                          trailingIcon: Icon(Icons.keyboard_arrow_down_rounded),
                          selectedTrailingIcon: Icon(
                            Icons.keyboard_arrow_up_rounded,
                          ),
                          width: size.width - 254,
                          label: Text("Unit"),
                          dropdownMenuEntries: [
                            ...Mock.timeIntervals.map(
                              (facility) => DropdownMenuEntry(
                                value: facility,
                                labelWidget: Center(
                                  child: Text(
                                    facility,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                ),
                                label: facility,
                              ),
                            ),
                          ],
                          onSelected: (value) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),

            DropdownMenu<String>(
              trailingIcon: Icon(Icons.keyboard_arrow_down_rounded),
              selectedTrailingIcon: Icon(Icons.keyboard_arrow_up_rounded),
              width: size.width - 88,
              label: Text("Sex"),
              dropdownMenuEntries: [
                ...Mock.sex.map(
                  (facility) => DropdownMenuEntry(
                    value: facility,
                    labelWidget: Center(
                      child: Text(
                        facility,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    label: facility,
                  ),
                ),
              ],
              onSelected: (value) {},
            ),

            SizedBox(height: 36),

            /// -------------------------------
            /// COMMENT INPUT
            /// -------------------------------
            TextField(
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
              ),
              decoration: const InputDecoration(
                labelText: "Comment",
                hintText: "Comment",
                helperText: "",
                errorText: null,
              ),
              minLines: 2,
              maxLines: 2,
            ),

            SizedBox(height: 40),

            /// -------------------------------
            /// SAVE SPECIMEN BUTTON
            /// -------------------------------
            NIMSPrimaryButton(text: "Save Specimen", onPressed: context.pop),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
