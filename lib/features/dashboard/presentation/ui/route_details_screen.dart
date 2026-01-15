import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/core/domain/models/shipment_route.dart';
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
                        ...state.shipments.map(
                          (shipment) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: NIMSSpecimenShipmentSummaryCard(
                              shipment: shipment,
                            ),
                          ),
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
}
