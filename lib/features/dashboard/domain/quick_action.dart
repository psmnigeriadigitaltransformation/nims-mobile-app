import 'dart:ui';

import 'package:projects/core/ui/theme/colors.dart';

enum QuickAction {
  facilities("Facilities", "lib/core/ui/icons/laboratory.png", NIMSColors.pink01),
  manifests("Manifests", "lib/core/ui/icons/shopping_list.png", NIMSColors.violet01),
  shipments("Shipments", "lib/core/ui/icons/delivery_bike.png", NIMSColors.green01),
  approvals("Approvals", "lib/core/ui/icons/approved.png", NIMSColors.blue01);

  final String label;
  final String asset;
  final Color color;

  const QuickAction(this.label, this.asset, this.color);
}
