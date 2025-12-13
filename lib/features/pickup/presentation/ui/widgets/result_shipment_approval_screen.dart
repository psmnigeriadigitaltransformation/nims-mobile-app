import 'package:flutter/material.dart';
import 'package:projects/core/ui/screens/nims_screen.dart';
import 'package:projects/core/ui/widgets/nims_round_icon_button.dart';
import 'package:projects/core/ui/widgets/nims_specimen_shipment_summary_card.dart';
import 'package:projects/features/dashboard/domain/route_type.dart';

import '../../../../../core/ui/widgets/nims_origin_dest_facilities_link_view.dart';
import '../../../../../core/ui/widgets/nims_primary_button.dart';
import '../../../../../core/ui/widgets/nims_result_shipment_summary_card.dart';
import '../../../../../core/ui/widgets/nims_signature_pad.dart';


class ResultShipmentApprovalScreen extends StatefulWidget {
  final RouteType routeType;

  const ResultShipmentApprovalScreen({super.key, required this.routeType});

  @override
  State<ResultShipmentApprovalScreen> createState() =>
      ResultShipmentApprovalScreenState();
}

class ResultShipmentApprovalScreenState
    extends State<ResultShipmentApprovalScreen> {
  final GlobalKey<NIMSSignaturePadState> signatureKey = GlobalKey();

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
              "Result Shipment Approval",
              style: TextTheme.of(context).titleSmall,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            SizedBox(width: 40),
          ],
        ),

        SizedBox(height: 8),

        Text(widget.routeType.label, style: TextTheme.of(context).bodySmall),

        SizedBox(height: 50),

        /// -------------------------------------------
        /// ORIGINATING FACILITY + DESTINATION FACILITY
        /// -------------------------------------------
        NIMSOriginDestinationLinkView(),

        SizedBox(height: 40),

        /// -------------------------------
        /// SELECTED RESULTS
        /// -------------------------------
        Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Text(
            "Shipments (2)",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),

        const SizedBox(height: 8),

        SizedBox(
          height: size.height * 0.275,
          child: Scrollbar(
            trackVisibility: true,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              children: [
                ...List.generate(
                  5,
                  (x) => Padding(
                    padding: const EdgeInsetsGeometry.symmetric(vertical: 4),
                    child: NIMSResultShipmentSummaryCard(),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 24),

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
          ),
        ),

        const SizedBox(height: 8),

        /// -------------------------------
        /// PHONE NUMBER INPUT
        /// -------------------------------
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
          child: TextField(
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            decoration: const InputDecoration(
              labelText: "Phone Number",
              hintText: "Enter phone number",
              helperText: "",
              errorText: null,
            ),
          ),
        ),

        const SizedBox(height: 8),

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
          ),
        ),

        const SizedBox(height: 8),

        /// ----------------------------------------
        /// SIGNATURE PAD
        /// ----------------------------------------
        SizedBox(
          height: 150,
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 9),
            child: NIMSSignaturePad(
              key: signatureKey,
              strokeColor: Colors.black,
              backgroundColor: Theme.of(context).colorScheme.surface,
            ),
          ),
        ),

        const SizedBox(height: 12),

        Align(
          alignment: AlignmentGeometry.centerRight,
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
            child: InkWell(
              child: Container(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
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
                    "Clear",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
              ),
              onTap: () {
                signatureKey.currentState?.clear();
              },
            ),
          ),
        ),

        const SizedBox(height: 40),

        /// ----------------------------------------
        /// APPROVE BUTTON
        /// ----------------------------------------
        NIMSPrimaryButton(text: "Approve", onPressed: () {}),
        SizedBox(height: 16),
      ],
    );
  }
}
