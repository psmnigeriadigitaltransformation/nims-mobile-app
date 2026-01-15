import 'package:flutter/material.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/ui/theme/colors.dart';

class NIMSManifestCard extends StatelessWidget {
  final DomainManifest manifest;
  final VoidCallback onTapManifest;
  final VoidCallback? onTapDelete;
  final bool isSelected;
  final bool isShipped;
  final String? shipmentStatus;

  const NIMSManifestCard({
    super.key,
    required this.manifest,
    required this.onTapManifest,
    required this.isSelected,
    this.onTapDelete,
    this.isShipped = false,
    this.shipmentStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isShipped ? 0.6 : 1.0,
      child: InkWell(
        onTap: onTapManifest,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              color: isShipped
                  ? Theme.of(context).colorScheme.outline.withAlpha(100)
                  : isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outline,
              width: 0.5,
            ),
            color: isShipped
                ? Theme.of(context).colorScheme.surfaceContainerHighest.withAlpha(100)
                : null,
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                      ),
                      child: Text(
                        manifest.manifestNo,
                        style: Theme.of(context).textTheme.labelMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                  if (shipmentStatus != null) ...[
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                        color: _getStatusColor(shipmentStatus!),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _getStatusIcon(shipmentStatus!),
                            size: 12,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _getStatusLabel(shipmentStatus!),
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(width: 8,),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: Theme.of(context).colorScheme.tertiary.withAlpha(100),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                child: Row(
                  children: [
                   Expanded(child:  Text(
                     manifest.originatingFacilityName,
                     style: Theme.of(context).textTheme.bodySmall?.copyWith(
                       color: Theme.of(context).colorScheme.tertiary,
                     ),
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                   ),),
                    const SizedBox(width: 24),
                    if (onTapDelete != null && !isShipped)
                      InkWell(
                        onTap: onTapDelete,
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.errorContainer.withAlpha(150),
                            borderRadius: BorderRadiusGeometry.all(
                              Radius.circular(4),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                              vertical: 2,
                              horizontal: 8,
                            ),
                            child: Text(
                              "Delete",
                              style: Theme.of(context).textTheme.labelSmall
                                  ?.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 4),
                      child: Text(
                        "${manifest.sampleCount} Specimens",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        manifest.sampleType,
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
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'in-transit':
        return NIMSColors.orange05;
      case 'delivered':
        return NIMSColors.green05;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'in-transit':
        return Icons.local_shipping_outlined;
      case 'delivered':
        return Icons.check_circle_outline;
      case 'cancelled':
        return Icons.cancel_outlined;
      default:
        return Icons.help_outline;
    }
  }

  String _getStatusLabel(String status) {
    switch (status.toLowerCase()) {
      case 'in-transit':
        return 'In Transit';
      case 'delivered':
        return 'Delivered';
      case 'cancelled':
        return 'Cancelled';
      default:
        return status;
    }
  }
}
