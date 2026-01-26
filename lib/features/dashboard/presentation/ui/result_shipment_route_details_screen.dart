import 'dart:convert';
import 'dart:developer' as developers;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/app/route_name+path+params.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
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

class ResultShipmentRouteDetailsScreen extends ConsumerWidget {
  final ShipmentRoute route;

  const ResultShipmentRouteDetailsScreen({super.key, required this.route});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(
      resultShipmentRouteDetailsScreenStateNotifierProvider(route),
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
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12,
                    ),
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
                          _buildStatusChip(state.route.stage),
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
                          "Shipments (1)",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),

                      const SizedBox(height: 16),

                      ..._buildGroupedShipments(
                        context,
                        state.shipment,
                        state.route,
                      ),

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

  /// Get stage color based on stage value
  Color _getStageColor() {
    switch (route.stage.toLowerCase()) {
      case 'delivered':
        return NIMSColors.green05;
      case 'in-transit':
        return NIMSColors.orange05;
      case 'pending':
      default:
        return NIMSColors.red05;
    }
  }

  /// Get stage background color based on stage value
  Color _getStageBackgroundColor() {
    switch (route.stage.toLowerCase()) {
      case 'delivered':
        return NIMSColors.green02.withAlpha(50);
      case 'in-transit':
        return NIMSColors.orange02.withAlpha(50);
      case 'pending':
      default:
        return NIMSColors.red02.withAlpha(50);
    }
  }

  Widget _buildStatusChip(String stage) {
    return NIMSStatusChip(
      status: stage,
      statusColor: _getStageColor(),
      statusBackgroundColor: _getStageBackgroundColor(),
    );
  }

  Widget _buildInfoCard(BuildContext context, dynamic state) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(
          context,
        ).colorScheme.surfaceContainerHighest.withAlpha(100),
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
          _buildInfoRow(
            context,
            "Destination",
            state.route.destinationFacilityName,
          ),
          const Divider(height: 20),
          _buildInfoRow(context, "Shipments", "1"),
          if (state.route.latitude != null &&
              state.route.longitude != null) ...[
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
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
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
    DomainShipment shipment,
    ShipmentRoute route,
  ) {
    // Group shipments by destination location type
    final Map<String, List<Shipment>> groupedShipments = {};
    final locationType = shipment.destinationLocationType;
    if (!groupedShipments.containsKey(locationType)) {
      groupedShipments[locationType] = [];
    }
    groupedShipments[locationType]!.add(shipment);

    final List<Widget> widgets = [];

    // Build UI for each group
    groupedShipments.forEach((locationType, shipmentsInGroup) {
      widgets.add(
        _buildResultDeliveryShipmentGroup(context, locationType, shipment, route),
      );
      widgets.add(const SizedBox(height: 24));
    });

    return widgets;
  }

  /// Navigates to the specimen delivery approval screen with the given shipments
  void _navigateToResultDeliveryApproval(
      BuildContext context,
      DomainShipment shipment,
      ShipmentRoute route,
      ) {
    context.pushNamed(
      resultDeliveryApprovalScreen,
      queryParameters: {
        routeQueryParam: jsonEncode(route.toJson()),
        shipmentQueryParam: jsonEncode(shipment.toJson()),
      },
    );
  }

  /// Builds a single collapsible group of shipments with header and delivery button
  Widget _buildResultDeliveryShipmentGroup(
    BuildContext context,
    String locationType,
    DomainShipment shipment,
    ShipmentRoute route,
  ) {
    return _CollapsibleShipmentGroup(
      locationType: locationType,
      shipment: shipment,
      route: route,
      onDeliveryPressed: () => _navigateToResultDeliveryApproval(context, shipment, route)
    );
  }

}

/// Collapsible specimen group widget
class _CollapsibleShipmentGroup extends StatefulWidget {
  final String locationType;
  final DomainShipment shipment;
  final ShipmentRoute route;
  final VoidCallback onDeliveryPressed;

  const _CollapsibleShipmentGroup({
    required this.locationType,
    required this.shipment,
    required this.route,
    required this.onDeliveryPressed,
  });

  @override
  State<_CollapsibleShipmentGroup> createState() =>
      _CollapsibleShipmentGroupState();
}

class _CollapsibleShipmentGroupState extends State<_CollapsibleShipmentGroup> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    // Check if all shipments in group are synced
    final isSynced = widget.shipment.syncStatus.toLowerCase() == 'synced';

    developers.log("synced: $isSynced");

    // Check if any shipment in group is not delivered
    final isUndelivered = widget.shipment.stage.toLowerCase() != 'delivered';

    // Check if all shipments in group are delivered
    final isDelivered = widget.shipment.stage.toLowerCase() == 'delivered';

    // Get the destination facility name from first specimen
    final destinationFacilityName = widget.shipment.destinationFacilityName;

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
                color: Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest.withAlpha(100),
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
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "1 ${widget.shipment.payloadType} to $destinationFacilityName",
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                      ],
                    ),
                  ),
                  if (isDelivered)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
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
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(
                                  color: NIMSColors.green05,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                  // Deliver button when collapsed (only if has undelivered)
                  if (!_isExpanded && isUndelivered) ...[
                    const SizedBox(width: 8),
                    FilledButton(
                      onPressed: isSynced ? widget.onDeliveryPressed : null,
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        "Deliver",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: isSynced
                              ? Colors.white
                              : Theme.of(
                                  context,
                                ).colorScheme.onSurface.withAlpha(100),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: NIMSSpecimenShipmentSummaryCard(
                      shipment: widget.shipment,
                    ),
                  ),
                ),

                // Delivery Button - only show if there are undelivered shipments
                if (isUndelivered)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    child: NIMSPrimaryButton(
                      text:
                          "Deliver 1 Shipment",
                      enabled: isSynced,
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
