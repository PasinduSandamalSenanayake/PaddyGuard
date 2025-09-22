import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:paddyguard/const/color.dart';
import 'package:path/path.dart' as p; // Updated import
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  XFile? _capturedImage;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(firstCamera, ResolutionPreset.high);
    _initializeControllerFuture = _controller!.initialize();
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller!.takePicture();

      final directory = await getApplicationDocumentsDirectory();
      final filePath =
          p.join(directory.path, "${DateTime.now()}.png"); // Use p.join
      await image.saveTo(filePath);

      setState(() {
        _capturedImage = XFile(filePath);
      });
    } catch (e) {
      debugPrint("Error taking picture: $e");
    }
  }

  void _retakePicture() {
    setState(() {
      _capturedImage = null;
    });
  }

  void _showNextDialog() {
    showDialog(
      context: context, // Flutter's BuildContext
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text("What do you want to do?"),
          content:
              const Text("Choose whether to continue or retake the picture."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext); // Close dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Continuing...")),
                );
              },
              child: const Text(
                "Continue",
                style: TextStyle(color: Colors.green),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext); // Close dialog
                _retakePicture();
              },
              child: const Text(
                "Retake",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Camera preview OR captured image
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.antiAlias,
                child: _capturedImage == null
                    ? FutureBuilder(
                        future: _initializeControllerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return CameraPreview(_controller!);
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      )
                    : Image.file(
                        File(_capturedImage!.path),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
              ),
            ),

            // Bottom controls
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Gallery thumbnail (static for now)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: _capturedImage == null
                        ? Container(
                            width: 40,
                            height: 40,
                            color: Colors.grey[300],
                          )
                        : Image.file(
                            File(_capturedImage!.path),
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                  ),

                  // Capture Button
                  GestureDetector(
                    onTap: _capturedImage == null ? _takePicture : () {},
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _capturedImage == null
                            ? Colors.green
                            : Colors.grey[400],
                      ),
                    ),
                  ),

                  // Next Button
                  ElevatedButton(
                    onPressed: _capturedImage != null ? _showNextDialog : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Next"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
