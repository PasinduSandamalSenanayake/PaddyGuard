import 'package:flutter/material.dart';

class BacterialLeafScreen extends StatelessWidget {
  const BacterialLeafScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Bacterial Leaf",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/image/diseases/Leaf_blast.png",
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Title
            const Text(
              "Leaf Blast",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),

            // Subtitle with blinking dot
            Row(
              children: const [
                BlinkingDot(),
                SizedBox(width: 6),
                Text(
                  "Disease Detection",
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Description
            const Text(
              "Description",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 6),
            const Text(
              "Leaf blast in paddy, caused by Magnaporthe oryzae, produces "
              "spindle-shaped gray lesions with brown edges on leaves. Favoring "
              "humidity and moderate temperatures, it weakens plants, reduces "
              "photosynthesis, and can cause severe yield loss.",
              style: TextStyle(fontSize: 14, color: Colors.black87),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),

            // Symptoms
            const Text(
              "Symptoms of Leaf Blast",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: const Text(
                "• Leaf lesions: Small, spindle-shaped spots with gray or whitish centers and brown margins\n"
                "• Leaf drying: Severe infection leads to drying and burning of leaves.\n"
                "• Collar blast: Infection at the junction of leaf and stem causes the leaf to wither.",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 16),

            // Solutions
            const Text(
              "Solutions",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: const Text(
                "• Tebuconazole 25 mg/l\n"
                "• Isoprothiolane 40 mg/l\n"
                "• Carbendazim 20 mg/l",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 16),

            // Remedies
            const Text(
              "Remedies and manage the disease",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: const Text(
                "• Avoid excessive nitrogen fertilizer\n"
                "• Split fertilizer application\n"
                "• Remove infected plant debris",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 24),

            // Done button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Done",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlinkingDot extends StatefulWidget {
  const BlinkingDot({super.key});

  @override
  State<BlinkingDot> createState() => _BlinkingDotState();
}

class _BlinkingDotState extends State<BlinkingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true); // makes it blink
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: const Icon(
        Icons.circle,
        size: 10,
        color: Colors.red,
      ),
    );
  }
}
