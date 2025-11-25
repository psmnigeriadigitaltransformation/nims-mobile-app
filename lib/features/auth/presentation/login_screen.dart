import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projects/core/ui/widgets/nims_button.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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

              const SizedBox(height: 30),

              /// -------------------------------
              /// LOGIN ID INPUT
              /// -------------------------------
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your login ID",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// -------------------------------
              /// PASSWORD INPUT
              /// -------------------------------
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  suffixIcon: const Icon(Icons.visibility_off),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              /// Forgot password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot password",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// -------------------------------
              /// LOGIN BUTTON
              /// -------------------------------
              NIMSButton(text: "Login", onPressed: () {}),

              SizedBox(height: size.height * 0.18),

              /// -------------------------------
              /// FOOTER LOGOS + VERSION
              /// -------------------------------
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // First footer logo placeholder
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade300,
                        ),
                        child: Image.asset(
                          "lib/core/ui/icons/ng_coat_of_arm_logo.png",
                        ),
                      ),

                      const SizedBox(width: 16),

                      // Second footer logo placeholder
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade300,
                        ),
                        child: Image.asset("lib/core/ui/icons/us_dos_logo.png"),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "v1.0.0",
                    style: TextStyle(fontSize: 13, color: Colors.black45),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
