import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/app/route_name+path+params.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/ui/screens/nims_base_screen.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_round_icon_button.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_specimen_shipment_summary_card.dart';
import 'package:nims_mobile_app/features/shipment_delivery/specimen_shipment_delivery/providers.dart';
import '../../../core/ui/widgets/nims_alert_dialog_content.dart';
import '../../../core/ui/widgets/nims_primary_button.dart';
import '../../../core/ui/widgets/nims_origin_dest_facilities_link_view.dart';
import '../../shipment_pickup/presentation/ui/widgets/signature_dialog.dart';

class SpecimenDeliveryApprovalScreen extends ConsumerStatefulWidget {
  final DomainShipmentRoute route;
  final List<DomainShipment> shipments;

  const SpecimenDeliveryApprovalScreen({
    super.key,
    required this.route,
    required this.shipments,

  });

  @override
  ConsumerState<SpecimenDeliveryApprovalScreen> createState() =>
      _SpecimenDeliveryApprovalScreenState();
}

class _SpecimenDeliveryApprovalScreenState
    extends ConsumerState<SpecimenDeliveryApprovalScreen> {
  @override
  Widget build(BuildContext context) {
    final args = (
    route: widget.route,
      shipments: widget.shipments,

    );

    ref.listen(
      specimenDeliveryApprovalScreenStateNotifierProvider(args).select((s) => s.alert),
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
                      specimenDeliveryApprovalScreenStateNotifierProvider(args).notifier,
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
      specimenDeliveryApprovalScreenStateNotifierProvider(args),
      (prev, next) {
        if (prev?.showSuccessScreen == false && next.showSuccessScreen) {
          context.goNamed(
            specimenDeliverySuccessScreen,
            queryParameters: {
              destinationFacilityNameQueryParam: widget.route.destinationFacilityName,
              shipmentsQueryParam: jsonEncode(
                next.shipments.map((s) => s.toJson()).toList(),
              ),
            },
          );
        }
      },
    );

    final state = ref.watch(specimenDeliveryApprovalScreenStateNotifierProvider(args));

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
                  "Specimen Delivery Approval",
                  style: TextTheme.of(context).titleSmall,
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                SizedBox(width: 40),
              ],
            ),

            SizedBox(height: 8),

            Text(
              widget.route.destinationFacilityName,
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
            /// ORIGIN + DESTINATION FACILITY
            /// -------------------------------------------
            NIMSOriginDestinationLinkView(
              origin: widget.route.originFacilityName,
              destination: widget.route.destinationFacilityName,
            ),

            SizedBox(height: 40),

            /// -------------------------------
            /// SHIPMENTS
            /// -------------------------------
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text(
                "Shipments (${state.shipments.length})",
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
            /// DELIVERY TEMPERATURE INPUT
            /// -------------------------------
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
              child: TextField(
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                decoration: const InputDecoration(
                  labelText: "Delivery Temperature",
                  hintText: "Enter delivery temperature",
                  helperText: "",
                  errorText: null,
                ),
                onChanged: (value) {
                  ref
                      .read(
                        specimenDeliveryApprovalScreenStateNotifierProvider(args).notifier,
                      )
                      .onUpdateDeliveryTemperature(value);
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
                        specimenDeliveryApprovalScreenStateNotifierProvider(args).notifier,
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
                        specimenDeliveryApprovalScreenStateNotifierProvider(args).notifier,
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
                        specimenDeliveryApprovalScreenStateNotifierProvider(args).notifier,
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
        child: state.isSavingDelivery
            ? Center(child: CircularProgressIndicator())
            : NIMSPrimaryButton(
                text: "Approve Delivery",
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (buildContext) => SignatureDialog(
                      onFinish: (signatureBase64) async {
                        ref
                            .read(
                              specimenDeliveryApprovalScreenStateNotifierProvider(args).notifier,
                            )
                            .onUpdateSignature(signatureBase64);
                        await ref
                            .read(
                              specimenDeliveryApprovalScreenStateNotifierProvider(args).notifier,
                            )
                            .onApproveDelivery();
                      },
                    ),
                  );
                },
                enabled: state.isApproveDeliveryButtonEnabled,
              ),
      ),
    );
  }
}
