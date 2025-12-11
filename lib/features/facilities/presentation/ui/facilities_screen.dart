import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projects/core/ui/widgets/sticky_header_delegate.dart';
import '../../../../core/services/remote/models/facilities_response.dart';
import '../../../../core/ui/screens/nims_base_screen.dart';
import '../../../../core/ui/widgets/nims_alert_dialog.dart';
import '../../../../core/ui/widgets/nims_facility_card.dart';
import '../../../../core/ui/widgets/nims_round_icon_button.dart';
import '../providers.dart';

class FacilitiesScreen extends ConsumerWidget {
  const FacilitiesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(facilitiesScreenStateNotifierProvider);
    final size = MediaQuery.of(context).size;

    return NIMSBaseScreen(
      header: Padding(
        padding: EdgeInsetsGeometry.only(left: 16, right: 16, top: 16),
        child: Column(
          children: [
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
                  "Facilities",
                  style: TextTheme.of(context).titleSmall,
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                SizedBox(width: 40),
              ],
            ),

            SizedBox(height: 8),

            Text(
              "These are the facilities available to you",
              style: TextTheme.of(context).bodySmall,
            ),

            SizedBox(height: 16),
          ],
        ),
      ),
      body: asyncState.when(
        loading: () => const Center(
          heightFactor: 4,
          child: SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
        error: (err, stack) => NIMSAlertDialog(
          message: err.toString(),
          onTapActionButton: () {
            ref
                .read(facilitiesScreenStateNotifierProvider.notifier)
                .refreshFacilities();
          },
          actionButtonLabel: 'Retry',
        ),
        data: (state) {
          /// ----------------------------------------
          /// FACILITIES
          /// ----------------------------------------
          return SizedBox(
            height: size.height * 0.82,
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
              child: CustomScrollView(
                shrinkWrap: true,
                controller: ScrollController(),
                slivers: [
                  if (state.hubFacilities.isNotEmpty)
                    _buildHeader(
                      "Hub (${state.hubFacilities.length})",
                      context,
                    ),
                  _buildList(state.hubFacilities),

                  if (state.pcrFacilities.isNotEmpty)
                    _buildHeader(
                      "PCR (${state.pcrFacilities.length})",
                      context,
                    ),
                  _buildList(state.pcrFacilities),

                  if (state.geneXpertFacilities.isNotEmpty)
                    _buildHeader(
                      "GeneXpert (${state.geneXpertFacilities.length})",
                      context,
                    ),
                  _buildList(state.geneXpertFacilities),

                  if (state.spokeFacilities.isNotEmpty)
                    _buildHeader(
                      "Spoke (${state.spokeFacilities.length})",
                      context,
                    ),
                  _buildList(state.spokeFacilities),
                ],
              ),
            ),
          );
        },
      ),
      bottom: null,
    );
  }
}

SliverPersistentHeader _buildHeader(String title, BuildContext context) {
  return SliverPersistentHeader(
    pinned: true,
    delegate: StickyHeaderDelegate(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 24),
        alignment: Alignment.centerLeft,
        child: Text(title, style: Theme.of(context).textTheme.titleSmall),
      ),
    ),
  );
}

SliverList _buildList(List<FacilityItem> items) {
  return SliverList(
    delegate: SliverChildBuilderDelegate((context, index) {
      return NIMSFacilityCard(facility: items[index]);
    }, childCount: items.length),
  );
}
