import 'package:flutter/material.dart';

class NIMSScreen extends StatelessWidget {
  final List<Widget> children;
  final double horizontalPadding;

  const NIMSScreen({
    super.key,
    this.children = const <Widget>[],
    this.horizontalPadding = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}
