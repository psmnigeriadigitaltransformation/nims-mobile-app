import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:projects/app/route_name+path+params.dart';
import 'package:projects/core/ui/screens/nims_screen.dart';
import 'package:projects/core/ui/widgets/nims_round_icon_button.dart';

import '../../../../../core/domain/mappers/typedefs.dart';
import '../../../../../core/ui/widgets/nims_alert_dialog.dart';
import '../../../../../core/ui/widgets/nims_manifest_card.dart';
import '../../../../../core/ui/widgets/nims_primary_button.dart';
import '../../../providers.dart';
import 'manifest_deletion_confirmation_dialog.dart';

class ManifestsScreen extends ConsumerStatefulWidget {
  final DomainMovementType movementType;

  const ManifestsScreen({super.key, required this.movementType});

  @override
  ConsumerState<ManifestsScreen> createState() => _ManifestsScreenState();
}

class _ManifestsScreenState extends ConsumerState<ManifestsScreen> {
  final Set<int> selectedManifests = {};
  final TextEditingController selectedFacilityController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final asyncValueState = ref.watch(
      manifestsScreenStateNotifierProvider(widget.movementType.movement ?? ""),
    );

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

        Text(
          widget.movementType.movement ?? "",
          style: TextTheme.of(context).bodySmall,
        ),

        SizedBox(height: 50),

        asyncValueState.when(
          data: (state) => Column(
            children: [
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
                      selectedTrailingIcon: Icon(
                        Icons.keyboard_arrow_up_rounded,
                      ),
                      width: size.width - 80,
                      label: Text("PickUp Facility"),
                      dropdownMenuEntries: [
                        ...state.facilities.map(
                          (facility) => DropdownMenuEntry(
                            value: facility.facilityName ?? "",
                            labelWidget: Text(
                              facility.facilityName ?? "",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            label: facility.facilityName ?? "",
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
                          selectedFacilityController.text = value ?? "";
                        });
                      },
                      controller: selectedFacilityController,
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
                            color: Theme.of(
                              context,
                            ).colorScheme.tertiaryContainer,
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
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                ),
                          ),
                        ),
                      ),
                      onTap: () {
                        context.pushNamed(
                          addNewManifestScreen,
                          queryParameters: {
                            movementTypeQueryParam: jsonEncode(
                              widget.movementType.toJson(),
                            ),
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              SizedBox(
                height: size.height * 0.480,
                child: Scrollbar(
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
                                padding: EdgeInsetsGeometry.symmetric(
                                  horizontal: 8,
                                ),
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
                ),
              ),

              const SizedBox(height: 84),

              /// ----------------------------------------
              /// NEXT BUTTON
              /// ----------------------------------------
              NIMSPrimaryButton(
                text: "Next",
                onPressed: () {
                  context.pushNamed(
                    shipmentsScreen,
                    queryParameters: {
                      movementTypeQueryParam: jsonEncode(
                        widget.movementType.toJson(),
                      ),
                    },
                  );
                },
                enabled: selectedManifests.isNotEmpty,
              ),
              const SizedBox(height: 16),
            ],
          ),
          error: (e, s) => NIMSAlertDialog(
            message: e.toString(),
            onTapActionButton: () {
              ref
                  .read(
                    resultPickUpScreenStateNotifierProvider(
                      widget.movementType.movement ?? "",
                    ).notifier,
                  )
                  .refreshState();
            },
            actionButtonLabel: 'Retry',
          ),
          loading: () => const Padding(
            padding: EdgeInsets.all(40),
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
        ),
      ],
    );
  }
}
