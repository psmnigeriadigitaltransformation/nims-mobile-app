import 'package:flutter/material.dart';
import 'package:projects/core/ui/screens/nims_screen.dart';
import 'package:projects/core/ui/widgets/nims_round_icon_button.dart';
import 'package:projects/core/ui/widgets/nims_selected_manifest_card.dart';
import 'package:projects/features/dashboard/domain/route_type.dart';
import '../../../../core/ui/widgets/nims_primary_button.dart';
import '../../../../core/ui/widgets/signature_pad.dart';

class SpecimenDispatchApprovalScreen extends StatefulWidget {
  final RouteType routeType;

  const SpecimenDispatchApprovalScreen({super.key, required this.routeType});

  @override
  State<SpecimenDispatchApprovalScreen> createState() =>
      ResultDispatchApprovalScreenState();
}

class ResultDispatchApprovalScreenState
    extends State<SpecimenDispatchApprovalScreen> {
  final GlobalKey<SignaturePadState> signatureKey = GlobalKey();

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
              "Specimen Dispatch Approval",
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
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.only(left: 2.5),
                  child: Image.asset(
                    "lib/core/ui/icons/ic_origin_location.png",
                    width: 16,
                    height: 16,
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  "Gwagwalada General Hospital",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                child: Container(
                  width: 1,
                  color: Theme.of(context).colorScheme.secondary,
                  height: 16,
                ),
              ),
            ),
            Row(
              children: [
                Image.asset(
                  "lib/core/ui/icons/ic_destination_location.png",
                  width: 21,
                  height: 18,
                ),
                SizedBox(width: 16),
                Text(
                  "National Reference Lab",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: 40),

        /// -------------------------------
        /// SELECTED MANIFESTS
        /// -------------------------------
        Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Text(
            "Selected Manifests (2)",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),

        const SizedBox(height: 8),

        SizedBox(
          height: size.height * 0.25,
          child: ListView(
            children: [
              const SizedBox(height: 12),
              ...List.generate(
                4,
                (x) => Padding(
                  padding: const EdgeInsetsGeometry.symmetric(vertical: 4),
                  child: NimsSelectedManifestCard(),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

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
              labelText: "Pick Up Temperature",
              hintText: "Enter pick up temperature",
              helperText: "",
              errorText: null,
            ),
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
            child: SignaturePad(
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
        SizedBox(height: 24),
      ],
    );
  }
}
