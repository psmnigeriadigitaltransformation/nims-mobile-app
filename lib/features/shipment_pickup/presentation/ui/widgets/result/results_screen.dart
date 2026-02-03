import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/app/route_name+path+params.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/ui/screens/nims_screen.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_round_icon_button.dart';
import 'rejection_reason_dialog.dart';
import '../../../../../../core/domain/mappers/typedefs.dart';
import '../../../../../../core/ui/widgets/nims_error_content.dart';
import '../../../../../../core/ui/widgets/nims_primary_button.dart';
import '../../../../../../core/ui/widgets/nims_result_card.dart';
import '../../../../providers.dart';

class SelectResultsScreen extends ConsumerStatefulWidget {
  final DomainMovementType movementType;

  const SelectResultsScreen({super.key, required this.movementType});

  @override
  ConsumerState<SelectResultsScreen> createState() => _SelectResultsScreenState();
}

class _SelectResultsScreenState extends ConsumerState<SelectResultsScreen> {
  final TextEditingController selectedFacilityController = TextEditingController();

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
              onPressed: () => context.pop(),
            ),
            Spacer(),
            Text(
              "Results",
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
                            value: facility.facilityId?.toString() ?? "",
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
                        final facility = state.facilities.firstWhere(
                          (f) => f.facilityId?.toString() == value,
                          orElse: () => state.facilities.first,
                        );
                        selectedFacilityController.text = facility.facilityName ?? "";
                        ref
                            .read(
                              resultPickUpScreenStateNotifierProvider(
                                widget.movementType,
                              ).notifier,
                            )
                            .onSelectFacility(facility);
                      },
                      controller: selectedFacilityController,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40),

              /// -------------------------------
              /// RESULTS HEADER
              /// -------------------------------
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        "Results (${state.totalResultCount})",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(width: 8),
                      if (state.selectedResultCodes.isNotEmpty)
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
                            "${state.selectedResultCodes.length} Selected",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                    ],
                  ),
                  Spacer(),
                  if (state.resultsByManifest.isNotEmpty)
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
                              state.selectedResultCodes.length == state.selectableSampleCodes.length
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
                          final notifier = ref.read(
                            resultPickUpScreenStateNotifierProvider(
                              widget.movementType,
                            ).notifier,
                          );
                          if (state.selectedResultCodes.length == state.selectableSampleCodes.length) {
                            notifier.onUnselectAll();
                          } else {
                            notifier.onSelectAll();
                          }
                        },
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 12),

              /// -------------------------------
              /// RESULTS LIST
              /// -------------------------------
              SizedBox(
                height: size.height * 0.515,
                child: state.isLoadingResults
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 40,
                              height: 40,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Loading results...",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      )
                    : state.resultsByManifest.isEmpty
                        ? Center(
                            child: Text(
                              state.selectedFacility == null
                                  ? "Select a facility to view available results"
                                  : "No results available for this facility",
                              style: Theme.of(context).textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Scrollbar(
                            trackVisibility: true,
                            child: ListView(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              children: [
                                ...state.resultsByManifest.entries.map(
                                  (entry) {
                                    final manifestNo = entry.key;
                                    final results = entry.value;
                                    return Padding(
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
                                                    manifestNo,
                                                    style: Theme.of(
                                                      context,
                                                    ).textTheme.labelMedium,
                                                  ),
                                                ),
                                                SizedBox(width: 8),
                                                Text(
                                                  "${results.length} result${results.length > 1 ? 's' : ''}",
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
                                          ...results.map((result) {
                                            final isSelected = state.selectedResultCodes.contains(
                                              result.sampleCode,
                                            );
                                            final isRejected = result.isRejected == 1;
                                            final isPendingRejection = isRejected && result.rejectionSyncStatus != 'synced';
                                            final isLoading = state.loadingResultCodes.contains(
                                              result.sampleCode,
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
                                                        result: result,
                                                        isSelected: isSelected,
                                                        isLoading: isLoading,
                                                        actionLabel: "Reject",
                                                        onTapAction: isLoading ? () {} : () async {
                                                          if (isPendingRejection) {
                                                            // Accept (undo rejection)
                                                            ref
                                                                .read(
                                                                  resultPickUpScreenStateNotifierProvider(
                                                                    widget.movementType,
                                                                  ).notifier,
                                                                )
                                                                .onAcceptResult(result.sampleCode);
                                                          } else {
                                                            // Fetch rejection reasons from repository
                                                            final rejectionReasons = await ref
                                                                .read(rejectionReasonsRepositoryProvider)
                                                                .getRejectionReasonStrings();
                                                            if (!context.mounted) return;
                                                            // Show rejection dialog
                                                            final reason = await showDialog<String>(
                                                              context: context,
                                                              builder: (builder) => RejectionReasonDialog(
                                                                result: result,
                                                                rejectionReasons: rejectionReasons,
                                                              ),
                                                            );
                                                            if (reason != null && reason.isNotEmpty) {
                                                              ref
                                                                  .read(
                                                                    resultPickUpScreenStateNotifierProvider(
                                                                      widget.movementType,
                                                                    ).notifier,
                                                                  )
                                                                  .onRejectResult(result.sampleCode, reason);
                                                            }
                                                          }
                                                        },
                                                        onTapCheckBox: (isChecked) {
                                                          ref
                                                              .read(
                                                                resultPickUpScreenStateNotifierProvider(
                                                                  widget.movementType,
                                                                ).notifier,
                                                              )
                                                              .onToggleResultSelection(result.sampleCode);
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
                                    );
                                  },
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
                  // Get all selected results
                  final allResults = state.resultsByManifest.values
                      .expand((results) => results)
                      .toList();
                  final selectedResults = allResults
                      .where((result) =>
                          state.selectedResultCodes.contains(result.sampleCode))
                      .toList();

                  context.pushNamed(
                    resultShipmentScreen,
                    queryParameters: {
                      movementTypeQueryParam:
                          jsonEncode(widget.movementType.toJson()),
                      selectedResultsQueryParam:
                          jsonEncode(selectedResults.map((r) => r.toJson()).toList()),
                      pickupFacilityQueryParam:
                          jsonEncode(state.selectedFacility!.toJson()),
                    },
                  );
                },
                enabled: state.canProceedToApproval,
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
