import 'package:flutter/material.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';

class NIMSSpecimenCard extends StatefulWidget {
  final VoidCallback? onTapDelete;
  final String? actionLabel;
  final DomainSample sample;

  const NIMSSpecimenCard({
    super.key,
    this.onTapDelete,
    this.actionLabel,
    required this.sample,
  });

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
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 3,
                          horizontal: 6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        child: Text(
                          widget.sample.sampleCode,
                          style: Theme.of(context).textTheme.labelMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      widget.sample.age,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      widget.sample.gender,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(width: 20),
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

                    // if (widget.sample.comment?.isNotEmpty == true)
                    //   Row(
                    //     children: [
                    //       const SizedBox(width: 20),
                    //       InkWell(
                    //         borderRadius: BorderRadius.circular(4),
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadiusGeometry.circular(4),
                    //           ),
                    //           child: Image.asset(
                    //             isCommentRevealed
                    //                 ? "lib/core/ui/icons/ic_unfold_less.png"
                    //                 : "lib/core/ui/icons/ic_unfold_more.png",
                    //             height: 24,
                    //             width: 24,
                    //             color: Theme.of(context).colorScheme.secondary,
                    //           ),
                    //         ),
                    //         onTap: () {
                    //           setState(() {
                    //             isCommentRevealed = !isCommentRevealed;
                    //           });
                    //         },
                    //       ),
                    //     ],
                    //   )
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
