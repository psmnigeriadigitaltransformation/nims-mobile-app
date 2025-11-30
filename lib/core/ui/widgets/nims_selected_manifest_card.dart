import 'package:flutter/material.dart';

class NimsSelectedManifestCard extends StatelessWidget {
  const NimsSelectedManifestCard({super.key});

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
                  "PC-288939-29930",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              const SizedBox(width: 24),
              Text("20 Specimens", style: Theme.of(context).textTheme.bodySmall),
              const Spacer(),
              Row(
                children: [
                  Text(
                    "Sputum",
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
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Theme.of(context).colorScheme.tertiary.withAlpha(100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
