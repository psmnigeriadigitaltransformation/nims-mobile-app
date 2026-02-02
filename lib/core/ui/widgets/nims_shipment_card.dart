import 'package:flutter/material.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/stage.dart';

import '../theme/colors.dart';
import '../theme/theme.dart';
import 'nims_status_chip.dart';

class NIMSShipmentCard extends StatefulWidget {
  final DomainShipment shipment;
  final List<DomainFacility> facilities;
  final List<DomainLocation> locations;
  final VoidCallback onTap;
  final Function(DomainLocation)? onSelectDestinationLocationType;
  final String? routeStage;
  /// When true, the destination location type dropdown is disabled (auto-detected)
  final bool isLocationTypeLocked;

  late final TextEditingController selectedLocationController =
      TextEditingController(text: shipment.destinationLocationType);

  NIMSShipmentCard({
    super.key,
    required this.shipment,
    required this.facilities,
    required this.locations,
    required this.onTap,
    this.onSelectDestinationLocationType,
    this.routeStage,
    this.isLocationTypeLocked = false,
  });

  @override
  State<NIMSShipmentCard> createState() => _NIMSShipmentCardState();
}

class _NIMSShipmentCardState extends State<NIMSShipmentCard> {
  /// Get the displayed stage (capped by parent route stage if provided)
  String get _displayedStage {
    return Stage.getCappedDisplayName(
      widget.shipment.stage,
      widget.routeStage,
    );
  }

  /// Get stage color based on stage value
  Color _getStageColor() {
    switch (_displayedStage.toLowerCase()) {
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
    switch (_displayedStage.toLowerCase()) {
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
                Flexible(
                  child: Text(
                    widget.shipment.shipmentNo,
                    style: Theme.of(context).textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const SizedBox(width: 8),
                NIMSStatusChip(
                  status: _displayedStage,
                  statusBackgroundColor: _getStageBackgroundColor(),
                  statusColor: _getStageColor(),
                ),
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        widget.shipment.sampleType,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
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
                  "${widget.shipment.sampleCount} ${widget.shipment.payloadType}${widget.shipment.sampleCount > 1 ? 's' : ''}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            SizedBox(height: 16),
            if (widget.onSelectDestinationLocationType != null)
              widget.isLocationTypeLocked
                  // When locked, show a read-only text field with the auto-detected value
                  ? SizedBox(
                      width: size.width - 80,
                      child: TextField(
                        readOnly: true,
                        enabled: false,
                        controller: TextEditingController(
                          text: widget.shipment.destinationLocationType,
                        ),
                        style: Theme.of(context).textTheme.bodySmall,
                        decoration: InputDecoration(
                          labelText: "Destination Location Type",
                          suffixIcon: Icon(
                            Icons.lock_outline,
                            size: 18,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                      ),
                    )
                  // When not locked, show the dropdown for manual selection
                  : DropdownMenu<String>(
                      initialSelection:
                          widget.shipment.destinationLocationType.isNotEmpty
                          ? widget.shipment.destinationLocationType
                          : null,
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
                        widget.onSelectDestinationLocationType!(
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
