import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/core/domain/models/manifest.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_round_icon_button.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_origin_dest_facilities_link_view.dart';

import '../../../../../../core/ui/theme/colors.dart';
import '../../../../../../core/ui/widgets/nims_specimen_card.dart';
import '../../../../../../core/ui/widgets/nims_status_chip.dart';
import '../../../../providers.dart';

class ManifestDetailsScreen extends ConsumerWidget {
  final Manifest manifest;

  const ManifestDetailsScreen({super.key, required this.manifest});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(
      manifestDetailsScreenStateNotifierProvider(manifest),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            /// Fixed Header Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  _buildHeader(context),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                    ),
                    child: Text(
                      manifest.manifestNo,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),

            /// Scrollable Content
            Expanded(
              child: asyncState.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, _) => Center(
                  child: Text(
                    "Error loading details",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                data: (state) => SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),

                      /// Origin to Destination + Status
                      Row(
                        children: [
                          Expanded(
                            child: NIMSOriginDestinationLinkView(
                              origin: state.manifest.originatingFacilityName,
                              destination: state.manifest.destinationFacilityName,
                            ),
                          ),
                          const SizedBox(width: 12),
                          _buildStatusChip(),
                        ],
                      ),

                      const SizedBox(height: 24),

                      /// Sample Type Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            state.manifest.sampleType,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(width: 4),
                          Image.asset(
                            "lib/core/ui/icons/ic_test_tube.png",
                            height: 16,
                            width: 16,
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      /// Info Card
                      _buildInfoCard(context, state),

                      const SizedBox(height: 32),

                      /// Specimens Section
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Specimens (${state.samples.length})",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),

                      const SizedBox(height: 16),

                      if (state.samples.isEmpty)
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.outline.withAlpha(100),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "No specimens found",
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        )
                      else
                        ...state.samples.map(
                          (sample) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: NIMSSpecimenCard(sample: sample),
                          ),
                        ),

                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        NIMSRoundIconButton(
          icon: Icons.arrow_back_ios_rounded,
          onPressed: () => context.pop(),
        ),
        const Spacer(),
        Text(
          "Manifest Details",
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        const SizedBox(width: 40),
      ],
    );
  }

  Widget _buildStatusChip() {
    return NIMSStatusChip(
      status: "Pending",
      statusColor: NIMSColors.orange05,
      statusBackgroundColor: NIMSColors.orange02.withAlpha(50),
    );
  }

  Widget _buildInfoCard(BuildContext context, dynamic state) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withAlpha(100),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withAlpha(50),
        ),
      ),
      child: Column(
        children: [
          _buildInfoRow(context, "Manifest No", state.manifest.manifestNo),
          const Divider(height: 20),
          _buildInfoRow(context, "Phlebotomy No", state.manifest.phlebotomyNo),
          const Divider(height: 20),
          _buildInfoRow(context, "Sample Type", state.manifest.sampleType),
          const Divider(height: 20),
          _buildInfoRow(context, "Sample Count", "${state.manifest.sampleCount}"),
          if (state.manifest.temperature != null && state.manifest.temperature!.isNotEmpty) ...[
            const Divider(height: 20),
            _buildInfoRow(context, "Temperature", state.manifest.temperature!),
          ],
          const Divider(height: 20),
          _buildInfoRow(context, "Origin", state.manifest.originatingFacilityName),
          const Divider(height: 20),
          _buildInfoRow(context, "Destination", state.manifest.destinationFacilityName),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 2,
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
