import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projects/app/route_name+path+params.dart';
import 'package:projects/core/ui/screens/nims_screen.dart';
import 'package:projects/core/ui/widgets/nims_round_icon_button.dart';
import 'package:projects/features/dashboard/domain/route_type.dart';
import '../../../../core/ui/widgets/nims_error_button.dart';
import '../../../../core/ui/widgets/nims_manifest_card.dart';
import '../../../../core/ui/widgets/nims_primary_button.dart';
import '../../../../core/ui/widgets/nims_result_card.dart';
import '../../../../core/ui/widgets/nims_secondary_button.dart';
import '../../../dashboard/domain/mock.dart';

class ResultPickUpScreen extends StatelessWidget {
  final RouteType routeType;

  const ResultPickUpScreen({super.key, required this.routeType});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return NIMSScreen(
      children: [
        SizedBox(height: 16),

        /// ----------------------------------------
        /// TITLE + SUBTITLE
        /// ----------------------------------------
        Row(
          children: [
            NIMSRoundIconButton(
              icon: Icons.arrow_back_ios_rounded,
              onPressed: () => {},
            ),
            Spacer(),
            Text(
              "Result Pick Up",
              style: TextTheme.of(context).titleSmall,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            SizedBox(width: 40),
          ],
        ),

        SizedBox(height: 8),

        Text(routeType.label, style: TextTheme.of(context).bodySmall),

        SizedBox(height: 50),

        /// ----------------------------------------
        /// ORIGINATING FACILITY DROPDOWN MENU
        /// ----------------------------------------
        Row(
          children: [
            Image.asset(
              "lib/core/ui/icons/ic_origin_location.png",
              width: 16,
              height: 16,
            ),
            SizedBox(width: 16),
            Flexible(
              child: DropdownMenu<String>(
                trailingIcon: Icon(Icons.keyboard_arrow_down_rounded),
                selectedTrailingIcon: Icon(Icons.keyboard_arrow_up_rounded),
                width: size.width - 80,
                label: Text("PickUp Facility"),
                dropdownMenuEntries: [
                  ...Mock.facilities.map(
                    (facility) => DropdownMenuEntry(
                      value: facility,
                      labelWidget: Center(
                        child: Text(
                          facility,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      label: facility,
                    ),
                  ),
                ],
                onSelected: (value) {},
              ),
            ),
          ],
        ),

        SizedBox(height: 40),

        /// -------------------------------
        /// RESULTS
        /// -------------------------------
        Row(
          children: [
            Text("Specimens (8)", style: Theme.of(context).textTheme.titleSmall),
            Spacer(),
            Container(
              padding: EdgeInsetsGeometry.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Theme.of(context).colorScheme.primary,
              ),

              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Center(
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
                    child: Text(
                      "Select All",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        SizedBox(
          height: size.height * 0.515,
          child: Scrollbar(
            thumbVisibility: true,
            trackVisibility: true,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              children: [
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Row(
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
                          color: Theme.of(
                            context,
                          ).colorScheme.tertiaryContainer,
                        ),
                        child: Text(
                          "PC-288939-29930",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Sputum",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                ...List.generate(
                  20,
                  (x) => Padding(
                    padding: const EdgeInsetsGeometry.symmetric(vertical: 4),

                    child: NIMSResultCard(
                      actionLabel: "Reject",
                      onTapAction: () {
                        showDialog(
                          context: context,
                          builder: (builder) => Dialog(
                            insetPadding: EdgeInsets.symmetric(horizontal: 20),
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.surface,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      NIMSRoundIconButton(
                                        icon: Icons.close,
                                        onPressed: context.pop,
                                      ),
                                      Spacer(),
                                      Text(
                                        "Rejection Reason",
                                        style: TextTheme.of(context).titleSmall,
                                        textAlign: TextAlign.center,
                                      ),
                                      Spacer(),
                                      SizedBox(width: 40),
                                    ],
                                  ),

                                  SizedBox(height: 8),

                                  Row(
                                    children: [
                                      const Spacer(),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 3,
                                          horizontal: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.tertiaryContainer,
                                        ),
                                        child: Text(
                                          "PC-288939-29930",
                                          style: Theme.of(
                                            context,
                                          ).textTheme.labelSmall,
                                        ),
                                      ),
                                      const SizedBox(width: 24),
                                      Text(
                                        "20 Y",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall,
                                      ),
                                      const SizedBox(width: 24),
                                      Text(
                                        "M",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall,
                                      ),
                                      const Spacer(),
                                    ],
                                  ),

                                  SizedBox(height: 40),

                                  /// -------------------------------
                                  ///REASON FOR REJECTION INPUT
                                  /// -------------------------------
                                  DropdownMenu<String>(
                                    trailingIcon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                    ),
                                    selectedTrailingIcon: Icon(
                                      Icons.keyboard_arrow_up_rounded,
                                    ),
                                    width: size.width - 100,
                                    label: Text("Reason for Rejection"),
                                    dropdownMenuEntries: [
                                      ...Mock.reasonsForRejection.map(
                                        (facility) => DropdownMenuEntry(
                                          value: facility,
                                          labelWidget: Center(
                                            child: Text(
                                              facility,
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodySmall,
                                            ),
                                          ),
                                          label: facility,
                                        ),
                                      ),
                                    ],
                                    onSelected: (value) {},
                                  ),

                                  SizedBox(height: 100),

                                  /// -------------------------------
                                  /// CONFIRM + CANCEL BUTTONS
                                  /// -------------------------------
                                  Row(
                                    children: [
                                      Expanded(
                                        child: NIMSErrorButton(
                                          text: "Confirm",
                                          onPressed: context.pop,
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      Expanded(
                                        child: NIMSSecondaryButton(
                                          text: "Cancel",
                                          onPressed: context.pop,
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 16),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 45.5),

        /// ----------------------------------------
        /// DISPATCH RESULTS BUTTON
        /// ----------------------------------------
        NIMSPrimaryButton(
          text: "Dispatch Results",
          onPressed: () {
            context.pushNamed(resultDispatchApprovalScreen);
          },
        ),

        const SizedBox(height: 16),
      ],
    );
  }
}
