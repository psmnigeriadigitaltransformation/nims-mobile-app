import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projects/core/ui/screens/nims_screen.dart';
import 'package:projects/core/ui/widgets/nims_primary_button.dart';

import '../../../app/route_name+path+params.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return NIMSScreen(
      children: [
        const SizedBox(height: 80),

        /// -------------------------------
        /// TOP LOGO
        /// -------------------------------
        Center(
          child: Image.asset("lib/core/ui/icons/nims_logo.png", height: 128),
        ),

        const SizedBox(height: 50),

        /// -------------------------------
        /// HELLO TEXT
        /// -------------------------------
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("Hello!", style: Theme.of(context).textTheme.bodyLarge),
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
              style: Theme.of(context).textTheme.bodyLarge,
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
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            decoration: const InputDecoration(
              labelText: "Login ID",
              hintText: "Enter your login ID",
            ),
          ),
        ),

        const SizedBox(height: 20),

        /// -------------------------------
        /// PASSWORD INPUT
        /// -------------------------------
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
          child: TextField(
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
              suffixIcon: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                child: Icon(Icons.visibility_off),
              ),
            ),
          ),
        ),

        const SizedBox(height: 86),

        /// -------------------------------
        /// LOGIN BUTTON
        /// -------------------------------
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
          child: NIMSPrimaryButton(
            text: "Login",
            onPressed: () {
              context.pushReplacementNamed(dashboardScreen);
            },
            loading: false,
          ),
        ),

        SizedBox(height: size.height * 0.20),

        /// -------------------------------
        /// FOOTER LOGOS
        /// -------------------------------
        Column(
          children: [
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
                  child: Image.asset(
                    "lib/core/ui/icons/ng_coat_of_arm_logo.png",
                  ),
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

        const SizedBox(height: 16),
      ],
    );
  }
}
