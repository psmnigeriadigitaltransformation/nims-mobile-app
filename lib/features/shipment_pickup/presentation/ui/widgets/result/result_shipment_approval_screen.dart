import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/app/route_name+path+params.dart';
import 'package:nims_mobile_app/core/ui/screens/nims_base_screen.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_round_icon_button.dart';
import '../../../../../../core/domain/mappers/typedefs.dart';
import '../../../../../../core/ui/widgets/nims_alert_dialog_content.dart';
import '../../../../../../core/ui/widgets/nims_primary_button.dart';
import '../../../../../../core/ui/widgets/nims_origin_dest_facilities_link_view.dart';
import '../../../../../../core/ui/widgets/nims_result_shipment_summary_card.dart';
import '../../../../providers.dart';
import '../signature_dialog.dart';

class ResultShipmentApprovalScreen extends ConsumerStatefulWidget {
  final DomainMovementType movementType;
  final DomainFacility pickUpFacility;
  final DomainFacility destinationFacility;
  final List<DomainShipment> shipments;
  final List<String> shipmentSampleCodes;

  const ResultShipmentApprovalScreen({
    super.key,
    required this.movementType,
    required this.pickUpFacility,
    required this.destinationFacility,
    required this.shipments,
    required this.shipmentSampleCodes,
  });

  @override
  ConsumerState<ResultShipmentApprovalScreen> createState() =>
      _ResultShipmentApprovalScreenState();
}

class _ResultShipmentApprovalScreenState
    extends ConsumerState<ResultShipmentApprovalScreen> {
  late final TextEditingController _fullNameController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _designationController;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _designationController = TextEditingController();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _designationController.dispose();
    super.dispose();
  }

  /// Syncs controller values back to state if controllers have values but state is empty
  void _syncControllersToState(
    ({
      DomainMovementType movementType,
      DomainFacility pickUpFacility,
      DomainFacility destinationFacility,
      List<DomainShipment> shipments,
      List<String> shipmentSampleCodes,
    }) args,
  ) {
    final notifier = ref.read(resultShipmentApprovalScreenStateNotifierProvider(args).notifier);
    final state = ref.read(resultShipmentApprovalScreenStateNotifierProvider(args));

    // Sync values from controllers to state if controller has value but state is empty
    if (_fullNameController.text.isNotEmpty && state.fullName.isEmpty) {
      notifier.onUpdateFullName(_fullNameController.text);
    }
    if (_phoneNumberController.text.isNotEmpty && state.phoneNumber.isEmpty) {
      notifier.onUpdatePhoneNumber(_phoneNumberController.text);
    }
    if (_designationController.text.isNotEmpty && state.designation.isEmpty) {
      notifier.onUpdateDesignation(_designationController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = (
      movementType: widget.movementType,
      pickUpFacility: widget.pickUpFacility,
      destinationFacility: widget.destinationFacility,
      shipments: widget.shipments,
      shipmentSampleCodes: widget.shipmentSampleCodes,
    );

    // Sync controller values to state after frame to handle navigation back
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _syncControllersToState(args);
    });

    ref.listen(
      resultShipmentApprovalScreenStateNotifierProvider(args)
          .select((s) => s.alert),
      (prev, next) {
        final prevShow = prev?.show ?? false;
        final nextShow = next.show;
        if (!prevShow && nextShow) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (buildContext) => NIMSAlertDialogContent(
              message: next.message,
              onTapActionButton: () {
                context.pop();
                ref
                    .read(
                      resultShipmentApprovalScreenStateNotifierProvider(
                        args,
                      ).notifier,
                    )
                    .onDismissAlertDialog();
              },
              actionButtonLabel: 'Okay',
            ),
          );
        }
      },
    );

    ref.listen(
      resultShipmentApprovalScreenStateNotifierProvider(args),
      (prev, next) {
        if (prev?.showSuccessDialog == false && next.showSuccessDialog) {
          context.goNamed(
            resultShipmentSuccessScreen,
            queryParameters: {
              pickupFacilityQueryParam:
                  jsonEncode(widget.pickUpFacility.toJson()),
              destinationFacilityQueryParam:
                  jsonEncode(widget.destinationFacility.toJson()),
              shipmentsQueryParam: jsonEncode(
                next.shipments.map((s) => s.toJson()).toList(),
              ),
              routeQueryParam: next.createdRouteNo,
            },
          );
        }
      },
    );

    final state =
        ref.watch(resultShipmentApprovalScreenStateNotifierProvider(args));

    return NIMSBaseScreen(
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
                  "Result Shipment Approval",
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
            SizedBox(height: 24),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 24),

            /// -------------------------------------------
            /// ORIGINATING FACILITY + DESTINATION FACILITY
            /// -------------------------------------------
            NIMSOriginDestinationLinkView(
              origin: widget.pickUpFacility.facilityName ?? "",
              destination: widget.destinationFacility.facilityName ?? "",
            ),

            SizedBox(height: 40),

            /// -------------------------------
            /// SHIPMENTS
            /// -------------------------------
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text(
                "Shipments (${widget.shipments.length})",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),

            const SizedBox(height: 8),

            SizedBox(
              child: Scrollbar(
                trackVisibility: true,
                child: ListView.builder(
                  controller: ScrollController(),
                  shrinkWrap: true,
                  itemCount: state.shipments.length,
                  itemBuilder: (context, index) {
                    final shipment = state.shipments[index];
                    return Padding(
                      padding: const EdgeInsetsGeometry.symmetric(vertical: 4),
                      child: NIMSResultShipmentSummaryCard(
                        shipment: shipment,
                        resultCount: state.shipmentSampleCodes.length,
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 40),

            /// -------------------------------
            /// FULL NAME INPUT
            /// -------------------------------
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
              child: TextField(
                controller: _fullNameController,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  hintText: "Enter full name",
                  helperText: "",
                  errorText: null,
                ),
                onChanged: (value) {
                  ref
                      .read(
                        resultShipmentApprovalScreenStateNotifierProvider(
                          args,
                        ).notifier,
                      )
                      .onUpdateFullName(value);
                },
              ),
            ),

            const SizedBox(height: 8),

            /// -------------------------------
            /// PHONE NUMBER INPUT
            /// -------------------------------
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
              child: TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                maxLength: 11,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  hintText: "Enter phone number",
                  counterText: "",
                  errorText: state.phoneNumberError,
                ),
                onChanged: (value) {
                  ref
                      .read(
                        resultShipmentApprovalScreenStateNotifierProvider(
                          args,
                        ).notifier,
                      )
                      .onUpdatePhoneNumber(value);
                },
              ),
            ),

            const SizedBox(height: 28),

            /// -------------------------------
            /// DESIGNATION INPUT
            /// -------------------------------
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
              child: TextField(
                controller: _designationController,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                decoration: const InputDecoration(
                  labelText: "Designation",
                  hintText: "Enter designation",
                  helperText: "",
                  errorText: null,
                ),
                onChanged: (value) {
                  ref
                      .read(
                        resultShipmentApprovalScreenStateNotifierProvider(
                          args,
                        ).notifier,
                      )
                      .onUpdateDesignation(value);
                },
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
      bottom: Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: NIMSPrimaryButton(
          text: state.isSavingShipmentRoute ? "Saving..." : "Approve Shipments",
          onPressed: state.isSavingShipmentRoute
              ? null
              : () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (buildContext) => SignatureDialog(
                      onFinish: (signatureBase64) async {
                        ref
                            .read(
                              resultShipmentApprovalScreenStateNotifierProvider(
                                      args)
                                  .notifier,
                            )
                            .onUpdateSignature(signatureBase64);
                        await ref
                            .read(
                              resultShipmentApprovalScreenStateNotifierProvider(
                                      args)
                                  .notifier,
                            )
                            .onApproveShipment();
                      },
                    ),
                  );
                },
          enabled: state.isApproveShipmentButtonEnabled &&
              !state.isSavingShipmentRoute,
        ),
      ),
    );
  }
}
