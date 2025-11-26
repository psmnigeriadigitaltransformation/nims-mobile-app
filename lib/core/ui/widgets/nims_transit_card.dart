import 'package:flutter/material.dart';

class NIMSTransitCard extends StatelessWidget {
  final String status;
  final Color statusColor;
  final Color statusBackgroundColor;
  final String sourceCode;
  final String sourceName;
  final String destinationCode;
  final String destinationName;

  const NIMSTransitCard({
    super.key,
    required this.status,
    required this.statusColor,
    required this.statusBackgroundColor,
    required this.sourceCode,
    required this.sourceName,
    required this.destinationCode,
    required this.destinationName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
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
                  "lib/core/ui/icons/fast_shipping.png",
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
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
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
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ),
            ],
          ),
        ],
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
