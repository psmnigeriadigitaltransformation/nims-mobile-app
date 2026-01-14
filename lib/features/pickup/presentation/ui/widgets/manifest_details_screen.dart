import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/sample.dart';
import 'package:nims_mobile_app/core/ui/screens/nims_screen.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_round_icon_button.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_origin_dest_facilities_link_view.dart';
import 'package:nims_mobile_app/features/dashboard/domain/route_type.dart';

import '../../../../../core/ui/theme/colors.dart';
import '../../../../../core/ui/widgets/nims_specimen_card.dart';
import '../../../../../core/ui/widgets/nims_status_chip.dart';
import 'approval_card.dart';

class ManifestDetailsScreen extends StatelessWidget {
  final DomainManifest manifest;

  const ManifestDetailsScreen({super.key, required this.manifest});

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
              onPressed: () => context.pop(),
            ),
            Spacer(),
            Text(
              "Manifest",
              style: TextTheme.of(context).titleSmall,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            SizedBox(width: 40),
          ],
        ),

        SizedBox(height: 8),

        Text(manifest.manifestNo, style: TextTheme.of(context).bodySmall),

        SizedBox(height: 50),

        /// -------------------------------------------
        /// ORIGINATING FACILITY DROPDOWN MENU + STATUS
        /// -------------------------------------------
        Row(
          children: [
            Expanded(
              child: NIMSOriginDestinationLinkView(
                origin: manifest.originatingFacilityName,
                destination: manifest.destinationFacilityName,
              ),
            ),
            SizedBox(width: 24),
            NIMSStatusChip(
              status: "In-Transit",
              statusColor: NIMSColors.green05,
              statusBackgroundColor: NIMSColors.green02.withAlpha(50),
            ),
          ],
        ),

        SizedBox(height: 24),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              manifest.sampleType,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Image.asset(
              "lib/core/ui/icons/ic_test_tube.png",
              height: 16,
              width: 16,
            ),
          ],
        ),

        SizedBox(height: 24),

        /// -------------------------------
        /// MANIFESTS
        /// -------------------------------
        Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Text(
            "Specimens (${manifest.sampleCount})",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: size.height * 0.252,
          child: Scrollbar(
            trackVisibility: true,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              children: [
                ...List.generate(
                  10,
                  (x) => Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                    child: NIMSSpecimenCard(
                      sample: Sample(
                        manifestNo: "82990-399-SM",
                        sampleCode: "SMA-199002",
                        patientCode: "BSNNS-1902",
                        age: "27 Y",
                        gender: "M",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 24),

        /// -------------------------------
        /// APPROVALS
        /// -------------------------------
        Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Text(
            "Pick-up Approval",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(height: 20),

        ApprovalCard(),

        SizedBox(height: 24),

        Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Text(
            "Delivery Approval",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(height: 20),

        ApprovalCard(),

        const SizedBox(height: 16),
      ],
    );
  }
}
