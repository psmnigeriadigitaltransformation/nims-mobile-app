import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:projects/app/route_name+path+params.dart';
import 'package:projects/core/ui/screens/nims_screen.dart';
import 'package:projects/core/ui/widgets/nims_round_icon_button.dart';
import 'package:projects/features/dashboard/domain/route_type.dart';
import '../../../../../core/domain/mappers/typedefs.dart';
import '../../../../../core/domain/models/movement_type.dart';
import '../../../../../core/ui/widgets/nims_alert_dialog.dart';
import '../../../../../core/ui/widgets/nims_manifest_card.dart';
import '../../../../../core/ui/widgets/nims_primary_button.dart';
import '../../../../../core/ui/widgets/nims_shipment_card.dart';
import '../../../../dashboard/domain/mock.dart';
import '../../../providers.dart';

class ShipmentsScreen extends ConsumerWidget {
  final DomainMovementType movementType;

  const ShipmentsScreen({super.key, required this.movementType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final asyncValueState = ref.watch(
      shipmentsScreenStateNotifierProvider(movementType.movement ?? ""),
    );

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

        Text(
          movementType.movement ?? "",
          style: TextTheme.of(context).bodySmall,
        ),

        SizedBox(height: 50),

        /// ----------------------------------------
        /// ORIGINATING FACILITY
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
          ],
        ),

        SizedBox(height: 40),

        /// -------------------------------
        /// SHIPMENTS
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

        asyncValueState.when(
          data: (state) => Column(
            children: [
              SizedBox(
                height: size.height * 0.600,
                child: Scrollbar(
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
                            facilities: state.facilities,
                            locations: state.locations,
                            onTap: () {
                              context.pushNamed(manifestDetailsScreen);
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
          ),
          error: (e, s) => NIMSAlertDialog(
            message: e.toString(),
            onTapActionButton: () {
              ref
                  .read(
                    shipmentsScreenStateNotifierProvider(
                      movementType.movement ?? "",
                    ).notifier,
                  )
                  .refreshState();
            },
            actionButtonLabel: 'Retry',
          ),
          loading: () => const Padding(
            padding: EdgeInsets.all(40),
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
        ),
      ],
    );
  }
}
