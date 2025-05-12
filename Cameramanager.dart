import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Cameramanager {
  late CameraController _controller;
  bool _isCameraInitialized = false;

  bool get isInitialized => _isCameraInitialized;

  CameraController get controller => _controller;
  
  Future<void> initialize() async {
    await _initializeCamera();
  }
  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;
    print('Inicializando camera');

    _controller = CameraController(
      camera,
      ResolutionPreset.medium,
      enableAudio: false,
    );

    try {
      await _controller.initialize();
      _isCameraInitialized = true;
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  Widget getPreview() {
    print('Previewing camera');
    if (_isCameraInitialized) {
      return CameraPreview(_controller);
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }

  Future<String?> takePicture() async {
    if (_isCameraInitialized) {
      try {
        final image = await _controller.takePicture();
        print('Picture saved at: ${image.path}');
        return image.path;
      } catch (e) {
        print('Error taking picture: $e');
      }
    }
  }
  void dispose() {
    _controller.dispose();
  }
}
