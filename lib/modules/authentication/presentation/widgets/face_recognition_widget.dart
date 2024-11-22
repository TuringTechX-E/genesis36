import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class FaceRecognitionWidget extends StatefulWidget {
  const FaceRecognitionWidget({super.key});

  @override
  _FaceRecognitionWidgetState createState() => _FaceRecognitionWidgetState();
}

class _FaceRecognitionWidgetState extends State<FaceRecognitionWidget> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    if (_cameras != null && _cameras!.isNotEmpty) {
      _cameraController = CameraController(
        _cameras![1], // Use the front camera for face recognition
        ResolutionPreset.medium,
      );
      await _cameraController!.initialize();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return const CircularProgressIndicator();
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orangeAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () {
        // Implement face recognition logic here
      },
      child: const Text(
        'Login with Face Recognition',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }
}
