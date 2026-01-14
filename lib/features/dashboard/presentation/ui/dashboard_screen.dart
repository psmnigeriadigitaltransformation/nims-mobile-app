import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/app/router.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/ui/screens/nims_screen.dart';
import 'package:nims_mobile_app/core/ui/theme/colors.dart';
import 'package:nims_mobile_app/core/ui/theme/text_styles.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_primary_button.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_quick_action_card.dart';
import 'package:nims_mobile_app/features/dashboard/domain/quick_action.dart';
import 'package:nims_mobile_app/features/dashboard/domain/route_type.dart';
import 'package:nims_mobile_app/features/dashboard/presentation/ui/model/dashboard_screen_state.dart';
import 'package:nims_mobile_app/features/dashboard/presentation/ui/select_movement_type_bottom_sheet_dialog.dart';
import 'package:nims_mobile_app/features/dashboard/providers.dart';

import '../../../../app/route_name+path+params.dart';
import '../../../../core/domain/models/movement_category.dart';
import '../../../../core/services/remote/models/login_response.dart';
import '../../../../core/ui/screens/nims_base_screen.dart';
import '../../../../core/ui/widgets/nims_error_content.dart';
import '../../../../core/ui/widgets/nims_transit_card.dart';
import '../../../profile/providers.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<DashboardScreenState?> stateAsyncValue = ref.watch(
      dashboardScreenStateNotifierProvider,
    );

    return stateAsyncValue.when(
      data: (state) => NIMSBaseScreen(
        header: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  /// -------------------------------
                  /// INITIALS AVATAR
                  /// -------------------------------
                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      context.pushNamed(profileScreen);
                    },
                    child: Container(
                      padding: EdgeInsetsGeometry.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withAlpha(55),
                        border: Border.fromBorderSide(
                          BorderSide(
                            width: 0.5,
                            color: Theme.of(context).colorScheme.outline,
                            strokeAlign: BorderSide.strokeAlignOutside,
                          ),
                        ),
                      ),
                      child: Text(
                        "${state?.userFullName.split(" ")[0].characters.first}${state?.userFullName.split(" ")[1].characters.first}",
                      ),
                    ),
                  ),

                  SizedBox(width: 4),

                  /// -------------------------------
                  /// USER INFO
                  /// -------------------------------
                  Container(
                    padding: EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4,
                      children: [
                        Text(
                          state?.userFullName ?? "",
                          style: Theme.of(context).textTheme.titleSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "${state?.userRole} | ${state?.userId}",
                          style: Theme.of(context).textTheme.labelLarge,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
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
                  hintText: "Search for specimen, shipment or facility",
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
                        onTap: () {
                          switch (action) {
                            case QuickAction.facilities:
                              context.pushNamed(facilitiesScreen);
                            case QuickAction.manifests:
                              context.pushNamed(manifestsScreen);
                            case QuickAction.shipments:
                              context.pushNamed(shipmentsScreen);
                            case QuickAction.approvals:
                              break;
                          }
                        },
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

              // const SizedBox(height: 8),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: ListView.builder(
            controller: ScrollController(),
            shrinkWrap: true,
            itemCount: state?.shipmentRoutes.length,
            itemBuilder: (buildContext, index) {
              final route = state?.shipmentRoutes[index];
              if (route == null) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: NIMSTransitCard(
                  status: "Dispatched",
                  statusColor: NIMSColors.green05,
                  statusBackgroundColor: NIMSColors.green02.withAlpha(50),
                  sourceCode: _initialsFrom(route.originFacilityName ?? ""),
                  sourceName: route.originFacilityName ?? "",
                  destinationCode: _initialsFrom(
                    route.destinationFacilityName ?? "",
                  ),
                  destinationName: route.destinationFacilityName ?? "",
                  shipmentRoute: route,
                ),
              );
            },
          ),
        ),

        /// -------------------------------
        /// NEW PICK UP BUTTON
        /// -------------------------------
        bottom: NIMSPrimaryButton(
          text: "New Pick-up",
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
                specimensMovementTypes:
                    stateAsyncValue.value?.specimensMovementTypes ?? [],
                resultsMovementTypes:
                    stateAsyncValue.value?.resultsMovementTypes ?? [],
                onSelectMovementType: (movementType, movementTypeCategory) => {
                  switch (movementTypeCategory) {
                    MovementTypeCategory.specimen => context.pushNamed(
                      specimenPickUpScreen,
                      queryParameters: {
                        movementTypeQueryParam: jsonEncode(
                          movementType.toJson(),
                        ),
                      },
                    ),

                    MovementTypeCategory.result => context.pushNamed(
                      resultPickUpScreen,
                      queryParameters: {
                        movementTypeQueryParam: jsonEncode(
                          movementType.toJson(),
                        ),
                      },
                    ),
                  },
                },
              ),
            );
          },
          loading: false,
        ),
      ),
      error: (e, s) => NIMSErrorContent(
        message: e.toString(),
        onTapActionButton: () {
          ref
              .read(dashboardScreenStateNotifierProvider.notifier)
              .refreshState();
        },
        actionButtonLabel: 'Retry',
      ),
      loading: () => Container(
        color: Theme.of(context).colorScheme.surface,
        child: Center(
          child: const SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      ),
    );
  }
}

String _initialsFrom(String text) {
  return text
      .trim()
      .split(RegExp(r'\s+'))
      .where((word) => word.isNotEmpty)
      .map((word) => word[0].toUpperCase())
      .join();
}
