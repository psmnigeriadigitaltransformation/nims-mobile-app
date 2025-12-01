import 'package:flutter/material.dart';

class NIMSSpecimenCard extends StatelessWidget {
  const NIMSSpecimenCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      onTap: () {},
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
                    "PC-288939-29930",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const SizedBox(width: 24),
                Text("20 Y", style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(width: 24),
                Text("M", style: Theme.of(context).textTheme.bodySmall),
                const Spacer(),
                InkWell(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusGeometry.circular(4),
                    ),
                    child: Image.asset(
                      "lib/core/ui/icons/ic_unfold_less.png",
                      height: 24,
                      width: 24,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
