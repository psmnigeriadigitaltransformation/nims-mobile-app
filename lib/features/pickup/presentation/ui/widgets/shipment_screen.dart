import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/app/route_name+path+params.dart';
import 'package:nims_mobile_app/core/ui/screens/nims_base_screen.dart';
import 'package:nims_mobile_app/core/ui/screens/nims_screen.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_round_icon_button.dart';
import 'package:nims_mobile_app/features/dashboard/domain/route_type.dart';
import '../../../../../core/domain/mappers/typedefs.dart';
import '../../../../../core/domain/models/movement_type.dart';
import '../../../../../core/ui/widgets/nims_error_content.dart';
import '../../../../../core/ui/widgets/nims_manifest_card.dart';
import '../../../../../core/ui/widgets/nims_primary_button.dart';
import '../../../../../core/ui/widgets/nims_shipment_card.dart';
import '../../../../dashboard/domain/mock.dart';
import '../../../providers.dart';

class ShipmentScreen extends ConsumerWidget {
  final DomainMovementType movementType;
  final List<DomainManifest> manifests;
  final DomainFacility pickUpFacility;

  const ShipmentScreen({
    super.key,
    required this.movementType,
    required this.manifests,
    required this.pickUpFacility,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final args = (
      movementType: movementType,
      pickUpFacility: pickUpFacility,
      manifests: manifests,
    );

    final asyncValueState = ref.watch(
      shipmentsScreenStateNotifierProvider(args),
    );

    return asyncValueState.when(
      data: (state) => NIMSBaseScreen(
        header: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              /// ----------------------------------------
              /// TITLE + SUBTITLE
              /// ----------------------------------------
              Row(
                children: [
                  NIMSRoundIconButton(
                    icon: Icons.arrow_back_ios_rounded,
                    onPressed: () => context.pop(),
                  ),
                  Spacer(),
                  Text(
                    "Shipment",
                    style: TextTheme.of(context).titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  SizedBox(width: 40),
                ],
              ),

              SizedBox(height: 8),

              Text(
                movementType.movement ?? "",
                style: TextTheme.of(context).bodySmall,
              ),

              SizedBox(height: 40),

              /// ----------------------------------------
              /// ORIGINATING FACILITY
              /// ----------------------------------------
              SizedBox(
                height: 136,
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
                              padding: EdgeInsetsGeometry.symmetric(
                                horizontal: 10,
                              ),
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

                    /// ---------------------------------------------------------
                    /// ORIGINATING FACILITY + DESTINATION FACILITY DROPDOWN MENU
                    /// ---------------------------------------------------------
                    Expanded(
                      child: Column(
                        spacing: 28,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pickUpFacility.facilityName ?? "",
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          DropdownMenu<String>(
                            trailingIcon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                            ),
                            selectedTrailingIcon: Icon(
                              Icons.keyboard_arrow_up_rounded,
                            ),
                            width: size.width - 76,
                            label: Text("Destination Facility"),
                            dropdownMenuEntries: [
                              ...state.facilities.map(
                                (facility) => DropdownMenuEntry(
                                  value: facility.facilityName ?? "",
                                  labelWidget: Text(
                                    facility.facilityName ?? "",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
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
                                    shipmentsScreenStateNotifierProvider(
                                      args,
                                    ).notifier,
                                  )
                                  .updateDestinationFacility(
                                    state.facilities.firstWhere(
                                      (facility) =>
                                          facility.facilityName == value,
                                    ),
                                  );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(
            children: [
              /// -------------------------------
              /// SHIPMENTS
              /// -------------------------------
              if (state.selectedDestinationFacility != null)
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Shipments (${state.shipments.length})",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Spacer(),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: size.height * 0.600,
                      child: Scrollbar(
                        trackVisibility: true,
                        child: ListView.builder(
                          controller: ScrollController(),
                          shrinkWrap: true,
                          itemCount: state.shipments.length,
                          itemBuilder: (context, index) {
                            final shipment = state.shipments[index];
                            // final isSelected = state.selectedManifestIndices.contains(index);
                            return Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                vertical: 4,
                              ),
                              child: NIMSShipmentCard(
                                shipment: shipment,
                                facilities: state.facilities,
                                locations: state.locations,
                                onTap: () {
                                  context.pushNamed(manifestDetailsScreen);
                                },
                                onSelectDestinationLocationType:
                                    (DomainLocation location) {
                                      ref
                                          .read(
                                            shipmentsScreenStateNotifierProvider(
                                              args,
                                            ).notifier,
                                          )
                                          .updateDestinationLocationType(
                                            location,
                                            shipment,
                                          );
                                    },
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
            ],
          ),
        ),

        /// ----------------------------------------
        /// DISPATCH SPECIMENS BUTTON
        /// ----------------------------------------
        bottom: Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: NIMSPrimaryButton(
            text: "Go To Approval",
            onPressed: () {
              context.pushNamed(
                specimenDispatchApprovalScreen,
                queryParameters: {
                  movementTypeQueryParam: jsonEncode(movementType.toJson()),
                  pickupFacilityQueryParam: jsonEncode(pickUpFacility.toJson()),
                  destinationFacilityQueryParam: jsonEncode(
                    state.selectedDestinationFacility?.toJson(),
                  ),
                  shipmentsQueryParam: jsonEncode(
                    state.shipments
                        .map((manifest) => manifest.toJson())
                        .toList(),
                  ),
                },
              );
            },
            enabled: state.isGoToApprovalButtonEnabled,
          ),
        ),
      ),
      error: (e, s) => NIMSErrorContent(
        message: e.toString(),
        onTapActionButton: () {
          ref
              .read(shipmentsScreenStateNotifierProvider(args).notifier)
              .refreshState();
        },
        actionButtonLabel: 'Retry',
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
