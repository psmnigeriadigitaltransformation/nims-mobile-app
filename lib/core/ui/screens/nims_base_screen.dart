import 'package:flutter/material.dart';

class NIMSBaseScreen extends StatelessWidget {

  final Widget? header;
  final Widget? body;
  final Widget? bottom;

  const NIMSBaseScreen({
    super.key,
    this.header,
    this.body,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottom == null
          ? null
          : SafeArea(minimum: const EdgeInsets.all(16), child: bottom!),
      body: SafeArea(
        child: Column(
          children: [
            /// HEADER (fixed at the top)
            if (header != null) header!,

            /// BODY (scrollable and expands)
            Expanded(
              child: SingleChildScrollView(
                child: body ?? const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
