import 'package:flutter/material.dart';
import 'package:projects/core/ui/screens/nims_screen.dart';
import 'package:projects/core/ui/widgets/nims_round_icon_button.dart';
import 'package:projects/core/ui/widgets/nims_origin_dest_facilities_link_view.dart';
import 'package:projects/features/dashboard/domain/route_type.dart';

import '../../../../../core/ui/theme/colors.dart';
import '../../../../../core/ui/widgets/nims_specimen_card.dart';
import '../../../../../core/ui/widgets/nims_status_chip.dart';
import 'approval_card.dart';

class ShipmentDetailsScreen extends StatelessWidget {
  final RouteType routeType;

  const ShipmentDetailsScreen({super.key, required this.routeType});

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
              "Shipment",
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

        /// -------------------------------------------
        /// ORIGINATING FACILITY DROPDOWN MENU + STATUS
        /// -------------------------------------------
        Row(
          children: [
            Expanded(child: NIMSOriginDestinationLinkView()),
            NIMSStatusChip(
              status: "Delivered",
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
              "Sputum",
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
            "Specimens (10)",
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
                    child: NIMSSpecimenCard(),
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
