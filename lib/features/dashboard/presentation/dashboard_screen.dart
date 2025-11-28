import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projects/app/router.dart';
import 'package:projects/core/ui/screens/nims_screen.dart';
import 'package:projects/core/ui/theme/colors.dart';
import 'package:projects/core/ui/theme/text_styles.dart';
import 'package:projects/core/ui/widgets/nims_primary_button.dart';
import 'package:projects/core/ui/widgets/nims_quick_action_card.dart';
import 'package:projects/features/dashboard/domain/quick_action.dart';
import 'package:projects/features/dashboard/domain/route_type.dart';
import 'package:projects/features/dashboard/presentation/select_movement_type_bottom_sheet_dialog.dart';

import '../../../app/route_name+path+params.dart';
import '../../../core/ui/widgets/nims_transit_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return NIMSScreen(
      children: [
        const SizedBox(height: 24),
        Row(
          children: [
            /// -------------------------------
            /// INITIALS AVATAR
            /// -------------------------------
            Container(
              padding: EdgeInsetsGeometry.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary.withAlpha(55),
                border: Border.fromBorderSide(
                  BorderSide(
                    width: 0.5,
                    color: Theme.of(context).colorScheme.outline,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                ),
              ),
              child: Text("MD"),
            ),

            SizedBox(width: 4),

            /// -------------------------------
            /// LOCATION ICON + TEXT
            /// -------------------------------
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.only(bottom: 4),
                    child: Icon(
                      Icons.location_on_rounded,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Container(
                    padding: EdgeInsetsGeometry.directional(start: 4),
                    child: Text(
                      "Near Riders for Health HQ, Abuja ",
                      style: Theme.of(context).textTheme.labelMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        /// -------------------------------
        /// SEARCH BAR
        /// -------------------------------
        Container(
          padding: EdgeInsetsGeometry.symmetric(vertical: 16),
          child: SearchBar(
            hintText: "Search for manifest, shipment or facility",
          ),
        ),

        const SizedBox(height: 16),

        /// -------------------------------
        /// QUICK ACTIONS
        /// -------------------------------
        Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Text(
            "Quick Actions",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          spacing: 8,
          children: [
            ...QuickAction.values.map(
              (action) => Expanded(
                child: NIMSQuickActionCard(
                  color: action.color,
                  asset: action.asset,
                  text: action.label,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 32),

        /// -------------------------------
        /// TRANSIT LIST
        /// -------------------------------
        Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Text(
            "Transit List",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: size.height * 0.50,
          child: ListView(
            children: [
              ...List.generate(
                4,
                (x) => Padding(
                  padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                  child: NIMSTransitCard(
                    status: "Dispatched",
                    statusColor: NIMSColors.green05,
                    statusBackgroundColor: NIMSColors.green02.withAlpha(50),
                    sourceCode: "PHC",
                    sourceName: "Primary Health Care, Kuje",
                    destinationCode: "NRL",
                    destinationName: "National Reference Lab",
                  ),
                ),
              ),
            ],
          ),
        ),

        /// -------------------------------
        /// NEW PICK UP BUTTON
        /// -------------------------------
        NIMSPrimaryButton(
          text: "New Pick Up",
          onPressed: () {
            /// ----------------------------------------
            /// SELECT MOVEMENT TYPE BOTTOM SHEET DIALOG
            /// ----------------------------------------
            showModalBottomSheet(
              showDragHandle: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              backgroundColor: Theme.of(context).colorScheme.surface,
              context: context,
              builder: (builder) => SelectMovementTypeBottomSheetDialog(
                height: size.height * 0.31,
                onSelectMovementType: (routeType) => {
                  context.pushNamed(
                    pickUpScreen,
                    queryParameters: {routeTypeQueryParam: routeType.name},
                  ),
                },
              ),
            );
          },
          loading: false,
        )
      ],
    );
  }
}
