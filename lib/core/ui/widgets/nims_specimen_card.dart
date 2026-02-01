import 'package:flutter/material.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/stage.dart';
import 'package:nims_mobile_app/core/ui/theme/colors.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_status_chip.dart';

class NIMSSpecimenCard extends StatefulWidget {
  final VoidCallback? onTapDelete;
  final String? actionLabel;
  final DomainSample sample;
  final String? manifestStage;

  const NIMSSpecimenCard({
    super.key,
    this.onTapDelete,
    this.actionLabel,
    required this.sample,
    this.manifestStage,
  });

  @override
  State<StatefulWidget> createState() => _NIMSSpecimenCardState();
}

class _NIMSSpecimenCardState extends State<NIMSSpecimenCard> {
  bool isCommentRevealed = false;

  /// Get the displayed stage (capped by parent manifest stage if provided)
  String get _displayedStage {
    return Stage.getCappedDisplayName(
      widget.sample.stage,
      widget.manifestStage,
    );
  }

  /// Get stage color based on stage value
  Color _getStageColor() {
    switch (_displayedStage.toLowerCase()) {
      case 'delivered':
        return NIMSColors.green05;
      case 'in-transit':
        return NIMSColors.orange05;
      case 'order':
      case 'pending':
      default:
        return NIMSColors.blue05;
    }
  }

  /// Get stage background color based on stage value
  Color _getStageBackgroundColor() {
    switch (_displayedStage.toLowerCase()) {
      case 'delivered':
        return NIMSColors.green02.withAlpha(50);
      case 'in-transit':
        return NIMSColors.orange02.withAlpha(50);
      case 'order':
      case 'pending':
      default:
        return NIMSColors.blue02.withAlpha(50);
    }
  }

  /// Build sync status indicator widget
  Widget _buildSyncStatusIndicator(BuildContext context) {
    final syncStatus = widget.sample.syncStatus.toLowerCase();

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
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          onTap: () {
            setState(() {
              if (widget.sample.comment?.isNotEmpty == true) {
                isCommentRevealed = !isCommentRevealed;
              }
            });
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
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              widget.sample.patientCode,
                              style: Theme.of(context).textTheme.labelMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          NIMSStatusChip(
                            status: _displayedStage,
                            statusBackgroundColor: _getStageBackgroundColor(),
                            statusColor: _getStageColor(),
                          ),
                          const SizedBox(width: 8),
                          _buildSyncStatusIndicator(context),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      widget.sample.age,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      widget.sample.gender,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    if (widget.onTapDelete != null) ...[
                      const SizedBox(width: 12),
                      InkWell(
                        onTap: widget.onTapDelete,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
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
                              widget.actionLabel ?? "",
                              style: Theme.of(context).textTheme.labelSmall
                                  ?.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
        if (isCommentRevealed)
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),

                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                  width: 0.5,
                ),
              ),
              child: Text(
                textAlign: TextAlign.center,
                widget.sample.comment ?? "",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              )
            ),
          ),
      ],
    );
  }
}
