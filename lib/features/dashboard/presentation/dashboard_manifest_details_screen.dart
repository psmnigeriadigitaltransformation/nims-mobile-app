import 'package:flutter/material.dart';
import 'package:projects/core/ui/screens/nims_screen.dart';
import 'package:projects/core/ui/widgets/nims_round_icon_button.dart';
import 'package:projects/core/ui/widgets/nims_specimen_card.dart';
import 'package:projects/core/ui/widgets/nims_origin_dest_facilities_link_view.dart';
import 'package:projects/features/dashboard/domain/route_type.dart';

class DashboardManifestDetailsScreen extends StatelessWidget {
  final RouteType routeType;

  const DashboardManifestDetailsScreen({super.key, required this.routeType});

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
              "Manifest",
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

        /// ----------------------------------------
        /// ORIGINATING FACILITY DROPDOWN MENU
        /// ----------------------------------------
        NIMSOriginDestinationLinkView(),

        SizedBox(height: 40),

        Row(
          children: [
            Text(
              "Specimen Type",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Spacer(),
            Row(
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
          ],
        ),

        SizedBox(height: 40),

        /// -------------------------------
        /// MANIFESTS
        /// -------------------------------
        Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Text(
            "Specimens (2)",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: size.height * 0.565,
          child: ListView(
            children: [
              ...List.generate(
                2,
                (x) => Padding(
                  padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                  child: NIMSSpecimenCard(),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}
