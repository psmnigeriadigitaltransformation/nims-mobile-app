import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/ui/widgets/nims_primary_button.dart';
import '../../../../../core/ui/widgets/nims_round_icon_button.dart';
import '../../../../dashboard/domain/mock.dart';

class AddNewSpecimenDialog extends StatefulWidget {
  final Function(DomainSample) onSaveSpecimen;
  final String manifestNo;

  const AddNewSpecimenDialog({
    super.key,
    required this.onSaveSpecimen,
    required this.manifestNo,
  });

  @override
  State<StatefulWidget> createState() => _AddNewSpecimenDialogState();
}

class _AddNewSpecimenDialogState extends State<AddNewSpecimenDialog> {
  final TextEditingController patientCodeController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  final String sampleCode = Uuid().v4();

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
              controller: patientCodeController,
              onChanged: (value) {
                setState(() {
                  patientCodeController.text = value;
                });
              },
              textCapitalization: TextCapitalization.characters,
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
                            controller: ageController,
                            onChanged: (value) {
                              setState(() {
                                ageController.text = value;
                              });
                            },
                            keyboardType: TextInputType.number,
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
                              unitController.text = value ?? "";
                            });
                          },
                          controller: unitController,
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
                    style: ButtonStyle().copyWith(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.25,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              onSelected: (value) {
                setState(() {
                  sexController.text = value ?? "";
                });
              },
              controller: sexController,
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
              controller: commentController,
              onChanged: (value) {
                setState(() {
                  commentController.text = value;
                });
              },
            ),

            SizedBox(height: 40),

            /// -------------------------------
            /// SAVE SPECIMEN BUTTON
            /// -------------------------------
            NIMSPrimaryButton(
              text: "Save Specimen",
              onPressed: () {
                widget.onSaveSpecimen(
                  DomainSample(
                    manifestNo: widget.manifestNo,
                    sampleCode: sampleCode,
                    patientCode: patientCodeController.text
                        .trim()
                        .toUpperCase(),
                    age: "${ageController.text.trim()} ${unitController.text[0]}",
                    gender: sexController.text[0],
                    comment: commentController.text.trim(),
                  ),
                );
                context.pop();
              },
              enabled:
                  patientCodeController.text.isNotEmpty &&
                  ageController.text.isNotEmpty &&
                  unitController.text.isNotEmpty &&
                  sexController.text.isNotEmpty,
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
