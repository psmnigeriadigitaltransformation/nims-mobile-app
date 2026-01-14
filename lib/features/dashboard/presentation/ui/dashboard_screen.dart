import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/ui/theme/colors.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_facility_card.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_manifest_card.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_primary_button.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_quick_action_card.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_specimen_shipment_summary_card.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_transit_card.dart';
import 'package:nims_mobile_app/features/dashboard/domain/quick_action.dart';
import 'package:nims_mobile_app/features/dashboard/presentation/ui/model/dashboard_screen_state.dart';
import 'package:nims_mobile_app/features/dashboard/presentation/ui/select_movement_type_bottom_sheet_dialog.dart';
import 'package:nims_mobile_app/features/dashboard/providers.dart';

import '../../../../app/route_name+path+params.dart';
import '../../../../core/domain/models/movement_category.dart';
import '../../../../core/ui/screens/nims_base_screen.dart';
import '../../../../core/ui/widgets/nims_error_content.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  controller: searchController,
                  onChanged: (value) {
                    ref
                        .read(dashboardScreenStateNotifierProvider.notifier)
                        .search(value);
                  },
                ),
              ),

              const SizedBox(height: 16),

              // Show Quick Actions and Transit List header only when not searching
              if (state?.isSearching != true) ...[
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
                /// TRANSIT LIST HEADER
                /// -------------------------------
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    "Transit List",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: state?.isSearching == true
              ? _buildSearchResults(context, state!)
              : _buildTransitList(context, state),
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

  Widget _buildTransitList(BuildContext context, DashboardScreenState? state) {
    return ListView.builder(
      controller: ScrollController(),
      shrinkWrap: true,
      itemCount: state?.shipmentRoutes.length ?? 0,
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
            destinationCode: _initialsFrom(route.destinationFacilityName ?? ""),
            destinationName: route.destinationFacilityName ?? "",
            shipmentRoute: route,
          ),
        );
      },
    );
  }

  Widget _buildSearchResults(BuildContext context, DashboardScreenState state) {
    final hasNoResults = state.searchedFacilities.isEmpty &&
        state.searchedManifests.isEmpty &&
        state.searchedShipments.isEmpty;

    if (hasNoResults) {
      return Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search_off_rounded,
                size: 64,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(height: 16),
              Text(
                "No results found",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                "Try searching with different keywords",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
            ],
          ),
        ),
      );
    }

    return CustomScrollView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        // Facilities Section
        if (state.searchedFacilities.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: _buildSectionHeader(
              context,
              "Facilities",
              state.searchedFacilities.length,
              Icons.location_city_rounded,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => NIMSFacilityCard(
                facility: state.searchedFacilities[index],
              ),
              childCount: state.searchedFacilities.length,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],

        // Manifests Section
        if (state.searchedManifests.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: _buildSectionHeader(
              context,
              "Manifests",
              state.searchedManifests.length,
              Icons.description_rounded,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: NIMSManifestCard(
                  manifest: state.searchedManifests[index],
                  isSelected: false,
                  onTapManifest: () {
                    // Navigate to manifest details if needed
                  },
                  onTapDelete: () {
                    // Handle delete if needed
                  },
                ),
              ),
              childCount: state.searchedManifests.length,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],

        // Shipments Section
        if (state.searchedShipments.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: _buildSectionHeader(
              context,
              "Shipments",
              state.searchedShipments.length,
              Icons.local_shipping_rounded,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 4),
                child: NIMSSpecimenShipmentSummaryCard(
                  shipment: state.searchedShipments[index],
                ),
              ),
              childCount: state.searchedShipments.length,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    int count,
    IconData icon,
  ) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            padding: EdgeInsetsGeometry.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(width: 8),
          Container(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              count.toString(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  String _initialsFrom(String text) {
    return text
        .trim()
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .map((word) => word[0].toUpperCase())
        .join();
  }
}
