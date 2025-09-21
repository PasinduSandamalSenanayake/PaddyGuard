import 'package:flutter/material.dart';

class DiseaseScreen extends StatefulWidget {
  const DiseaseScreen({super.key});

  @override
  State<DiseaseScreen> createState() => _DiseaseScreenState();
}

class _DiseaseScreenState extends State<DiseaseScreen> {
  // Function to build a disease card
  Widget buildDiseaseCard({
    required String title,
    required String description,
    required String imagePath,
    required VoidCallback onPressed,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Card
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: onPressed,
                      child: const Text("Catch the Disease"),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 100), // space for circle
            ],
          ),
        ),

        // Disease image circle (overflow)
        Positioned(
          right: 5,
          top: -10,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border:
                  Border.all(color: Colors.yellow, width: 4), // optional border
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 45.0, horizontal: 4.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildDiseaseCard(
                title: "Leaf Blast",
                description:
                    "It has survived not only five centuries, but also the leap into electronic typesetting, remaining",
                imagePath: "assets/image/diseases/Leaf_blast.png",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DiseaseDetailsScreen(
                        diseaseName: "Leaf Blast",
                      ),
                    ),
                  );
                },
              ),
              buildDiseaseCard(
                title: "Leaf Scald",
                description:
                    "It has survived not only five centuries, but also the leap into electronic typesetting, remaining",
                imagePath: "assets/image/diseases/Leaf_blast.png",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DiseaseDetailsScreen(
                        diseaseName: "Leaf Scald",
                      ),
                    ),
                  );
                },
              ),
              buildDiseaseCard(
                title: "Bacterial Leaf Blight",
                description:
                    "It has survived not only five centuries, but also the leap into electronic typesetting, remaining",
                imagePath: "assets/image/diseases/Leaf_blast.png",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DiseaseDetailsScreen(
                        diseaseName: "Bacterial Leaf Blight",
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Example detail screen
class DiseaseDetailsScreen extends StatelessWidget {
  final String diseaseName;

  const DiseaseDetailsScreen({super.key, required this.diseaseName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Details about $diseaseName",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
