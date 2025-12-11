import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projects/core/ui/theme/colors.dart';

import '../../domain/route_type.dart';

class SelectMovementTypeBottomSheetDialog extends StatelessWidget {
  final double height;
  final Function(RouteType) onSelectMovementType;

  const SelectMovementTypeBottomSheetDialog({
    super.key,
    required this.height,
    required this.onSelectMovementType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: height,
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
            ...RouteType.values
                .where((type) => type.category == RouteTypeCategory.specimen)
                .map(
                  (routeType) => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          context.pop();
                          onSelectMovementType(routeType);
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
                            routeType.label,
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
            ...RouteType.values
                .where((type) => type.category == RouteTypeCategory.result)
                .map(
                  (routeType) => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          context.pop();
                          onSelectMovementType(routeType);
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
                            routeType.label,
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
