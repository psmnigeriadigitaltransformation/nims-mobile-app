import 'package:flutter/material.dart';
import 'package:projects/core/ui/screens/nims_screen.dart';
import 'package:projects/core/ui/widgets/nims_round_icon_button.dart';
import 'package:projects/core/ui/widgets/nims_specimen_shipment_summary_card.dart';
import 'package:projects/core/ui/widgets/nims_status_chip.dart';
import 'package:projects/core/ui/widgets/nims_origin_dest_facilities_link_view.dart';
import 'package:projects/features/dashboard/domain/route_type.dart';
import '../../../../core/ui/theme/colors.dart';

class RouteDetailsScreen extends StatelessWidget {
  final RouteType routeType;

  const RouteDetailsScreen({super.key, required this.routeType});

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
              "Route",
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
        /// -------------------------------------------g
        Row(
          children: [
            Expanded(child: NIMSOriginDestinationLinkView(origin: '', destination: '',)),
            NIMSStatusChip(
              status: "Delivered",
              statusColor: NIMSColors.green05,
              statusBackgroundColor: NIMSColors.green02.withAlpha(50),
            ),
          ],
        ),

        SizedBox(height: 40),

        /// -------------------------------
        /// MANIFESTS
        /// -------------------------------
        Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Text(
            "Shipments (4)",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: size.height * 0.632,
          child: Scrollbar(
            trackVisibility: true,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              children: [
                // ...List.generate(
                //   8,
                //   (x) => Padding(
                //     padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                //     child: NIMSSpecimenShipmentSummaryCard(),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
