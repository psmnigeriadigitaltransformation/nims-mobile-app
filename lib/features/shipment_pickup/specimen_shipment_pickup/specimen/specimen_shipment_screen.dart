import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/app/route_name+path+params.dart';
import 'package:nims_mobile_app/core/ui/screens/nims_base_screen.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_round_icon_button.dart';
import '../../../../core/domain/mappers/typedefs.dart';
import '../../../../core/ui/widgets/nims_error_content.dart';
import '../../../../core/ui/widgets/nims_primary_button.dart';
import '../../../../core/ui/widgets/nims_shipment_card.dart';
import '../../providers.dart';
import '../approval/specimen_shipment_approval/providers.dart' hide shipmentsScreenKey;

class SpecimenShipmentScreen extends ConsumerStatefulWidget {
  final DomainMovementType movementType;
  final List<DomainManifest> manifests;
  final DomainFacility pickUpFacility;

  const SpecimenShipmentScreen({
    super.key,
    required this.movementType,
    required this.manifests,
    required this.pickUpFacility,
  });

  @override
  ConsumerState<SpecimenShipmentScreen> createState() => _SpecimenShipmentScreenState();
}

class _SpecimenShipmentScreenState extends ConsumerState<SpecimenShipmentScreen> {
  late final String _providerKey;

  @override
  void initState() {
    super.initState();
    _providerKey = shipmentsScreenKey(widget.movementType, widget.pickUpFacility);
    // Initialize the state after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(specimenShipmentsScreenStateNotifierProvider(_providerKey).notifier).initialize(
        movementType: widget.movementType,
        pickUpFacility: widget.pickUpFacility,
        manifests: widget.manifests,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final asyncValueState = ref.watch(
      specimenShipmentsScreenStateNotifierProvider(_providerKey),
    );

    return asyncValueState.when(
      data: (state) => PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            // Clear cache when user navigates back (system back button)
            ref.read(specimenShipmentsScreenStateNotifierProvider(_providerKey).notifier).clearCache();
          }
        },
        child: NIMSBaseScreen(
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
                    onPressed: () {
                      // Clear cache when user navigates back from this screen
                      ref.read(specimenShipmentsScreenStateNotifierProvider(_providerKey).notifier).clearCache();
                      context.pop();
                    },
                  ),
                  Spacer(),
                  Text(
                    "Specimen Shipment",
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
                            widget.pickUpFacility.facilityName ?? "",
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          DropdownMenu<String>(
                            initialSelection: state.selectedDestinationFacility?.facilityName,
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
                                    specimenShipmentsScreenStateNotifierProvider(
                                      _providerKey,
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
                                  // Get the latest shipment from state (in case destination location type was updated)
                                  final currentState = ref.read(specimenShipmentsScreenStateNotifierProvider(_providerKey)).value;
                                  final latestShipment = currentState?.shipments.firstWhere(
                                    (s) => s.shipmentNo == shipment.shipmentNo,
                                    orElse: () => shipment,
                                  ) ?? shipment;
                                  context.pushNamed(
                                    shipmentDetailsScreen,
                                    queryParameters: {
                                      shipmentQueryParam: jsonEncode(latestShipment.toJson()),
                                    },
                                  );
                                },
                                onSelectDestinationLocationType:
                                    (DomainLocation location) {
                                      ref
                                          .read(
                                            specimenShipmentsScreenStateNotifierProvider(
                                              _providerKey,
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
                  movementTypeQueryParam: jsonEncode(widget.movementType.toJson()),
                  pickupFacilityQueryParam: jsonEncode(widget.pickUpFacility.toJson()),
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
      ),
      error: (e, s) => NIMSErrorContent(
        message: e.toString(),
        onTapActionButton: () {
          ref
              .read(specimenShipmentsScreenStateNotifierProvider(_providerKey).notifier)
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
