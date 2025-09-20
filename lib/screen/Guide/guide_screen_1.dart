import 'package:flutter/material.dart';
import 'package:paddyguard/const/color.dart';

class GuideScreen1 extends StatefulWidget {
  const GuideScreen1({super.key});

  @override
  State<GuideScreen1> createState() => _GuideScreen1State();
}

class _GuideScreen1State extends State<GuideScreen1> {
  String? _selectedLanguage = "English"; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo circle
                logo(),
                // const SizedBox(width: 5),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    nameText(),
                    const SizedBox(height: 2),
                    const Text(
                      "Smart Detection for Healthy Paddy",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),

            // Center Section (Language Question + Options)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "What is your language?",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Language Options
                  _buildLanguageOption("සිංහල"),
                  _buildLanguageOption("English"),
                  _buildLanguageOption("Tamil"),
                ],
              ),
            ),

            // Bottom Section (Button)
            continueButton(),
          ],
        ),
      ),
    );
  }

  Padding continueButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            // Navigate to next screen
            debugPrint("Selected: $_selectedLanguage");
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            "Continue",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }

  RichText nameText() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 22,
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

  Center logo() {
    return Center(
      child: Image.asset(
        "assets/image/logo/logo.png", // replace with your logo
        height: 100,
        fit: BoxFit.contain,
      ),
    );
  }

  // Widget for radio styled language options
  Widget _buildLanguageOption(String language) {
    final isSelected = _selectedLanguage == language;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedLanguage = language;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey.shade400,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
          color: isSelected ? Colors.green.withOpacity(0.1) : Colors.white,
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? Colors.green : Colors.grey,
            ),
            const SizedBox(width: 12),
            Text(
              language,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.green : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
