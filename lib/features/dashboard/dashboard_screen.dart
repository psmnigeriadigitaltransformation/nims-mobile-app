import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/core/ui/theme/colors.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_facility_card.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_manifest_card.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_primary_button.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_quick_action_card.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_specimen_shipment_summary_card.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_route_card.dart';
import 'package:nims_mobile_app/features/dashboard/dashboard_screen_state.dart';
import 'package:nims_mobile_app/features/dashboard/select_movement_type_bottom_sheet_dialog.dart';
import 'package:nims_mobile_app/features/dashboard/providers.dart';

import '../../app/providers.dart';
import '../../app/route_name+path+params.dart';
import '../../core/domain/models/movement_category.dart';
import '../../core/ui/screens/nims_base_screen.dart';
import '../../core/ui/widgets/nims_error_content.dart';
import 'models/quick_action.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen>
    with RouteAware {
  final TextEditingController searchController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Subscribe to route changes
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    searchController.dispose();
    super.dispose();
  }

  @override
  void didPopNext() {
    // Called when returning to this screen from another screen
    // Refresh the dashboard data including routes
    // Use addPostFrameCallback to avoid modifying provider during widget tree building
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dashboardScreenStateNotifierProvider.notifier).refreshState();
    });
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<DashboardScreenState?> stateAsyncValue = ref.watch(
      dashboardScreenStateNotifierProvider,
    );

    // Listen for sync errors and show alert dialog
    ref.listen(
      dashboardScreenStateNotifierProvider.select((s) => s.value?.syncAlert),
      (prev, next) {
        final prevShow = prev?.show ?? false;
        final nextShow = next?.show ?? false;
        if (!prevShow && nextShow && next != null) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (buildContext) => _SyncErrorDialog(
              message: next.message,
              onRetry: () {
                context.pop();
                ref
                    .read(dashboardScreenStateNotifierProvider.notifier)
                    .dismissSyncAlert();
                ref
                    .read(dashboardScreenStateNotifierProvider.notifier)
                    .syncPendingRecords();
              },
              onDismiss: () {
                context.pop();
                ref
                    .read(dashboardScreenStateNotifierProvider.notifier)
                    .dismissSyncAlert();
              },
            ),
          );
        }
      },
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
                    onTap: () {},
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
                  Expanded(
                    child: Container(
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
                  ),

                  /// -------------------------------
                  /// SYNC BUTTON
                  /// -------------------------------
                  _buildSyncButton(context, ref, state),
                ],
              ),

              /// -------------------------------
              /// SEARCH BAR
              /// -------------------------------
              Container(
                padding: EdgeInsetsGeometry.symmetric(vertical: 16),
                child: SearchBar(
                  hintText: "Search for facilities, manifests and shipments",
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
                              case QuickAction.routes:
                                context.pushNamed(routesScreen);
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
                    "Routes",
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
                      selectManifestsScreen,
                      queryParameters: {
                        movementTypeQueryParam: jsonEncode(
                          movementType.toJson(),
                        ),
                      },
                    ),

                    MovementTypeCategory.result => context.pushNamed(
                      selectResultsScreen,
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
          child: NIMSRouteCard(route: route),
        );
      },
    );
  }

  Widget _buildSearchResults(BuildContext context, DashboardScreenState state) {
    final hasNoResults =
        state.searchedFacilities.isEmpty &&
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
              (context, index) =>
                  NIMSFacilityCard(facility: state.searchedFacilities[index]),
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
          Text(title, style: Theme.of(context).textTheme.titleSmall),
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

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  Widget _buildSyncButton(
    BuildContext context,
    WidgetRef ref,
    DashboardScreenState? state,
  ) {
    final isSyncing = state?.isSyncing ?? false;
    final pendingCount = state?.pendingSyncCount ?? 0;
    final lastSyncTime = state?.lastSyncTime;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: isSyncing
          ? null
          : () {
              ref
                  .read(dashboardScreenStateNotifierProvider.notifier)
                  .syncPendingRecords();
            },
      child: Container(
        // width: 100,
        padding: EdgeInsetsGeometry.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: pendingCount > 0
              ? NIMSColors.orange02.withAlpha(50)
              : NIMSColors.green02.withAlpha(50),
          border: Border.all(
            color: pendingCount > 0 ? NIMSColors.orange05 : NIMSColors.green05,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSyncing)
              SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: NIMSColors.orange05,
                ),
              )
            else
              Icon(
                pendingCount > 0
                    ? Icons.cloud_upload_outlined
                    : Icons.cloud_done_outlined,
                size: 18,
                color: pendingCount > 0
                    ? NIMSColors.orange05
                    : NIMSColors.green05,
              ),
            // const SizedBox(width: 6),
            // Expanded(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Text(
            //         isSyncing
            //             ? "Syncing..."
            //             : pendingCount > 0
            //                 ? "$pendingCount pending"
            //                 : "Synced",
            //         style: Theme.of(context).textTheme.labelSmall?.copyWith(
            //           fontWeight: FontWeight.w600,
            //           color: pendingCount > 0 ? NIMSColors.orange05 : NIMSColors.green05,
            //         ),
            //         overflow: TextOverflow.ellipsis,
            //       ),
            //       if (lastSyncTime != null && !isSyncing && pendingCount == 0)
            //         Text(
            //           _formatTime(lastSyncTime),
            //           style: Theme.of(context).textTheme.labelSmall?.copyWith(
            //             fontSize: 9,
            //             color: NIMSColors.green05.withAlpha(180),
            //           ),
            //         ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

/// Dialog shown when sync fails with retry option
class _SyncErrorDialog extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  final VoidCallback onDismiss;

  const _SyncErrorDialog({
    required this.message,
    required this.onRetry,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsetsGeometry.all(24),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.surface,
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Error Icon
              Container(
                padding: EdgeInsetsGeometry.all(12),
                decoration: BoxDecoration(
                  color: NIMSColors.red02.withAlpha(50),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.sync_problem_rounded,
                  size: 32,
                  color: NIMSColors.red05,
                ),
              ),

              SizedBox(height: 16),

              /// Title
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
                child: Text(
                  "Sync Failed",
                  style: TextTheme.of(context).titleSmall,
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 8),

              /// Error Message
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                child: Text(
                  message,
                  maxLines: 5,
                  style: TextTheme.of(context).bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              SizedBox(height: 24),

              /// Retry Button
              SizedBox(
                width: double.infinity,
                child: NIMSPrimaryButton(text: "Retry", onPressed: onRetry),
              ),

              SizedBox(height: 8),

              /// Close Button
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: onDismiss,
                  child: Text(
                    "Close",
                    style: TextTheme.of(context).bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
