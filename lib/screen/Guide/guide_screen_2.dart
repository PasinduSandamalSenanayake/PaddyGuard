import 'package:flutter/material.dart';
import 'package:paddyguard/const/color.dart';

class GuideScreen2 extends StatefulWidget {
  const GuideScreen2({super.key});

  @override
  State<GuideScreen2> createState() => _GuideScreen2State();
}

class _GuideScreen2State extends State<GuideScreen2> {
  final TextEditingController _farmSizeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top section (Logo + Title)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Center(
                  child: Image.asset(
                    "assets/image/logo/logo.png", // replace with your logo
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                // const SizedBox(width: 12),
                // App name + tagline
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
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
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      "Smart Detection for Healthy Paddy",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),

            // Center section
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Question
                    const Text(
                      "How many hectares of paddy do you cultivate?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Input box
                    TextField(
                      controller: _farmSizeController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Enter farm size",
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Our Goal title
                    const Text(
                      "Our Goal",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Goals list
                    _buildGoal(
                      "📷 Detect diseases quickly by simply taking a photo of your paddy leaf.",
                    ),
                    _buildGoal(
                      "💡 Receive accurate solutions and farming advice for the detected disease",
                    ),
                    _buildGoal(
                      "🌱 Get quick remedies and recommendations so you can take immediate action in the field.",
                    ),
                  ],
                ),
              ),
            ),

            // Bottom button
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint("Farm size: ${_farmSizeController.text}");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Goal item widget
  Widget _buildGoal(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 15.0, top: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 15, color: Colors.black87),
      ),
    );
  }
}
