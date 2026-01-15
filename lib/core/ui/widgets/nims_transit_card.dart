import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/app/route_name+path+params.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';

import 'nims_status_chip.dart';

class NIMSTransitCard extends StatelessWidget {
  final String status;
  final Color statusColor;
  final Color statusBackgroundColor;
  final String sourceCode;
  final String sourceName;
  final String destinationCode;
  final String destinationName;
  final DomainShipmentRoute shipmentRoute;

  const NIMSTransitCard({
    super.key,
    required this.status,
    required this.statusColor,
    required this.statusBackgroundColor,
    required this.sourceCode,
    required this.sourceName,
    required this.destinationCode,
    required this.destinationName,
    required this.shipmentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      onTap: () {
        context.pushNamed(
          routeDetailsScreen,
          queryParameters: {
            routeQueryParam: jsonEncode(shipmentRoute.toJson()),
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
                NIMSStatusChip(
                  status: status,
                  statusBackgroundColor: statusBackgroundColor,
                  statusColor: statusColor,
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Theme.of(context).colorScheme.tertiary.withAlpha(100),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                children: [
                  Text(
                    sourceCode,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Expanded(child: _buildDivider(context)),
                  Image.asset(
                    "lib/core/ui/icons/ic_fast_shipping.png",
                    height: 16,
                    width: 16,
                  ),
                  Expanded(flex: 1, child: _buildDivider(context)),
                  Text(
                    destinationCode,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),

            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    sourceName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 2,
                  child: Text(
                    destinationName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 0.5,
      color: Theme.of(context).colorScheme.outline,
    );
  }
}
