import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/ui/screens/nims_base_screen.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_round_icon_button.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/models/add_new_manifest_screen_state.dart';
import 'package:nims_mobile_app/features/pickup/presentation/ui/widgets/specimen/specimen_deletion_confirmation_dialog.dart';
import '../../../../../../core/ui/widgets/nims_alert_dialog_content.dart';
import '../../../../../../core/ui/widgets/nims_error_content.dart';
import '../../../../../../core/ui/widgets/nims_primary_button.dart';
import '../../../../../../core/ui/widgets/nims_specimen_card.dart';
import '../../../../providers.dart';
import '../specimen/add_new_specimen_dialog.dart';

class AddNewManifestScreen extends ConsumerWidget {
  final DomainMovementType movementType;
  final DomainFacility pickUpFacility;

  const AddNewManifestScreen({
    super.key,
    required this.movementType,
    required this.pickUpFacility,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final args = (movementType: movementType, pickUpFacility: pickUpFacility);

    ref.listen<AsyncValue<AddNewManifestScreenState>>(
      addNewManifestScreenStateNotifierProvider(args),
      (previous, next) {
        final prevShow = previous?.value?.alert.show ?? false;
        final nextShow = next.value?.alert.show ?? false;

        if (!prevShow && nextShow) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (buildContext) => NIMSAlertDialogContent(
              message: next.value!.alert.message,
              onTapActionButton: () {
                context.pop();
                ref
                    .read(
                      addNewManifestScreenStateNotifierProvider(args).notifier,
                    )
                    .onDismissAlertDialog();
              },
              actionButtonLabel: 'Okay',
            ),
          );
        }
      },
    );

    final asyncValueState = ref.watch(
      addNewManifestScreenStateNotifierProvider(args),
    );

    return asyncValueState.when(
      data: (data) => NIMSBaseScreen(
        header: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(
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
                    "New Manifest",
                    style: TextTheme.of(context).titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  SizedBox(width: 40),
                ],
              ),

              SizedBox(height: 8),

              Text(
                data.pickUpFacility?.facilityName ?? "",
                style: TextTheme.of(context).bodySmall,
              ),

              SizedBox(height: 42),

              SizedBox(
                height: 136,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.only(top: 4),
                      child: Column(
                        children: [
                          Image.asset(
                            "lib/core/ui/icons/ic_origin_location.png",
                            width: 16,
                            height: 16,
                          ),
                          Align(
                            alignment: AlignmentGeometry.centerLeft,
                            child: Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                horizontal: 10,
                              ),
                              child: Container(
                                width: 1,
                                color: Theme.of(context).colorScheme.secondary,
                                height: 50,
                              ),
                            ),
                          ),
                          Image.asset(
                            "lib/core/ui/icons/ic_destination_location.png",
                            width: 16,
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),

                    /// ---------------------------------------------------------
                    /// ORIGINATING FACILITY + DESTINATION FACILITY DROPDOWN MENU
                    /// ---------------------------------------------------------
                    Expanded(
                      child: Column(
                        spacing: 28,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.pickUpFacility?.facilityName ?? "",
                            style: Theme.of(context).textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                          DropdownMenu<String>(
                            trailingIcon: Icon(Icons.keyboard_arrow_down_rounded),
                            selectedTrailingIcon: Icon(
                              Icons.keyboard_arrow_up_rounded,
                            ),
                            width: size.width - 76,
                            label: Text("Destination Facility"),
                          dropdownMenuEntries: [
                            ...data.facilities.map(
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
                            ref
                                .read(
                                  addNewManifestScreenStateNotifierProvider(
                                    args,
                                  ).notifier,
                                )
                                .onSelectDestinationFacility(
                                  data.facilities.firstWhere(
                                    (facility) =>
                                        facility.facilityName == value,
                                  ),
                                );
                          },
                        ),
                      ],
                      ),
                    ),
                  ],
                ),
              ),

              DropdownMenu<String>(
                trailingIcon: Icon(Icons.keyboard_arrow_down_rounded),
                selectedTrailingIcon: Icon(Icons.keyboard_arrow_up_rounded),
                width: size.width - 46,
                label: Text("Specimen Type"),
                dropdownMenuEntries: [
                  ...data.sampleTypes.map(
                    (sample) => DropdownMenuEntry(
                      value: sample.fullName ?? "",
                      labelWidget: Text(
                        sample.fullName ?? "",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      label: sample.fullName ?? "",
                      style: ButtonStyle().copyWith(
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            side: BorderSide(
                              width: 0.25,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                onSelected: (value) {
                  ref
                      .read(
                        addNewManifestScreenStateNotifierProvider(
                          args,
                        ).notifier,
                      )
                      .onSelectSampleType(
                        data.sampleTypes.firstWhere(
                          (sampleType) => sampleType.fullName == value,
                        ),
                      );
                },
              ),

              SizedBox(height: 30),

              if (data.isSpecimenCountTitleAndAddSpecimenButtonVisible)
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                        "Specimens (${data.samples.length})",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Spacer(),
                      InkWell(
                        splashColor: Theme.of(context).splashColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Container(
                          padding: EdgeInsetsGeometry.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                "Add Specimen",
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimary,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (builder) => AddNewSpecimenDialog(
                              manifestNo: data.manifestNo,
                              currentSampleCount: data.samples.length,
                              onSaveSpecimen: (sample) {
                                ref
                                    .read(
                                      addNewManifestScreenStateNotifierProvider(
                                        args,
                                      ).notifier,
                                    )
                                    .onSavedSpecimen(sample);
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 16),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(
            children: [
              /// -------------------------------
              /// SPECIMENS
              /// -------------------------------
              if (data.isDestinationFacilitySelected)
                Column(
                  children: [
                    // const SizedBox(height: 16),
                    SizedBox(
                      // height: size.height * 0.379,
                      child: Scrollbar(
                        // controller: ScrollController(),
                        trackVisibility: true,
                        child: ListView.builder(
                          controller: ScrollController(),
                          shrinkWrap: true,
                          itemCount: data.samples.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                vertical: 4,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsGeometry.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: NIMSSpecimenCard(
                                        sample: data.samples[index],
                                        onTapDelete: () {
                                          showDialog(
                                            context: context,
                                            builder: (builder) =>
                                                SpecimenDeletionConfirmationDialog(
                                                  sample: data.samples[index],
                                                  onDelete: (sample) {
                                                    ref
                                                        .read(
                                                          addNewManifestScreenStateNotifierProvider(
                                                            args,
                                                          ).notifier,
                                                        )
                                                        .onConfirmDeleteSpecimen(
                                                          sample,
                                                        );
                                                  },
                                                ),
                                          );
                                        },
                                        actionLabel: "Delete",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),

        /// ----------------------------------------
        /// SAVE MANIFEST BUTTON
        /// ----------------------------------------
        bottom: Padding(
          padding: EdgeInsetsGeometry.only(bottom: 16),
          child: NIMSPrimaryButton(
            text: "Save Manifest",
            onPressed: () {
              ref
                  .read(
                    addNewManifestScreenStateNotifierProvider(args).notifier,
                  )
                  .onSaveManifest(() {
                    context.pop();
                  });
            },
            enabled: data.isSaveManifestButtonEnabled && !data.isSavingManifest,
            loading: data.isSavingManifest,
          ),
        ),
      ),
      error: (e, s) => NIMSErrorContent(
        message: e.toString(),
        onTapActionButton: () {
          ref
              .read(addNewManifestScreenStateNotifierProvider(args).notifier)
              .refreshState();
        },
        actionButtonLabel: 'Retry',
      ),
      // todo: update to loadind icon
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
    );
  }
}
