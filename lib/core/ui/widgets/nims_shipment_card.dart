import 'package:flutter/material.dart';
import 'package:projects/core/domain/mappers/typedefs.dart';
import 'package:projects/core/domain/models/location.dart';

import '../../../features/dashboard/domain/mock.dart';
import '../theme/theme.dart';

class NIMSShipmentCard extends StatefulWidget {
  final String manifestID;
  final String destinationName;
  final List<DomainFacility> facilities;
  final List<DomainLocation> locations;
  final VoidCallback onTap;

  const NIMSShipmentCard({
    super.key,
    required this.manifestID,
    required this.destinationName,
    required this.facilities,
    required this.locations,
    required this.onTap,
  });

  @override
  State<NIMSShipmentCard> createState() => _NIMSShipmentCardState();
}

class _NIMSShipmentCardState extends State<NIMSShipmentCard> {
  final TextEditingController selectedLocationController =
      TextEditingController();
  final TextEditingController selectedFacilityController =
      TextEditingController();
  DomainLocation? selectedLocation;
  DomainFacility? selectedFacility;

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
                    widget.manifestID,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const Spacer(),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      "Viral Load",
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
                  "200 Specimens",
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
                setState(() {
                  selectedLocationController.text = value ?? "";
                  selectedLocation = widget.locations.firstWhere(
                    (location) => location.location == value,
                  );
                  selectedFacility = null;
                  selectedFacilityController.text = "";
                });
              },
              controller: selectedLocationController,
            ),
            SizedBox(height: 12),
            DropdownMenu<String>(
              textStyle: Theme.of(context).textTheme.bodySmall,
              inputDecorationTheme: NIMSTheme.secondaryInputDecorationTheme,
              trailingIcon: Icon(Icons.keyboard_arrow_down_rounded),
              selectedTrailingIcon: Icon(Icons.keyboard_arrow_up_rounded),
              width: size.width - 80,
              label: Text("Destination Facility"),
              dropdownMenuEntries: [
                ...widget.facilities
                    .where(
                      (facility) =>
                          selectedLocation?.location?.toLowerCase().contains(
                            facility.type?.toLowerCase() ?? "",
                          ) ??
                          false,
                    )
                    .map(
                      (facility) => DropdownMenuEntry(
                        value: facility.facilityName ?? "",
                        labelWidget: Text(
                          facility.facilityName ?? "",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        label: facility.facilityName ?? "",
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
                setState(() {
                  selectedFacilityController.text = value ?? "";
                  selectedFacility = widget.facilities.firstWhere(
                    (facility) => facility.facilityName == value,
                  );
                });
              },
              controller: selectedFacilityController,
            ),
          ],
        ),
      ),
    );
  }
}
