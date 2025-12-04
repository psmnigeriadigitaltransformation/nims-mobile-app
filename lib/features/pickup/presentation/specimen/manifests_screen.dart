import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projects/app/route_name+path+params.dart';
import 'package:projects/core/ui/screens/nims_screen.dart';
import 'package:projects/core/ui/widgets/nims_round_icon_button.dart';
import 'package:projects/features/dashboard/domain/route_type.dart';

import '../../../../core/ui/widgets/nims_manifest_card.dart';
import '../../../../core/ui/widgets/nims_primary_button.dart';
import '../../../dashboard/domain/mock.dart';
import 'manifest_deletion_confirmation_dialog.dart';

class ManifestsScreen extends StatefulWidget {
  final RouteType routeType;

  const ManifestsScreen({super.key, required this.routeType});

  @override
  State<ManifestsScreen> createState() => _ManifestsScreenState();
}

class _ManifestsScreenState extends State<ManifestsScreen> {
  final Set<int> selectedManifests = {};

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
              "Manifests",
              style: TextTheme.of(context).titleSmall,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            SizedBox(width: 40),
          ],
        ),

        SizedBox(height: 8),

        Text(widget.routeType.label, style: TextTheme.of(context).bodySmall),

        SizedBox(height: 50),

        /// ----------------------------------------
        /// ORIGINATING FACILITY DROPDOWN MENU
        /// ----------------------------------------
        Row(
          children: [
            Image.asset(
              "lib/core/ui/icons/ic_origin_location.png",
              width: 16,
              height: 16,
            ),
            SizedBox(width: 16),
            Flexible(
              child: DropdownMenu<String>(
                trailingIcon: Icon(Icons.keyboard_arrow_down_rounded),
                selectedTrailingIcon: Icon(Icons.keyboard_arrow_up_rounded),
                width: size.width - 80,
                label: Text("PickUp Facility"),
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
            ),
          ],
        ),

        SizedBox(height: 40),

        /// -------------------------------
        /// MANIFESTS
        /// -------------------------------
        Row(
          children: [
            Row(
              children: [
                Text(
                  "Manifests (4)",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(width: 8),
                if (selectedManifests.isNotEmpty)
                  Container(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                    ),
                    child: Text(
                      "${selectedManifests.length} Selected",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
              ],
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
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Center(
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
                    child: Text(
                      "Add Manifest",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  context.pushNamed(addNewManifestScreen);
                },
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: size.height * 0.480,
          child: Scrollbar(
            thumbVisibility: true,
            trackVisibility: true,
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                final isSelected = selectedManifests.contains(index);
                return Padding(
                  padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Checkbox(
                        value: isSelected,
                        onChanged: (isChecked) {
                          setState(() {
                            if (isSelected) {
                              selectedManifests.remove(index);
                            } else {
                              selectedManifests.add(index);
                            }
                          });
                        },
                      ),

                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
                          child: NIMSManifestCard(
                            onTapDelete: () {
                              showDialog(
                                context: context,
                                builder: (buildContext) =>
                                    ManifestDeletionConfirmationDialog(),
                              );
                            },
                            isSelected: isSelected,
                            destinationName: "National Reference Lab",
                            manifestID: 'NG-83992882-JJSKKS',
                            onTapManifest: () {
                              context.pushNamed(manifestDetailsScreen);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            // ListView(
            //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            //   children: [
            //     ...List.generate(
            //       8,
            //       (x) => Padding(
            //         padding: EdgeInsetsGeometry.symmetric(vertical: 4),
            //         child: NIMSManifestCard(
            //           destinationName: "National Reference Lab",
            //           manifestID: 'NG-83992882-JJSKKS',
            //           onTap: () {
            //             context.pushNamed(
            //               dispatchApprovalManifestDetailsScreen,
            //             );
            //           },
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ),

        const SizedBox(height: 84),

        /// ----------------------------------------
        /// NEXT BUTTON
        /// ----------------------------------------
        NIMSPrimaryButton(
          text: "Next",
          onPressed: () {
            context.pushNamed(shipmentsScreen);
          },
          enabled: selectedManifests.isNotEmpty,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
