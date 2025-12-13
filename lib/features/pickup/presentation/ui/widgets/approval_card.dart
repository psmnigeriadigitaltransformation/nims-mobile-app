import 'package:flutter/material.dart';

class ApprovalCard extends StatelessWidget {
  const ApprovalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 8, vertical: 8),
      child: Container(
        padding: EdgeInsetsGeometry.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
        child: Column(
          children: [
            Image.asset("lib/core/ui/icons/signature_placeholder.png"),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Signee Full Name",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: Text(
                    "Hassan Abdulwahab",
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Signee Designation",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: Text(
                    "Officer",
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Signee Phone Number",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: Text(
                    "08167290882",
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
