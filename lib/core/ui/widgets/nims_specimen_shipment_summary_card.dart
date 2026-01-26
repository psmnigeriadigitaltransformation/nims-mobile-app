import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/app/route_name+path+params.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/utils/string_extensions.dart';

class NIMSSpecimenShipmentSummaryCard extends StatelessWidget {
  final DomainShipment shipment;

  const NIMSSpecimenShipmentSummaryCard({super.key, required this.shipment});

  bool get isResultShipment => shipment.payloadType.toLowerCase() == 'result';

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
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 3,
                      horizontal: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      // color: Theme.of(context).colorScheme.tertiaryContainer,
                    ),
                    child: Text(
                      shipment.shipmentNo,
                      style: Theme.of(context).textTheme.labelMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    "${shipment.sampleCount} ${shipment.payloadType.capitalize()}${shipment.sampleCount != 1 ? 's' : ''}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          isResultShipment ? shipment.payloadType.capitalize() : shipment.sampleType,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
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
