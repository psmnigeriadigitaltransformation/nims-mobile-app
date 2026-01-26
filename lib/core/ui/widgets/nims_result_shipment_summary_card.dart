import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/app/route_name+path+params.dart';
import 'package:nims_mobile_app/core/domain/models/shipment.dart';

class NIMSResultShipmentSummaryCard extends StatelessWidget {
  final Shipment? shipment;
  final int resultCount;

  const NIMSResultShipmentSummaryCard({
    super.key,
    this.shipment,
    this.resultCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    final shipmentNo = shipment?.shipmentNo ?? "Unknown";
    final destinationName = shipment?.destinationFacilityName ?? "";
    final destinationType = shipment?.destinationLocationType ?? "";
    final count = resultCount > 0 ? resultCount : (shipment?.sampleCount ?? 0);

    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      onTap: shipment != null
          ? () {
              context.pushNamed(
                shipmentDetailsScreen,
                queryParameters: {
                  shipmentQueryParam: jsonEncode(shipment!.toJson()),
                },
              );
            }
          : null,
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
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                  child: Text(
                    shipmentNo,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Text(
                    "$count Result${count != 1 ? 's' : ''}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(width: 16),
                Row(
                  children: [
                    Text(
                      "Result",
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
                const SizedBox(width: 16),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Theme.of(context).colorScheme.tertiary.withAlpha(100),
                ),
              ],
            ),
            if (destinationName.isNotEmpty) ...[
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
                          destinationName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      if (destinationType.isNotEmpty)
                        Flexible(
                          child: Text(
                            destinationType,
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
          ],
        ),
      ),
    );
  }
}
