import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/app/route_name+path+params.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_error_content.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_round_icon_button.dart';

import '../../../../../core/domain/mappers/typedefs.dart';
import '../../../../../core/ui/screens/nims_base_screen.dart';
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
  // final Set<int> selectedManifests = {};
  final TextEditingController selectedFacilityController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final asyncValueState = ref.watch(
      manifestsScreenStateNotifierProvider((movementType: widget.movementType)),
    );

    return asyncValueState.when(
      data: (state) => NIMSBaseScreen(
        header: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
          child: Column(
            /// ----------------------------------------
            /// TITLE + SUBTITLE
            /// ----------------------------------------
            children: [
              SizedBox(height: 16),
              Row(
                children: [
                  NIMSRoundIconButton(
                    icon: Icons.arrow_back_ios_rounded,
                    onPressed: () => context.pop(),
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

              /// ----------------------------------------
              /// ORIGINATING FACILITY DROPDOWN MENU
              /// ----------------------------------------
              Column(
                children: [
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
                          width: size.width - 72,
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
                            ref
                                .read(
                                  manifestsScreenStateNotifierProvider((
                                    movementType: widget.movementType,
                                  )).notifier,
                                )
                                .onSelectPickUpFacility(
                                  state.facilities.firstWhere(
                                    (facility) =>
                                        facility.facilityName == value,
                                  ),
                                );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),

                  /// -------------------------------
                  /// MANIFESTS
                  /// -------------------------------
                  if (asyncValueState.valueOrNull?.isFacilitySelected ?? false)
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsetsGeometry.symmetric(vertical: 6),
                            child: Row(
                              children: [
                                Text(
                                  "Manifests (${state.manifests.length})",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                SizedBox(width: 8),
                                if (state.selectedManifestIndices.isNotEmpty)
                                  Container(
                                    padding: EdgeInsetsGeometry.symmetric(
                                      horizontal: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.tertiaryContainer,
                                    ),
                                    child: Text(
                                      "${state.selectedManifestIndices.length} Selected",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Spacer(),
                          if (state.isFacilitySelected)
                            Container(
                              padding: EdgeInsetsGeometry.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                color: Theme.of(context).colorScheme.primary,
                              ),

                              child: InkWell(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsetsGeometry.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Text(
                                      "Add Manifest",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
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
                                      pickupFacilityQueryParam: jsonEncode(
                                        state.selectedPickUpFacility?.toJson(),
                                      ),
                                    },
                                  );
                                },
                              ),
                            ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 16),
                ],
              ),
            ],
          ),
        ),
        body: Scrollbar(
          trackVisibility: true,
          // triggerMode: RefreshIndicatorTriggerMode.anywhere,
          child: ListView.builder(
            controller: ScrollController(),
            shrinkWrap: true,
            itemCount: state.manifests.length,
            itemBuilder: (context, index) {
              final manifest = state.manifests[index];
              final isSelected = state.selectedManifestIndices.contains(index);
              final shipmentStatus = state.shippedManifestStatuses[manifest.manifestNo];
              final isShipped = shipmentStatus != null;

              return Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4, horizontal: 8),
                child: Row(
                  children: [
                    if (!isShipped)
                    Checkbox(
                      value: isSelected,
                      onChanged: (isChecked) {
                              ref
                                  .read(
                                    manifestsScreenStateNotifierProvider((
                                      movementType: widget.movementType,
                                    )).notifier,
                                  )
                                  .onToggleManifest(index, isSelected);
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
                                        ManifestDeletionConfirmationDialog(
                                      manifest: manifest,
                                      onConfirmDelete: () {
                                        ref
                                            .read(
                                              manifestsScreenStateNotifierProvider((
                                                movementType: widget.movementType,
                                              )).notifier,
                                            )
                                            .deleteManifest(
                                              manifest.manifestNo,
                                            );
                                      },
                                    ),
                                  );
                                },
                          isSelected: isSelected,
                          isShipped: isShipped,
                          shipmentStatus: shipmentStatus,
                          manifest: manifest,
                          onTapManifest: () {
                            developer.log(
                              manifest.toJson().toString(),
                              name: "ManifestsScreen:onTapManifest",
                            );
                            context.pushNamed(
                              manifestDetailsScreen,
                              queryParameters: {
                                manifestsQueryParam: jsonEncode(
                                  manifest.toJson(),
                                ),
                              },
                            );
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
        bottom: Padding(
          padding: EdgeInsetsGeometry.only(bottom: 16),
          child: NIMSPrimaryButton(
            text: "Next",
            onPressed: () {
              context.pushNamed(
                shipmentScreen,
                queryParameters: {
                  movementTypeQueryParam: jsonEncode(
                    widget.movementType.toJson(),
                  ),
                  manifestsQueryParam: jsonEncode(
                    state.selectedManifests
                        .map((manifest) => manifest.toJson())
                        .toList(),
                  ),
                  pickupFacilityQueryParam: jsonEncode(
                    state.selectedPickUpFacility?.toJson(),
                  ),
                },
              );
            },
            enabled: state.selectedManifestIndices.isNotEmpty,
          ),
        ),
      ),
      error: (e, s) => NIMSErrorContent(
        message: e.toString(),
        onTapActionButton: () {
          ref
              .read(
                manifestsScreenStateNotifierProvider((
                  movementType: widget.movementType,
                )).notifier,
              )
              .refreshState();
        },
        actionButtonLabel: "Retry",
      ),
      loading: () => Container(
        color: Theme.of(context).colorScheme.surface,
        child: Center(
          child: const SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      ),
    );
  }
}
