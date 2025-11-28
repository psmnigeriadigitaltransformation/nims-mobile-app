import 'package:flutter/material.dart';
import 'package:projects/core/ui/screens/nims_screen.dart';
import 'package:projects/core/ui/theme/colors.dart';
import 'package:projects/core/ui/widgets/nims_primary_button.dart';
import 'package:projects/core/ui/widgets/nims_round_icon_button.dart';
import 'package:projects/features/dashboard/domain/route_type.dart';
import '../../../core/ui/widgets/nims_manifest_card.dart';
import '../../../core/ui/widgets/nims_transit_card.dart';
import '../../dashboard/domain/mock.dart';

class PickUpScreen extends StatelessWidget {
  final RouteType routeType;

  const PickUpScreen({super.key, required this.routeType});

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
            Flexible(
              child: Text("Pick Up", style: TextTheme.of(context).titleSmall),
            ),
            Spacer(),
          ],
        ),

        SizedBox(height: 8),

        Text(routeType.label, style: TextTheme.of(context).labelMedium),

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
            Flexible(
              child: DropdownMenu<String>(
                trailingIcon: Icon(Icons.keyboard_arrow_down_rounded),
                selectedTrailingIcon: Icon(Icons.keyboard_arrow_up_rounded),
                width: size.width - 80,
                label: Text("Originating Facility"),
                dropdownMenuEntries: [
                  ...Mock.facilities.map(
                    (facility) => DropdownMenuEntry(
                      value: facility,
                      labelWidget: Center(
                        child: Text(
                          facility,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      label: facility,
                    ),
                  ),
                ],
                onSelected: (value) {},
              ),
            ),
          ],
        ),

        SizedBox(height: 40),

        /// -------------------------------
        /// MANIFESTS
        /// -------------------------------
        Row(
          children: [
            Text("Manifests", style: Theme.of(context).textTheme.titleSmall),
            Spacer(),
            Container(
              padding: EdgeInsetsGeometry.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Theme.of(context).colorScheme.primary,
              ),

              child: InkWell(
                splashColor: Theme.of(context).splashColor,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Center(
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
                    child: Text(
                      "Add Manifest",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
                onTap: () {},
              ),
            ),
          ],
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
                  child: NIMSManifestCard(
                    sourceName: "Primary Health Care, Kuje",
                    destinationName: "National Reference Lab",
                    manifestID: 'NG-83992882-JJSKKS',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
