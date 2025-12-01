import 'package:flutter/material.dart';

class NIMSStatusChip extends StatelessWidget {
  final Color statusBackgroundColor;
  final Color statusColor;
  final String status;

  const NIMSStatusChip({
    super.key,
    required this.status,
    required this.statusBackgroundColor,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        color: statusBackgroundColor,
      ),
      child: Text(
        status,
        style: Theme.of(
          context,
        ).textTheme.labelSmall?.copyWith(color: statusColor),
      ),
    );
  }
}
