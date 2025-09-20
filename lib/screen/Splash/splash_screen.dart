import 'package:flutter/material.dart';
import 'package:paddyguard/const/color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 50), // Top spacing

            // Center content
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                logo(),

                SizedBox(height: 5),

                // App name
                paddyGuardName(),
              ],
            ),

            // Button at bottom
            startButton(),
          ],
        ),
      ),
    );
  }

  Padding startButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            "Get Started",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class logo extends StatelessWidget {
  const logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/image/logo/logo.png", // replace with your logo path
        height: 400,
        width: 400,
        fit: BoxFit.contain,
      ),
    );
  }
}

class paddyGuardName extends StatelessWidget {
  const paddyGuardName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: "Paddy",
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: "Guard",
            style: TextStyle(color: primaryColor),
          ),
        ],
      ),
    );
  }
}
