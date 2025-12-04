import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projects/app/route_name+path+params.dart';
import 'package:projects/core/ui/screens/nims_screen.dart';
import 'package:projects/core/ui/widgets/nims_round_icon_button.dart';
import 'package:projects/features/dashboard/domain/route_type.dart';
import '../../../../core/ui/widgets/nims_manifest_card.dart';
import '../../../../core/ui/widgets/nims_primary_button.dart';
import '../../../../core/ui/widgets/nims_shipment_card.dart';
import '../../../dashboard/domain/mock.dart';

class ShipmentsScreen extends StatelessWidget {
  final RouteType routeType;

  const ShipmentsScreen({super.key, required this.routeType});

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

        /// ----------------------------------------
        /// ORIGINATING FACILITY DROPDOWN MENU
        /// ----------------------------------------
        Row(
          children: [
            Image.asset(
              "lib/core/ui/icons/ic_origin_location.png",
              width: 16,
              height: 16,
            ),
            SizedBox(width: 16),
            Text(
              "Gwagwalada General Hospital",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            // Flexible(
            //   child: DropdownMenu<String>(
            //     trailingIcon: Icon(Icons.keyboard_arrow_down_rounded),
            //     selectedTrailingIcon: Icon(Icons.keyboard_arrow_up_rounded),
            //     width: size.width - 80,
            //     label: Text("PickUp Facility"),
            //     dropdownMenuEntries: [
            //       ...Mock.facilities.map(
            //         (facility) => DropdownMenuEntry(
            //           value: facility,
            //           labelWidget: Center(
            //             child: Text(
            //               facility,
            //               style: Theme.of(context).textTheme.bodySmall,
            //             ),
            //           ),
            //           label: facility,
            //         ),
            //       ),
            //     ],
            //     onSelected: (value) {},
            //   ),
            // ),
          ],
        ),

        SizedBox(height: 40),

        /// -------------------------------
        /// MANIFESTS
        /// -------------------------------
        Row(
          children: [
            Text(
              "Shipments (3)",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Spacer(),
          ],
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: size.height * 0.600,
          child: Scrollbar(
            thumbVisibility: true,
            trackVisibility: true,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              children: [
                ...List.generate(
                  8,
                  (x) => Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 8),
                    child: NIMSShipmentCard(
                      destinationName: "National Reference Lab",
                      manifestID: 'NG-83992882-JJSKKS',
                      onTap: () {
                        context.pushNamed(
                          manifestDetailsScreen,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),

        /// ----------------------------------------
        /// DISPATCH SPECIMENS BUTTON
        /// ----------------------------------------
        NIMSPrimaryButton(
          text: "Go To Approval",
          onPressed: () {
            context.pushNamed(specimenDispatchApprovalScreen);
          },
        ),

        const SizedBox(height: 16),
      ],
    );
  }
}
