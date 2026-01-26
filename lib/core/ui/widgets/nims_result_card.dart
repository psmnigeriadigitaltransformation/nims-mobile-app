import 'package:flutter/material.dart';
import 'package:nims_mobile_app/core/domain/models/result.dart';

class NIMSResultCard extends StatelessWidget {
  final LabResult? result;
  final VoidCallback? onTapAction;
  final String? actionLabel;
  final bool isSelected;
  final ValueChanged? onTapCheckBox;
  final bool isLoading;

  const NIMSResultCard({
    super.key,
    this.result,
    this.onTapAction,
    this.actionLabel,
    this.isSelected = false,
    this.onTapCheckBox,
    this.isLoading = false,
  });

  /// Convert gender to short form (M/F)
  String _shortGender(String gender) {
    final lower = gender.toLowerCase().trim();
    if (lower == 'male' || lower == 'm') return 'M';
    if (lower == 'female' || lower == 'f') return 'F';
    return gender.isNotEmpty ? gender[0].toUpperCase() : '';
  }

  /// Convert age to short form (e.g., "25 Years" -> "25 Y", "6 Months" -> "6 M")
  String _shortAge(String age) {
    if (age.isEmpty) return '';
    // Extract numeric part
    final numericAge = age.replaceAll(RegExp(r'[^0-9]'), '');
    if (numericAge.isEmpty) return age;
    // Extract unit and get first letter
    final unit = age.replaceAll(RegExp(r'[0-9\s]'), '').trim();
    if (unit.isEmpty) return numericAge;
    return '$numericAge ${unit[0].toUpperCase()}';
  }

  @override
  Widget build(BuildContext context) {
    // Get values from result or fallback to legacy fields
    final displayPatientCode = result?.patientCode ?? "unkonwn";
    final rawAge = result?.age ?? "";
    final rawGender = result?.gender ?? "";
    final displayAge = _shortAge(rawAge);
    final displayGender = _shortGender(rawGender);
    final isRejected = result?.isRejected == 1;
    final rejectionSyncStatus = result?.rejectionSyncStatus;
    final isPendingRejection = isRejected && rejectionSyncStatus != 'synced';

    // Determine action button appearance
    final showAcceptButton = isPendingRejection;
    final buttonLabel = showAcceptButton ? "Accept" : actionLabel;
    final buttonColor = showAcceptButton
        ? Theme.of(context).colorScheme.primaryContainer
        : Theme.of(context).colorScheme.errorContainer.withAlpha(150);
    final buttonTextColor = showAcceptButton
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.error;

    return Opacity(
      opacity: isRejected ? 0.6 : 1.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: isRejected
                ? Theme.of(context).colorScheme.error.withAlpha(100)
                : Theme.of(context).colorScheme.outline,
            width: isRejected ? 1.0 : 0.5,
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                // Checkbox
                if (onTapCheckBox != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(
                        value: isSelected,
                        onChanged: isRejected ? null : onTapCheckBox,
                      ),
                    ),
                  ),
                // Sample code - sized to fit content
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                  child: Text(
                    displayPatientCode,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                // Spacer to push remaining items to the right
                const Spacer(flex: 1),
                // Age - fixed width for alignment
                Row(
                  children: [
                    SizedBox(
                      child: Text(
                        displayAge,
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // Gender - fixed width for alignment
                    const SizedBox(width: 16),
                    SizedBox(
                      child: Text(
                        displayGender,
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // Pending rejection badge
                    if (isPendingRejection) ...[
                      const SizedBox(width: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4),
                          ),
                          color: Theme.of(context).colorScheme.errorContainer,
                        ),
                        child: Icon(
                          Icons.hourglass_empty,
                          size: 12,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ],
                    // Action button
                    const SizedBox(width: 16),
                    if (isLoading)
                      const SizedBox(
                        width: 50,
                        child: Center(
                          child: SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                      )
                    else if (onTapAction != null && actionLabel != null)
                      InkWell(
                        onTap: onTapAction,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                        child: Container(
                          constraints: const BoxConstraints(minWidth: 50),
                          decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 10,
                          ),
                          child: Text(
                            buttonLabel ?? '',
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(color: buttonTextColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
