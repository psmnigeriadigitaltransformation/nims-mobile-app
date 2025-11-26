import 'package:flutter/material.dart';

import '../domain/route_type.dart';

class SelectMovementTypeBottomSheetDialog extends StatelessWidget {
  final double height;

  const SelectMovementTypeBottomSheetDialog({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
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
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    onTap: () {},
                    child: Container(
                      alignment: AlignmentGeometry.center,
                      padding: EdgeInsets.all(16),
                      child: Text(
                        routeType.label,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  Divider(
                    height: 0.5,
                    thickness: 0.5,
                    indent: 8,
                    endIndent: 8,
                    color: Theme.of(context).dividerColor,
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
