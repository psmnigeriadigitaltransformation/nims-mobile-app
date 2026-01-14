import 'package:flutter/material.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';

class NIMSManifestCard extends StatelessWidget {
  final DomainManifest manifest;
  final VoidCallback onTapManifest;
  final VoidCallback onTapDelete;
  final bool isSelected;

  const NIMSManifestCard({
    super.key,
    required this.manifest,
    required this.onTapManifest,
    required this.isSelected,
    required this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapManifest,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.tertiary
                : Theme.of(context).colorScheme.outline,
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
                    manifest.manifestNo,
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
                 Expanded(child:  Text(
                   manifest.originatingFacilityName,
                   style: Theme.of(context).textTheme.bodySmall?.copyWith(
                     color: Theme.of(context).colorScheme.tertiary,
                   ),
                   maxLines: 1,
                   overflow: TextOverflow.ellipsis,
                 ),),
                  SizedBox(width: 24,),
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
    );
  }
}
