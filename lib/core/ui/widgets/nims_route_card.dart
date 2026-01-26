import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/app/route_name+path+params.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/ui/theme/colors.dart';

import 'nims_status_chip.dart';

class NIMSRouteCard extends StatelessWidget {
  final DomainShipmentRoute route;

  const NIMSRouteCard({super.key, required this.route});

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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      onTap: () {
        if (route.routeType == 'specimen_shipment_route') {
          context.pushNamed(
            specimenShipmentRouteDetailsScreen,
            queryParameters: {routeQueryParam: jsonEncode(route.toJson())},
          );
        } else if (route.routeType == 'result_shipment_route') {
          context.pushNamed(
            resultShipmentRouteDetailsScreen,
            queryParameters: {routeQueryParam: jsonEncode(route.toJson())},
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withAlpha(50),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Route Number and Status
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest.withAlpha(80),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Row(
                children: [
                  // Route icon
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withAlpha(20),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(
                      Icons.route_rounded,
                      size: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Route Number
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          route.routeNo,
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (route.lspCode.isNotEmpty)
                          Text(
                            route.lspCode,
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                ),
                          ),
                      ],
                    ),
                  ),
                  NIMSStatusChip(
                    status: route.stage,
                    statusBackgroundColor: _getStageBackgroundColor(),
                    statusColor: _getStageColor(),
                  ),
                  const SizedBox(width: 8),
                  // Sync Status Indicator
                  _buildSyncStatusIndicator(context),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                    color: Theme.of(
                      context,
                    ).colorScheme.tertiary.withAlpha(100),
                  ),
                ],
              ),
            ),

            // Body content
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  // Origin to Destination Visual
                  Row(
                    children: [
                      // Origin
                      Expanded(
                        child: _buildLocationTile(
                          context,
                          name: route.originFacilityName,
                          icon: Icons.trip_origin_rounded,
                          iconColor: NIMSColors.green05,
                          alignment: CrossAxisAlignment.start,
                        ),
                      ),
                      // Arrow with shipping icon
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            Image.asset(
                              "lib/core/ui/icons/ic_fast_shipping.png",
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(height: 4),
                            Container(
                              width: 40,
                              height: 1,
                              color: Theme.of(
                                context,
                              ).colorScheme.outline.withAlpha(100),
                            ),
                          ],
                        ),
                      ),
                      // Destination
                      Expanded(
                        child: _buildLocationTile(
                          context,
                          name: route.destinationFacilityName,
                          icon: Icons.location_on_rounded,
                          iconColor: NIMSColors.red05,
                          alignment: CrossAxisAlignment.end,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationTile(
    BuildContext context, {
    required String name,
    required IconData icon,
    required Color iconColor,
    required CrossAxisAlignment alignment,
  }) {
    return Row(
      mainAxisAlignment: alignment == CrossAxisAlignment.end
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (alignment == CrossAxisAlignment.start)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(icon, size: 14, color: iconColor),
          ),
        if (alignment == CrossAxisAlignment.start) const SizedBox(width: 6),
        Flexible(
          child: Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: alignment == CrossAxisAlignment.end
                ? TextAlign.end
                : TextAlign.start,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        if (alignment == CrossAxisAlignment.end) const SizedBox(width: 6),
        if (alignment == CrossAxisAlignment.end)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(icon, size: 14, color: iconColor),
          ),
      ],
    );
  }

  Widget _buildSyncStatusIndicator(BuildContext context) {
    final syncStatus = route.syncStatus.toLowerCase();

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
        child: Icon(icon, size: 16, color: color),
      ),
    );
  }
}
