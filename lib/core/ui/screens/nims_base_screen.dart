import 'package:flutter/material.dart';

class NIMSBaseScreen extends StatelessWidget {
  // final List<Widget> children;
  // final double horizontalPadding;

  final Widget? header;
  final Widget? body;
  final Widget? bottom;

  const NIMSBaseScreen({
    super.key,
    // this.children = const <Widget>[],
    // this.horizontalPadding = 20,
    this.header,
    this.body,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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

    // return Scaffold(
    //   backgroundColor: Theme.of(context).colorScheme.surface,
    //   body: SafeArea(
    //     child: SingleChildScrollView(
    //       padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: children,
    //       ),
    //     ),
    //   ),
    // );
  }
}
