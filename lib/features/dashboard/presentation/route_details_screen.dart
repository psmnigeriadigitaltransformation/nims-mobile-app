import 'package:flutter/material.dart';
import 'package:projects/core/ui/screens/nims_screen.dart';
import 'package:projects/core/ui/widgets/nims_round_icon_button.dart';
import 'package:projects/core/ui/widgets/nims_selected_manifest_card.dart';
import 'package:projects/core/ui/widgets/nims_status_chip.dart';
import 'package:projects/core/ui/widgets/nims_origin_dest_facilities_link_view.dart';
import 'package:projects/features/dashboard/domain/route_type.dart';
import '../../../core/ui/theme/colors.dart';

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

        /// ----------------------------------------
        /// ORIGINATING FACILITY DROPDOWN MENU
        /// ----------------------------------------
        Row(
          children: [
            Expanded(child: NIMSOriginDestinationLinkView()),
            NIMSStatusChip(
              status: "Dispatched",
              statusColor: NIMSColors.green05,
              statusBackgroundColor: NIMSColors.green02.withAlpha(50),
            ),
          ],
        ),

        // NIMSOriginDestinationLinkView(),
        SizedBox(height: 40),

        /// -------------------------------
        /// MANIFESTS
        /// -------------------------------
        Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Text(
            "Manifests (4)",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: size.height * 0.238,
          child: Scrollbar(
            thumbVisibility: true,
            trackVisibility: true,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              children: [
                ...List.generate(
                  4,
                  (x) => Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                    child: NIMSSelectedManifestCard(),
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 40),

        /// -------------------------------
        /// APPROVALS
        /// -------------------------------
        Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Text(
            "Approvals (2)",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: size.height * 0.30,
          child: Scrollbar(
            thumbVisibility: true,
            trackVisibility: true,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              children: [
                ...List.generate(
                  2,
                  (x) => Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 24),
                    child: Column(
                      children: [
                        Image.asset(
                          "lib/core/ui/icons/signature_placeholder.png",
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Signee Full Name",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                            SizedBox(width: 24),
                            Expanded(
                              child: Text(
                                "Hassan Abdulwahab",
                                textAlign: TextAlign.end,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Signee Designation",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                            SizedBox(width: 24),
                            Expanded(
                              child: Text(
                                "Officer",
                                textAlign: TextAlign.end,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Signee Phone Number",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                            SizedBox(width: 24),
                            Expanded(
                              child: Text(
                                "08167290882",
                                textAlign: TextAlign.end,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // SizedBox(height: size.height * 0.315),
        //
        // NIMSPrimaryButton(
        //   text: "Deliver",
        //   onPressed: () {
        //     context.pushNamed(specimenDeliveryApprovalScreen);
        //   },
        // ),
        const SizedBox(height: 16),
      ],
    );
  }
}
