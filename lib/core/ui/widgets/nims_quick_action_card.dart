import 'package:flutter/material.dart';

class NIMSQuickActionCard extends StatelessWidget {
  final Color color;
  final String asset;
  final String text;

  const NIMSQuickActionCard({
    super.key,
    required this.color,
    required this.asset,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: color,
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 0.5,
        ),
      ),
      padding: const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 8),
      child: Column(
        children: [
          Image.asset(asset, height: 24, width: 24),
          const SizedBox(height: 12),
          Text(
            text,
            style: Theme.of(context).textTheme.labelSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
