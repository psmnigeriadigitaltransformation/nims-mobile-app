import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_manifest_card.dart';
import 'package:nims_mobile_app/core/ui/widgets/sticky_header_delegate.dart';
import '../../../../app/route_name+path+params.dart';
import '../../../../core/ui/screens/nims_base_screen.dart';
import '../../../../core/ui/widgets/nims_error_content.dart';
import '../../../../core/ui/widgets/nims_facility_card.dart';
import '../../../../core/ui/widgets/nims_round_icon_button.dart';
import '../providers.dart';

class ManifestsScreen extends ConsumerWidget {
  final TextEditingController searchBarController = TextEditingController();

  ManifestsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(manifestsScreenStateNotifierProvider);
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
                  onPressed: () => context.pop(),
                ),
                Spacer(),
                Text(
                  "Manifests",
                  style: TextTheme.of(context).titleSmall,
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                SizedBox(width: 40),
              ],
            ),

            SizedBox(height: 8),

            Text(
              "These are the manifests you have created",
              style: TextTheme.of(context).bodySmall,
            ),

            SizedBox(height: 16),

            /// -------------------------------
            /// SEARCH BAR
            /// -------------------------------
            Container(
              padding: EdgeInsetsGeometry.symmetric(vertical: 16),
              child: SearchBar(
                hintText: "Search for manifest",
                controller: searchBarController,
                onChanged: (value) => {
                  searchBarController.text = value,
                  ref
                      .read(manifestsScreenStateNotifierProvider.notifier)
                      .filterManifests(value),
                },
              ),
            ),
          ],
        ),
      ),
      body: asyncState.when(
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
        error: (err, stack) => NIMSErrorContent(
          message: err.toString(),
          onTapActionButton: () {
            ref
                .read(manifestsScreenStateNotifierProvider.notifier)
                .refreshManifests();
          },
          actionButtonLabel: 'Retry',
        ),
        data: (state) {
          /// ----------------------------------------
          /// FACILITIES
          /// ----------------------------------------
          return SizedBox(
            // height: size.height * 0.82,
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
              child: CustomScrollView(
                shrinkWrap: true,
                controller: ScrollController(),
                slivers: [
                  if (state.manifests.isNotEmpty) _buildList(state.manifests),
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

SliverList _buildList(List<DomainManifest> items) {
  return SliverList(
    delegate: SliverChildBuilderDelegate((context, index) {
      return Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 4),
        child: NIMSManifestCard(
          manifest: items[index],
          onTapManifest: () {
            developer.log(
              items[index].toJson().toString(),
              name: "ManifestsScreen:onTapManifest",
            );
            context.pushNamed(
              manifestDetailsScreen,
              queryParameters: {
                manifestsQueryParam: jsonEncode(items[index].toJson()),
              },
            );
          },
          isSelected: false,
          onTapDelete: () {},
        ),
      );
    }, childCount: items.length),
  );
}
