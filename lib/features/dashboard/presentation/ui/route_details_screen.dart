import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/app/route_name+path+params.dart';
import 'package:nims_mobile_app/core/domain/models/facility.dart';
import 'package:nims_mobile_app/core/domain/models/movement_type.dart';
import 'package:nims_mobile_app/core/domain/models/shipment.dart';
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_primary_button.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_round_icon_button.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_specimen_shipment_summary_card.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_status_chip.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_origin_dest_facilities_link_view.dart';
import 'package:nims_mobile_app/features/dashboard/providers.dart';

import '../../../../core/ui/theme/colors.dart';

class RouteDetailsScreen extends ConsumerWidget {
  final ShipmentRoute route;

  const RouteDetailsScreen({super.key, required this.route});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(
      routeDetailsScreenStateNotifierProvider(route),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            /// Fixed Header Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  _buildHeader(context),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                    ),
                    child: Text(
                      route.routeNo.length > 20
                          ? "${route.routeNo.substring(0, 20)}..."
                          : route.routeNo,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),

            /// Scrollable Content
            Expanded(
              child: asyncState.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, _) => Center(
                  child: Text(
                    "Error loading details",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                data: (state) => SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),

                      /// Origin to Destination + Status
                      Row(
                        children: [
                          Expanded(
                            child: NIMSOriginDestinationLinkView(
                              origin: state.route.originFacilityName,
                              destination: state.route.destinationFacilityName,
                            ),
                          ),
                          const SizedBox(width: 12),
                          _buildStatusChip(state),
                        ],
                      ),

                      const SizedBox(height: 24),

                      /// Info Card
                      _buildInfoCard(context, state),

                      const SizedBox(height: 32),

                      /// Shipments Section
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Shipments (${state.shipments.length})",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),

                      const SizedBox(height: 16),

                      if (state.shipments.isEmpty)
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.outline.withAlpha(100),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "No shipments found",
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        )
                      else
                        ..._buildGroupedShipments(context, state.shipments, state.route),

                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        NIMSRoundIconButton(
          icon: Icons.arrow_back_ios_rounded,
          onPressed: () => context.pop(),
        ),
        const Spacer(),
        Text(
          "Route Details",
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        const SizedBox(width: 40),
      ],
    );
  }

  Widget _buildStatusChip(dynamic state) {
    // Determine status based on approvals
    final hasPickup = state.pickupApproval != null;
    final hasDelivery = state.deliveryApproval != null;

    String status;
    Color statusColor;
    Color backgroundColor;

    if (hasDelivery) {
      status = 'Delivered';
      statusColor = NIMSColors.green05;
      backgroundColor = NIMSColors.green02.withAlpha(50);
    } else if (hasPickup) {
      status = 'In Transit';
      statusColor = NIMSColors.orange05;
      backgroundColor = NIMSColors.orange02.withAlpha(50);
    } else {
      status = 'Dispatched';
      statusColor = NIMSColors.green05;
      backgroundColor = NIMSColors.green02.withAlpha(50);
    }

    return NIMSStatusChip(
      status: status,
      statusColor: statusColor,
      statusBackgroundColor: backgroundColor,
    );
  }

  Widget _buildInfoCard(BuildContext context, dynamic state) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withAlpha(100),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withAlpha(50),
        ),
      ),
      child: Column(
        children: [
          _buildInfoRow(context, "Route No", state.route.routeNo),
          const Divider(height: 20),
          _buildInfoRow(context, "Origin", state.route.originFacilityName),
          const Divider(height: 20),
          _buildInfoRow(context, "Destination", state.route.destinationFacilityName),
          const Divider(height: 20),
          _buildInfoRow(context, "Shipments", "${state.shipments.length}"),
          if (state.route.latitude != null && state.route.longitude != null) ...[
            const Divider(height: 20),
            _buildInfoRow(
              context,
              "Location",
              "${state.route.latitude?.toStringAsFixed(4)}, ${state.route.longitude?.toStringAsFixed(4)}",
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 2,
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  /// Groups shipments by destination location type and builds UI for each group
  List<Widget> _buildGroupedShipments(
    BuildContext context,
    List<Shipment> shipments,
    ShipmentRoute route,
  ) {
    // Group shipments by destination location type
    final Map<String, List<Shipment>> groupedShipments = {};
    for (final shipment in shipments) {
      final locationType = shipment.destinationLocationType;
      if (!groupedShipments.containsKey(locationType)) {
        groupedShipments[locationType] = [];
      }
      groupedShipments[locationType]!.add(shipment);
    }

    final List<Widget> widgets = [];

    // Build UI for each group
    groupedShipments.forEach((locationType, shipmentsInGroup) {
      widgets.add(
        _buildShipmentGroup(context, locationType, shipmentsInGroup, route),
      );
      widgets.add(const SizedBox(height: 24));
    });

    return widgets;
  }

  /// Builds a single collapsible group of shipments with header and delivery button
  Widget _buildShipmentGroup(
    BuildContext context,
    String locationType,
    List<Shipment> shipments,
    ShipmentRoute route,
  ) {
    return _CollapsibleShipmentGroup(
      locationType: locationType,
      shipments: shipments,
      route: route,
      onDeliveryPressed: () => _navigateToDeliveryApproval(context, shipments, route),
    );
  }

  /// Navigates to the delivery approval screen with the given shipments
  void _navigateToDeliveryApproval(
    BuildContext context,
    List<Shipment> shipments,
    ShipmentRoute route,
  ) {
    // Construct required objects from available data
    final movementType = MovementType(
      id: null,
      pick: shipments.first.sampleType,
      typeId: null,
      movement: "Specimen Delivery",
      origin: route.originFacilityName,
      destinationPrimary: shipments.first.destinationFacilityName,
      destinationSecondary: null,
      created: null,
      category: "specimen",
    );

    final destinationFacility = Facility(
      id: null,
      facilityCode: shipments.first.destinationFacilityId,
      facilityName: shipments.first.destinationFacilityName,
    );

    context.pushNamed(
      specimenDeliveryApprovalScreen,
      queryParameters: {
        movementTypeQueryParam: jsonEncode(movementType.toJson()),
        shipmentsQueryParam: jsonEncode(shipments.map((s) => s.toJson()).toList()),
        destinationFacilityQueryParam: jsonEncode(destinationFacility.toJson()),
        routeQueryParam: route.routeNo,
      },
    );
  }
}

/// Collapsible shipment group widget
class _CollapsibleShipmentGroup extends StatefulWidget {
  final String locationType;
  final List<Shipment> shipments;
  final ShipmentRoute route;
  final VoidCallback onDeliveryPressed;

  const _CollapsibleShipmentGroup({
    required this.locationType,
    required this.shipments,
    required this.route,
    required this.onDeliveryPressed,
  });

  @override
  State<_CollapsibleShipmentGroup> createState() => _CollapsibleShipmentGroupState();
}

class _CollapsibleShipmentGroupState extends State<_CollapsibleShipmentGroup> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    // Check if all shipments in group are synced
    final allSynced = widget.shipments.every(
      (s) => s.syncStatus.toLowerCase() == 'synced',
    );

    // Check if any shipment in group is not delivered
    final hasUndelivered = widget.shipments.any(
      (s) => s.shipmentStatus.toLowerCase() != 'delivered',
    );

    // Check if all shipments in group are delivered
    final allDelivered = widget.shipments.every(
      (s) => s.shipmentStatus.toLowerCase() == 'delivered',
    );

    // Get the destination facility name from first shipment
    final destinationFacilityName = widget.shipments.first.destinationFacilityName;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withAlpha(50),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Group Header (tappable to toggle)
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomLeft: Radius.circular(_isExpanded ? 0 : 12),
              bottomRight: Radius.circular(_isExpanded ? 0 : 12),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest.withAlpha(100),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft: Radius.circular(_isExpanded ? 0 : 12),
                  bottomRight: Radius.circular(_isExpanded ? 0 : 12),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 18,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.locationType,
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "${widget.shipments.length} shipment${widget.shipments.length > 1 ? 's' : ''} to $destinationFacilityName",
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (allDelivered)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: NIMSColors.green02.withAlpha(50),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            size: 14,
                            color: NIMSColors.green05,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "Delivered",
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: NIMSColors.green05,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  // Deliver button when collapsed (only if has undelivered)
                  if (!_isExpanded && hasUndelivered) ...[
                    const SizedBox(width: 8),
                    FilledButton(
                      onPressed: allSynced ? widget.onDeliveryPressed : null,
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        "Deliver",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: allSynced ? Colors.white : Theme.of(context).colorScheme.onSurface.withAlpha(100),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(width: 8),
                  // Expand/Collapse icon
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 24,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Collapsible content
          AnimatedCrossFade(
            firstChild: Column(
              children: [
                // Shipment Cards
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: widget.shipments
                        .map(
                          (shipment) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: NIMSSpecimenShipmentSummaryCard(shipment: shipment),
                          ),
                        )
                        .toList(),
                  ),
                ),

                // Delivery Button - only show if there are undelivered shipments
                if (hasUndelivered)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    child: NIMSPrimaryButton(
                      text: "Deliver ${widget.shipments.length} Shipment${widget.shipments.length > 1 ? 's' : ''}",
                      enabled: allSynced,
                      onPressed: widget.onDeliveryPressed,
                    ),
                  ),
              ],
            ),
            secondChild: const SizedBox.shrink(),
            crossFadeState: _isExpanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}
