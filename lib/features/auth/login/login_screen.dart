import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nims_mobile_app/app/route_name+path+params.dart';
import 'package:nims_mobile_app/core/ui/widgets/nims_primary_button.dart';

import '../../../core/ui/screens/nims_base_screen.dart';
import '../../../core/ui/widgets/nims_alert_dialog_content.dart';
import '../../../core/ui/widgets/nims_error_content.dart';
import 'providers.dart';

class LoginScreen extends ConsumerWidget {
  final loginIdController = TextEditingController(text: "SK0012");
  final passwordController = TextEditingController(text: "password");

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginScreenStateNotifierProvider);

    ref.listen(
      loginScreenStateNotifierProvider.select((state) => state.alert),
      (prev, next) {
        developer.log("ref.listen -> prev: $prev, next: $next, state: $state");
        if (next.show) {
          showDialog(
            context: context,
            builder: (buildContext) => NIMSAlertDialogContent(
              message: next.message,
              onTapActionButton: () {
                context.pop();
                ref
                    .read(loginScreenStateNotifierProvider.notifier)
                    .onDismissAlertDialog();
              },
              showCancelButton: false,
              actionButtonLabel: "Okay",
            ),
          );
        }
      },
    );

    return NIMSBaseScreen(
      header: null,
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 80),

            /// -------------------------------
            /// TOP LOGO
            /// -------------------------------
            Center(
              child: Image.asset(
                "lib/core/ui/icons/nims_logo.png",
                height: 128,
              ),
            ),

            const SizedBox(height: 50),

            /// -------------------------------
            /// HELLO TEXT
            /// -------------------------------
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hello!",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),

            /// -------------------------------
            /// LOGIN TO GET STARTED TEXT
            /// -------------------------------
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login to get started.",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),

            const SizedBox(height: 50),

            /// -------------------------------
            /// LOGIN ID INPUT
            /// -------------------------------
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
              child: TextField(
                controller: loginIdController,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                decoration: const InputDecoration(
                  labelText: "Login ID",
                  hintText: "Enter your login ID",
                  helperText: "",
                  errorText: null,
                ),
              ),
            ),

            const SizedBox(height: 8),

            /// -------------------------------
            /// PASSWORD INPUT
            /// -------------------------------
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
              child: TextField(
                controller: passwordController,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                  helperText: "",
                  errorText: null,
                  suffixIcon: Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                    child: Icon(Icons.visibility_off),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 80),

            /// -------------------------------
            /// LOGIN BUTTON
            /// -------------------------------
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
              child: NIMSPrimaryButton(
                text: "Login",
                onPressed: () {
                  ref
                      .read(loginScreenStateNotifierProvider.notifier)
                      .login(
                        loginId: loginIdController.text,
                        password: passwordController.text,
                        onSuccess: () {
                          context.pushReplacementNamed(dashboardScreen);
                        },
                      );
                },
                loading: state.isLoginLoading,
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),

      bottom: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// -------------------------------
          /// FOOTER LOGOS + APP VERSION
          /// -------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                ),
                child: Image.asset("lib/core/ui/icons/ng_coat_of_arm_logo.png"),
              ),

              const SizedBox(width: 8),
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                ),
                child: Image.asset("lib/core/ui/icons/us_dos_logo.png"),
              ),
            ],
          ),

          const SizedBox(height: 8),

          /// -------------------------------
          /// FOOTER VERSION
          /// -------------------------------
          Text(
            "v2.0.0",
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
