import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/app/route_name+path+params.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/ui/theme/colors.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_status_chip.dart';
import 'package:nims_mobile_app/core/utils/string_extensions.dart';

class NIMSSpecimenShipmentSummaryCard extends StatelessWidget {
  final DomainShipment shipment;

  const NIMSSpecimenShipmentSummaryCard({super.key, required this.shipment});

  bool get isResultShipment => shipment.payloadType.toLowerCase() == 'result';

  /// Get stage color based on stage value
  Color _getStageColor() {
    switch (shipment.stage.toLowerCase()) {
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
    switch (shipment.stage.toLowerCase()) {
      case 'delivered':
        return NIMSColors.green02.withAlpha(50);
      case 'in-transit':
        return NIMSColors.orange02.withAlpha(50);
      case 'pending':
      default:
        return NIMSColors.red02.withAlpha(50);
    }
  }

  /// Build sync status indicator widget
  Widget _buildSyncStatusIndicator(BuildContext context) {
    final syncStatus = shipment.syncStatus.toLowerCase();

    IconData icon;
    Color color;
    String tooltip;

    switch (syncStatus) {
      case 'synced':
        icon = Icons.cloud_done_outlined;
        color = NIMSColors.green05;
        tooltip = 'Synced';
        break;
      case 'pending':
        icon = Icons.cloud_upload_outlined;
        color = NIMSColors.orange05;
        tooltip = 'Pending sync';
        break;
      case 'failed':
        icon = Icons.cloud_off_outlined;
        color = NIMSColors.red05;
        tooltip = 'Sync failed';
        break;
      default:
        icon = Icons.cloud_outlined;
        color = Theme.of(context).colorScheme.secondary;
        tooltip = syncStatus;
    }

    return Tooltip(
      message: tooltip,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: color.withAlpha(20),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, size: 14, color: color),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      onTap: () {
        context.pushNamed(
          shipmentDetailsScreen,
          queryParameters: {
            shipmentQueryParam: jsonEncode(shipment.toJson()),
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
            width: 0.5,
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    shipment.shipmentNo,
                    style: Theme.of(context).textTheme.labelMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                NIMSStatusChip(
                  status: shipment.stage,
                  statusBackgroundColor: _getStageBackgroundColor(),
                  statusColor: _getStageColor(),
                ),
                const SizedBox(width: 8),
                _buildSyncStatusIndicator(context),
                const Spacer(),
                Text(
                  "${shipment.sampleCount} ${shipment.payloadType.capitalize()}${shipment.sampleCount != 1 ? 's' : ''}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(width: 12),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isResultShipment ? shipment.payloadType.capitalize() : shipment.sampleType,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(width: 4),
                    if (isResultShipment)
                      Icon(
                        Icons.science_outlined,
                        size: 16,
                        color: Theme.of(context).colorScheme.tertiary,
                      )
                    else
                      Image.asset(
                        "lib/core/ui/icons/ic_test_tube.png",
                        height: 16,
                        width: 16,
                      ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 4),
              child: Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text(
                        shipment.destinationFacilityName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        shipment.destinationLocationType,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
