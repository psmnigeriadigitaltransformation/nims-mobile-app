import 'package:flutter/material.dart';

class NIMSSpecimenCard extends StatefulWidget {
  final VoidCallback? onTapDelete;
  final String? actionLabel;

  const NIMSSpecimenCard({super.key, this.onTapDelete, this.actionLabel});

  @override
  State<StatefulWidget> createState() => NIMSSpecimenCardState();
}

class NIMSSpecimenCardState extends State<NIMSSpecimenCard> {
  bool isCommentRevealed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          onTap: () {
            setState(() {
              isCommentRevealed = !isCommentRevealed;
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
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
                    const Spacer(flex: 4),
                    if (widget.onTapDelete != null)
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
                    const Spacer(),
                    InkWell(
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.circular(4),
                        ),
                        child: Image.asset(
                          isCommentRevealed
                              ? "lib/core/ui/icons/ic_unfold_less.png"
                              : "lib/core/ui/icons/ic_unfold_more.png",
                          height: 24,
                          width: 24,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          isCommentRevealed = !isCommentRevealed;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (isCommentRevealed)
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),

                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                  width: 0.5,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.all(8),
                child: Text(
                  textAlign: TextAlign.center,
                  "This patient is in ICU and needs the test result ASAP!",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
