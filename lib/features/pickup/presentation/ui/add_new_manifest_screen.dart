import 'package:flutter/material.dart';
import 'package:projects/core/ui/screens/nims_screen.dart';
import 'package:projects/core/ui/widgets/nims_round_icon_button.dart';
import 'package:projects/features/pickup/presentation/ui/specimen_deletion_confirmation_dialog.dart';
import '../../../../core/ui/widgets/nims_primary_button.dart';
import '../../../../core/ui/widgets/nims_specimen_card.dart';
import '../../../dashboard/domain/mock.dart';
import 'add_new_specimen_dialog.dart';

class AddNewManifestScreen extends StatelessWidget {
  const AddNewManifestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return NIMSScreen(
      children: [
        SizedBox(height: 16),

        /// ----------------------------------------
        /// TITLE + SUBTITLE
        /// ----------------------------------------
        Row(
          children: [
            NIMSRoundIconButton(
              icon: Icons.arrow_back_ios_rounded,
              onPressed: () => {},
            ),
            Spacer(),
            Text(
              "Add New Manifest",
              style: TextTheme.of(context).titleSmall,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            SizedBox(width: 40),
          ],
        ),

        SizedBox(height: 8),

        Text(
          "Gwagwalada General Hospital",
          style: TextTheme.of(context).bodySmall,
        ),

        SizedBox(height: 50),

        /// ---------------------------------------------------------
        /// ORIGINATING FACILITY + DESTINATION FACILITY DROPDOWN MENU
        /// ---------------------------------------------------------
        SizedBox(
          height: 150,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.only(top: 4),
                child: Column(
                  children: [
                    Image.asset(
                      "lib/core/ui/icons/ic_origin_location.png",
                      width: 16,
                      height: 16,
                    ),
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                        child: Container(
                          width: 1,
                          color: Theme.of(context).colorScheme.secondary,
                          height: 50,
                        ),
                      ),
                    ),
                    Image.asset(
                      "lib/core/ui/icons/ic_destination_location.png",
                      width: 16,
                      height: 16,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16),
              Column(
                spacing: 28,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gwagwalada General Hospital",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  DropdownMenu<String>(
                    trailingIcon: Icon(Icons.keyboard_arrow_down_rounded),
                    selectedTrailingIcon: Icon(Icons.keyboard_arrow_up_rounded),
                    width: size.width - 80,
                    label: Text("Destination Facility"),
                    dropdownMenuEntries: [
                      ...Mock.facilities.map(
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
                ],
              ),
            ],
          ),
        ),

        DropdownMenu<String>(
          trailingIcon: Icon(Icons.keyboard_arrow_down_rounded),
          selectedTrailingIcon: Icon(Icons.keyboard_arrow_up_rounded),
          width: size.width - 48,
          label: Text("Specimen Type"),
          dropdownMenuEntries: [
            ...Mock.specimenTypes.map(
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

        SizedBox(height: 40),

        /// -------------------------------
        /// SPECIMENS
        /// -------------------------------
        Row(
          children: [
            Text(
              "Specimens (2)",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Spacer(),
            Container(
              padding: EdgeInsetsGeometry.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Theme.of(context).colorScheme.primary,
              ),

              child: InkWell(
                splashColor: Theme.of(context).splashColor,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Center(
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
                    child: Text(
                      "Add Specimen",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (builder) => AddNewSpecimenDialog(),
                  );
                },
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: size.height * 0.379,
          child: Scrollbar(
            trackVisibility: true,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              children: [
                ...List.generate(
                  10,
                  (x) => Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                    child: NIMSSpecimenCard(
                      onTapDelete: () {
                        showDialog(
                          context: context,
                          builder: (builder) =>
                              SpecimenDeletionConfirmationDialog(),
                        );
                      },
                      actionLabel: "Delete",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 28),

        // ----------------------------------------S
        /// SAVE MANIFEST BUTTON
        /// ----------------------------------------
        NIMSPrimaryButton(text: "Save Manifest", onPressed: () {}),
        const SizedBox(height: 16),
      ],
    );
  }
}
