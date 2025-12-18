import 'package:flutter/material.dart';
import 'package:projects/core/domain/mappers/typedefs.dart';
import 'package:projects/core/domain/models/location.dart';

import '../../../features/dashboard/domain/mock.dart';
import '../theme/theme.dart';

class NIMSShipmentCard extends StatefulWidget {
  final DomainShipment shipment;
  final List<DomainFacility> facilities;
  final List<DomainLocation> locations;
  final VoidCallback onTap;
  final Function(DomainLocation) onSelectDestinationLocationType;

  late final TextEditingController selectedLocationController =
      TextEditingController(text: shipment.destinationLocationType);

  NIMSShipmentCard({
    super.key,
    required this.shipment,
    required this.facilities,
    required this.locations,
    required this.onTap,
    required this.onSelectDestinationLocationType,
  });

  @override
  State<NIMSShipmentCard> createState() => _NIMSShipmentCardState();
}

class _NIMSShipmentCardState extends State<NIMSShipmentCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.onTap,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
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
                    widget.shipment.shipmentNo,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const Spacer(),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      widget.shipment.sampleType,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Image.asset(
                      "lib/core/ui/icons/ic_test_tube.png",
                      height: 16,
                      width: 16,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 4),
                child: Text(
                  "${widget.shipment.sampleCount} Specimens",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            SizedBox(height: 16),
            DropdownMenu<String>(
              textStyle: Theme.of(context).textTheme.bodySmall,
              inputDecorationTheme: NIMSTheme.secondaryInputDecorationTheme,
              trailingIcon: Icon(Icons.keyboard_arrow_down_rounded),
              selectedTrailingIcon: Icon(Icons.keyboard_arrow_up_rounded),
              width: size.width - 80,
              label: Text("Destination Location Type"),
              hintText: "",
              dropdownMenuEntries: [
                ...widget.locations.map(
                  (location) => DropdownMenuEntry(
                    value: location.location ?? "",
                    labelWidget: Center(
                      child: Text(
                        location.location ?? "",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    label: location.location ?? "",
                    style: ButtonStyle().copyWith(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.25,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              onSelected: (value) {
                widget.onSelectDestinationLocationType(
                  widget.locations.firstWhere(
                    (location) => location.location == value,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
