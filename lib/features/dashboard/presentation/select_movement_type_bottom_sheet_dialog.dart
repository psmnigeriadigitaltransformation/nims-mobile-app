import 'package:flutter/material.dart';
import 'package:projects/core/ui/theme/colors.dart';

import '../domain/route_type.dart';

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
            ...RouteType.values.map(
              (routeType) => Column(
                children: [
                  InkWell(
                    splashColor: Theme.of(context).splashColor,
                    highlightColor: Theme.of(context).highlightColor,
                    onTap: () {
                      onSelectMovementType(routeType);
                    },
                    child: Container(
                      margin: EdgeInsetsGeometry.only(top: 0.5, bottom: 0.5),
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
                        // borderRadius: BorderRadiusGeometry.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))
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
