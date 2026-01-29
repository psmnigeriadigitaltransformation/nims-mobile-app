import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/core/domain/models/approval.dart';
import 'package:nims_mobile_app/core/domain/models/shipment.dart';
import 'package:nims_mobile_app/core/ui/theme/colors.dart';
import 'package:nims_mobile_app/features/dashboard/shipments/result_shipment/providers.dart';
import 'package:nims_mobile_app/features/dashboard/shipments/result_shipment/result_shipment_details_screen_state.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_origin_dest_facilities_link_view.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_result_card.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_round_icon_button.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_status_chip.dart';
import 'package:nims_mobile_app/core/utils/string_extensions.dart';

class ResultShipmentDetailsScreen extends ConsumerWidget {
  final Shipment shipment;
  final List<String> sampleCodes;

  const ResultShipmentDetailsScreen({
    super.key,
    required this.shipment,
    this.sampleCodes = const [],
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = ResultShipmentDetailsParams(
      shipment: shipment,
      sampleCodes: sampleCodes,
    );
    final asyncState = ref.watch(
      resultShipmentDetailsScreenStateNotifierProvider(params),
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
                      shipment.shipmentNo,
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
                              origin:
                                  state.shipment.originFacilityName.isNotEmpty
                                      ? state.shipment.originFacilityName
                                      : state.route?.originFacilityName ??
                                          state.shipment.originType,
                              destination:
                                  state.shipment.destinationFacilityName,
                            ),
                          ),
                          const SizedBox(width: 12),
                          _buildStatusChip(state.shipment.stage),
                        ],
                      ),

                      const SizedBox(height: 24),

                      /// Payload Type Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            state.shipment.payloadType.capitalize(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.science_outlined,
                            size: 16,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      /// Info Card
                      _buildInfoCard(context, state),

                      const SizedBox(height: 32),

                      /// Results Section
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Results (${state.results.length})",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),

                      const SizedBox(height: 16),

                      if (state.results.isEmpty)
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Theme.of(
                                context,
                              ).colorScheme.outline.withAlpha(100),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "No results found",
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                  ),
                            ),
                          ),
                        )
                      else
                        ...state.results.map(
                          (result) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: NIMSResultCard(
                              result: result,
                            ),
                          ),
                        ),

                      const SizedBox(height: 32),

                      /// Pick-up Approval Section
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Pick-up Approval",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),

                      const SizedBox(height: 16),

                      if (state.pickupApproval != null)
                        _buildApprovalCard(context, state.pickupApproval!)
                      else
                        _buildPendingApprovalCard(context, "Pending"),

                      const SizedBox(height: 24),

                      /// Delivery Approval Section
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Delivery Approval",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),

                      const SizedBox(height: 16),

                      if (state.deliveryApproval != null)
                        _buildApprovalCard(context, state.deliveryApproval!)
                      else
                        _buildPendingApprovalCard(context, "Pending"),

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
          "Shipment Details",
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        const SizedBox(width: 40),
      ],
    );
  }

  Widget _buildStatusChip(String status) {
    Color statusColor;
    Color backgroundColor;
    String label;

    switch (status.toLowerCase()) {
      case 'in-transit':
        statusColor = NIMSColors.orange05;
        backgroundColor = NIMSColors.orange02.withAlpha(50);
        label = 'In Transit';
        break;
      case 'delivered':
        statusColor = NIMSColors.green05;
        backgroundColor = NIMSColors.green02.withAlpha(50);
        label = 'Delivered';
        break;
      case 'cancelled':
        statusColor = Colors.red;
        backgroundColor = Colors.red.withAlpha(50);
        label = 'Cancelled';
        break;
      default:
        statusColor = Colors.grey;
        backgroundColor = Colors.grey.withAlpha(50);
        label = status;
    }

    return NIMSStatusChip(
      status: label,
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
        color: Theme.of(
          context,
        ).colorScheme.surfaceContainerHighest.withAlpha(100),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withAlpha(50),
        ),
      ),
      child: Column(
        children: [
          _buildInfoRow(context, "Route", state.shipment.routeNo),
          const Divider(height: 20),
          _buildInfoRow(context, "Payload Type", state.shipment.payloadType.toString().capitalize()),
          const Divider(height: 20),
          _buildInfoRow(context, "Results", "${state.shipment.sampleCount}"),
          const Divider(height: 20),
          _buildInfoRow(
            context,
            "Location Type",
            state.shipment.destinationLocationType,
          ),
          if (state.shipment.pickupLatitude != 0 &&
              state.shipment.pickupLongitude != 0) ...[
            const Divider(height: 20),
            _buildInfoRow(
              context,
              "Pickup Location",
              "${state.shipment.pickupLatitude.toStringAsFixed(4)}, ${state.shipment.pickupLongitude.toStringAsFixed(4)}",
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

  Widget _buildApprovalCard(BuildContext context, Approval approval) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          /// Sync Status Indicator
          Align(
            alignment: Alignment.centerRight,
            child: _buildSyncStatusChip(context, approval.syncStatus),
          ),
          const SizedBox(height: 8),

          /// Signature
          if (approval.signature.isNotEmpty)
            Container(
              width: double.infinity,
              height: 80,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: _buildSignatureImage(approval.signature),
              ),
            ),

          /// Full Name
          _buildApprovalInfoRow(context, "Full Name", approval.fullname),
          const SizedBox(height: 12),

          /// Designation
          _buildApprovalInfoRow(context, "Designation", approval.designation),
          const SizedBox(height: 12),

          /// Phone
          _buildApprovalInfoRow(context, "Phone Number", approval.phone),
        ],
      ),
    );
  }

  Widget _buildSyncStatusChip(BuildContext context, String syncStatus) {
    Color statusColor;
    Color backgroundColor;
    IconData icon;
    String label;

    switch (syncStatus.toLowerCase()) {
      case 'synced':
        statusColor = NIMSColors.green05;
        backgroundColor = NIMSColors.green02.withAlpha(50);
        icon = Icons.cloud_done_outlined;
        label = 'Synced';
        break;
      case 'pending':
        statusColor = NIMSColors.orange05;
        backgroundColor = NIMSColors.orange02.withAlpha(50);
        icon = Icons.cloud_upload_outlined;
        label = 'Pending';
        break;
      case 'failed':
        statusColor = Colors.red;
        backgroundColor = Colors.red.withAlpha(50);
        icon = Icons.cloud_off_outlined;
        label = 'Failed';
        break;
      default:
        statusColor = Colors.grey;
        backgroundColor = Colors.grey.withAlpha(50);
        icon = Icons.cloud_outlined;
        label = syncStatus;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: statusColor, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: statusColor),
          const SizedBox(width: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: statusColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignatureImage(String base64Signature) {
    try {
      final bytes = base64Decode(base64Signature);
      return Image.memory(bytes, fit: BoxFit.contain);
    } catch (e) {
      return const Center(
        child: Icon(Icons.draw_outlined, size: 32, color: Colors.grey),
      );
    }
  }

  Widget _buildApprovalInfoRow(
    BuildContext context,
    String label,
    String value,
  ) {
    return Row(
      children: [
        Expanded(
          child: Text(label, style: Theme.of(context).textTheme.labelLarge),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildPendingApprovalCard(BuildContext context, String message) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.surfaceContainerHighest.withAlpha(100),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withAlpha(50),
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.pending_outlined,
            size: 32,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
