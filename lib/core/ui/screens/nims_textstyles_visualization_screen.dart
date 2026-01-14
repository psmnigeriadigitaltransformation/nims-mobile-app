import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nims_mobile_app/core/ui/theme/text_styles.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_primary_button.dart';

class NIMSTextStylesVisualizationScreen extends ConsumerWidget {
  const NIMSTextStylesVisualizationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Center(
                child: Image.asset(
                  "lib/core/ui/icons/nims_logo.png",
                  height: 128,
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login to get started",
                  style: NIMSTextStyles.displayLarge,
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login to get started",
                  style: NIMSTextStyles.displayMedium,
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login to get started",
                  style: NIMSTextStyles.displaySmall,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login to get started",
                  style: NIMSTextStyles.headlineLarge,
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login to get started",
                  style: NIMSTextStyles.headlineMedium,
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login to get started",
                  style: NIMSTextStyles.headlineSmall,
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login to get started",
                  style: NIMSTextStyles.titleLarge,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login to get started",
                  style: NIMSTextStyles.titleMedium,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login to get started",
                  style: NIMSTextStyles.titleSmall,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login to get started",
                  style: NIMSTextStyles.bodyLarge,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login to get started",
                  style: NIMSTextStyles.bodyMedium,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login to get started",
                  style: NIMSTextStyles.bodySmall,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login to get started",
                  style: NIMSTextStyles.labelLarge,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login to get started",
                  style: NIMSTextStyles.labelMedium,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login to get started",
                  style: NIMSTextStyles.labelSmall,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
