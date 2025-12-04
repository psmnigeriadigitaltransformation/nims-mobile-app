import 'package:flutter/material.dart';

class NIMSResultCard extends StatelessWidget {
  final VoidCallback onTapAction;
  final String actionLabel;
  final bool isSelected;
  final ValueChanged? onTapCheckBox;

  const NIMSResultCard({
    super.key,
    required this.onTapAction,
    required this.actionLabel,
    this.isSelected = false,
    this.onTapCheckBox,
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
              if (onTapCheckBox != null)
                Padding(
                  padding: EdgeInsetsGeometry.only(right: 4),
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      value: isSelected,
                      onChanged: onTapCheckBox,
                    ),
                  ),
                ),
              Flexible(
                flex: 2,
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
                    "PC-288939-29930",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Text("20 Y", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(width: 24),
              Text("M", style: Theme.of(context).textTheme.bodySmall),
              const Spacer(),
              InkWell(
                onTap: onTapAction,
                borderRadius: BorderRadius.all(Radius.circular(4)),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.errorContainer.withAlpha(150),
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(4)),
                  ),

                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: 2,
                      horizontal: 8,
                    ),
                    child: Text(
                      actionLabel,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
