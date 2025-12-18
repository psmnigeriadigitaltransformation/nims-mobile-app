import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:projects/app/route_name+path+params.dart';
import 'package:projects/core/ui/screens/nims_screen.dart';
import 'package:projects/core/ui/widgets/nims_round_icon_button.dart';
import 'package:projects/features/pickup/presentation/ui/widgets/rejection_reason_dialog.dart';
import '../../../../../core/domain/mappers/typedefs.dart';
import '../../../../../core/ui/widgets/nims_error_content.dart';
import '../../../../../core/ui/widgets/nims_primary_button.dart';
import '../../../../../core/ui/widgets/nims_result_card.dart';
import '../../../providers.dart';

class ResultPickUpScreen extends ConsumerStatefulWidget {
  final DomainMovementType movementType;

  const ResultPickUpScreen({super.key, required this.movementType});

  @override
  ConsumerState<ResultPickUpScreen> createState() => _ResultPickUpScreenState();
}

class _ResultPickUpScreenState extends ConsumerState<ResultPickUpScreen> {
  final TextEditingController selectedFacilityController = TextEditingController();
  final Set<String> selectedSpecimens = {};
  final List<String> specimens = [
    "PC-1234-2993",
    "PC-2783-3145",
    "PC-90993-3145",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final asyncValueState = ref.watch(
      resultPickUpScreenStateNotifierProvider(
        widget.movementType
      ),
    );

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
              "Result Pick-up",
              style: TextTheme.of(context).titleSmall,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            SizedBox(width: 40),
          ],
        ),

        SizedBox(height: 8),

        Text(
          widget.movementType.movement ?? "",
          style: TextTheme.of(context).bodySmall,
        ),

        SizedBox(height: 50),

        asyncValueState.when(
          data: (state) => Column(
            children: [
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
                      selectedTrailingIcon: Icon(
                        Icons.keyboard_arrow_up_rounded,
                      ),
                      width: size.width - 80,
                      label: Text("PickUp Facility"),
                      dropdownMenuEntries: [
                        ...state.facilities.map(
                          (facility) => DropdownMenuEntry(
                            value: facility.facilityName ?? "",
                            labelWidget: Text(
                              facility.facilityName ?? "",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            label: facility.facilityName ?? "",
                            style: ButtonStyle().copyWith(
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 0.25,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.outline,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                      onSelected: (value) {
                        setState(() {
                          selectedFacilityController.text = value ?? "";
                        });
                      },
                      controller: selectedFacilityController,
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
                  Row(
                    children: [
                      Text(
                        "Specimens (8)",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(width: 8),
                      if (selectedSpecimens.isNotEmpty)
                        Container(
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Theme.of(
                              context,
                            ).colorScheme.tertiaryContainer,
                          ),
                          child: Text(
                            "${selectedSpecimens.length} Selected",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                    ],
                  ),
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
                            selectedSpecimens.length == specimens.length
                                ? "Unselect All"
                                : "Select All",
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                ),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedSpecimens.length == specimens.length
                              ? selectedSpecimens.clear()
                              : selectedSpecimens.addAll(specimens);
                        });
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: size.height * 0.515,
                child: Scrollbar(
                  trackVisibility: true,
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    children: [
                      ...["PC-288939-29930", "PC-288939-31452"].map(
                        (manifestID) => Padding(
                          padding: EdgeInsetsGeometry.symmetric(vertical: 12),
                          child: Column(
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
                                        manifestID,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelMedium,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "Sputum",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              ...specimens.map((specimenId) {
                                final isSelected = selectedSpecimens.contains(
                                  specimenId,
                                );
                                return Padding(
                                  padding: const EdgeInsetsGeometry.symmetric(
                                    vertical: 4,
                                  ),

                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsetsGeometry.symmetric(
                                            horizontal: 8,
                                          ),
                                          child: NIMSResultCard(
                                            isSelected: isSelected,
                                            actionLabel: "Reject",
                                            onTapAction: () {
                                              showDialog(
                                                context: context,
                                                builder: (builder) =>
                                                    RejectionReasonDialog(),
                                              );
                                            },
                                            onTapCheckBox: (isChecked) {
                                              setState(() {
                                                if (isSelected) {
                                                  selectedSpecimens.remove(
                                                    specimenId,
                                                  );
                                                } else {
                                                  selectedSpecimens.add(
                                                    specimenId,
                                                  );
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 45.5),

              /// ----------------------------------------
              /// NEXT BUTTON
              /// ----------------------------------------
              NIMSPrimaryButton(
                text: "Next",
                onPressed: () {
                  context.pushNamed(resultDispatchApprovalScreen);
                },
                enabled: selectedSpecimens.isNotEmpty,
              ),

              const SizedBox(height: 16),
            ],
          ),
          error: (e, s) => NIMSErrorContent(
            message: e.toString(),
            onTapActionButton: () {
              ref
                  .read(
                    resultPickUpScreenStateNotifierProvider(
                      widget.movementType,
                    ).notifier,
                  )
                  .refreshState();
            },
            actionButtonLabel: 'Retry',
          ),
          loading: () => Container(
            color: Theme.of(context).colorScheme.surface,
            child: Center(
              child: const SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
