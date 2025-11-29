import 'package:flutter/material.dart';

class NIMSManifestCard extends StatelessWidget {
  final String manifestID;
  final String destinationName;

  const NIMSManifestCard({
    super.key,
    required this.manifestID,
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
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                ),
                child: Text(
                  manifestID,
                  style: Theme.of(context).textTheme.labelMedium,
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
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
            child: Row(
              children: [
                Text(
                  destinationName,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.tertiary),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.errorContainer.withAlpha(150),
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(4)),
                  ),

                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: 2,
                      horizontal: 8,
                    ),
                    child: Text(
                      "Delete",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).colorScheme.error,
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
                    "200 Samples",
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
        ],
      ),
    );
  }
}
