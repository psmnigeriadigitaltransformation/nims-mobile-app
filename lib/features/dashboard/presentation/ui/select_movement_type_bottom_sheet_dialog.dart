import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/core/data/providers.dart';
import 'package:nims_mobile_app/core/domain/mappers/typedefs.dart';
import 'package:nims_mobile_app/core/domain/models/movement_category.dart';
import 'package:nims_mobile_app/core/domain/models/movement_type.dart';
import 'package:nims_mobile_app/core/ui/theme/colors.dart';

import '../../domain/route_type.dart';

class SelectMovementTypeBottomSheetDialog extends ConsumerWidget {
  final List<DomainMovementType> specimensMovementTypes;
  final List<DomainMovementType> resultsMovementTypes;
  final Function(DomainMovementType, MovementTypeCategory) onSelectMovementType;

  const SelectMovementTypeBottomSheetDialog({
    super.key,
    required this.specimensMovementTypes,
    required this.resultsMovementTypes,
    required this.onSelectMovementType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: size.height * 0.40,
      child: Center(
        child: ListView(
          children: [
            Center(
              child: Text(
                "Select Movement Type",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            SizedBox(height: 24),
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text(
                "Specimens",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            SizedBox(height: 8),
            ...specimensMovementTypes
                .map(
                  (movementType) => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          context.pop();
                          onSelectMovementType(movementType, MovementTypeCategory.specimen);
                        },
                        child: Container(
                          margin: EdgeInsetsGeometry.only(
                            top: 0.5,
                            bottom: 0.5,
                          ),
                          alignment: AlignmentGeometry.center,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: NIMSColors.transparent,
                            border: BoxBorder.fromLTRB(
                              bottom: BorderSide(
                                width: 0.5,
                                color: Theme.of(context).dividerColor,
                              ),
                            ),
                          ),
                          child: Text(
                            movementType.movement ?? "",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            SizedBox(height: 32),
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text(
                "Results",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            SizedBox(height: 8),
            ...resultsMovementTypes
                .map(
                  (movementType) => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          context.pop();
                          onSelectMovementType(movementType, MovementTypeCategory.result);
                        },
                        child: Container(
                          margin: EdgeInsetsGeometry.only(
                            top: 0.5,
                            bottom: 0.5,
                          ),
                          alignment: AlignmentGeometry.center,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: NIMSColors.transparent,
                            border: BoxBorder.fromLTRB(
                              bottom: BorderSide(
                                width: 0.5,
                                color: Theme.of(context).dividerColor,
                              ),
                            ),
                          ),
                          child: Text(
                            movementType.movement ?? "",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
