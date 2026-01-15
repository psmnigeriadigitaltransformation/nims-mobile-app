import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/app/route_name+path+params.dart';
import 'package:nims_mobile_app/core/ui/screens/nims_base_screen.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_round_icon_button.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_specimen_shipment_summary_card.dart';
import '../../../../../core/domain/mappers/typedefs.dart';
import '../../../../../core/ui/widgets/nims_alert_dialog_content.dart';
import '../../../../../core/ui/widgets/nims_primary_button.dart';
import '../../../../../core/ui/widgets/nims_origin_dest_facilities_link_view.dart';
import '../../../providers.dart';
import 'signature_dialog.dart';

class SpecimenShipmentApprovalScreen extends ConsumerStatefulWidget {
  final DomainMovementType movementType;
  final DomainFacility pickUpFacility;
  final DomainFacility destinationFacility;
  final List<DomainShipment> shipments;

  const SpecimenShipmentApprovalScreen({
    super.key,
    required this.movementType,
    required this.pickUpFacility,
    required this.destinationFacility,
    required this.shipments,
  });

  @override
  ConsumerState<SpecimenShipmentApprovalScreen> createState() =>
      _SpecimenShipmentApprovalScreenState();
}

class _SpecimenShipmentApprovalScreenState
    extends ConsumerState<SpecimenShipmentApprovalScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final args = (
      movementType: widget.movementType,
      pickUpFacility: widget.pickUpFacility,
      destinationFacility: widget.destinationFacility,
      shipments: widget.shipments,
    );
    ref.listen(
      shipmentApprovalScreenStateNotifierProvider(args).select((s) => s.alert),
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
                      shipmentApprovalScreenStateNotifierProvider(
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
      shipmentApprovalScreenStateNotifierProvider(args),
      (prev, next) {
        if (prev?.showSuccessDialog == false && next.showSuccessDialog) {
          context.goNamed(
            shipmentSuccessScreen,
            queryParameters: {
              pickupFacilityQueryParam: jsonEncode(widget.pickUpFacility.toJson()),
              destinationFacilityQueryParam: jsonEncode(widget.destinationFacility.toJson()),
              shipmentsQueryParam: jsonEncode(
                next.shipments.map((s) => s.toJson()).toList(),
              ),
              routeQueryParam: next.createdRouteNo,
            },
          );
        }
      },
    );
    final state = ref.watch(shipmentApprovalScreenStateNotifierProvider(args));

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
                  "Specimen Shipment Approval",
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
              // height: size.height * 0.275,
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
                      child: NIMSSpecimenShipmentSummaryCard(
                        shipment: shipment,
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 40),

            /// -------------------------------
            /// PICK UP TEMPERATURE INPUT
            /// -------------------------------
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
              child: TextField(
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                decoration: const InputDecoration(
                  labelText: "Pick-up Temperature",
                  hintText: "Enter pick-up temperature",
                  helperText: "",
                  errorText: null,
                ),
                onChanged: (value) {
                  ref
                      .read(
                        shipmentApprovalScreenStateNotifierProvider(
                          args,
                        ).notifier,
                      )
                      .onUpdatePickUpTemperature(value);
                },
              ),
            ),

            const SizedBox(height: 8),

            /// -------------------------------
            /// FULL NAME INPUT
            /// -------------------------------
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
              child: TextField(
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
                        shipmentApprovalScreenStateNotifierProvider(
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
                        shipmentApprovalScreenStateNotifierProvider(
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
                        shipmentApprovalScreenStateNotifierProvider(
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
          text: "Approve Shipments",
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (buildContext) => SignatureDialog(
                onFinish: (signatureBase64) {
                  ref
                      .read(
                        shipmentApprovalScreenStateNotifierProvider(args).notifier,
                      )
                      .onUpdateSignature(signatureBase64);
                  ref
                      .read(
                        shipmentApprovalScreenStateNotifierProvider(args).notifier,
                      )
                      .onApproveShipment();
                },
              ),
            );
          },
          enabled: state.isApproveShipmentButtonEnabled,
        ),
      ),
    );
  }
}
