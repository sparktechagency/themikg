import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/view/widgets/custom_text.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  int _selectedIndex = 1;
  late List<CameraDescription> _cameras;
  CameraController? _cameraController;
  bool _isCameraInitialize = false;

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(
      _cameras[_selectedIndex],
      ResolutionPreset.high,
    );
    await _cameraController?.initialize();
    setState(() {
      _isCameraInitialize = true;
    });
  }

  void _switchCamera(){

  }

  @override
  void initState() {
    _initializeCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isCameraInitialize?Column(
        children: [
          CameraPreview(_cameraController!)
        ],
      ):Center(child: CircularProgressIndicator(color: AppColors.primaryColor,))
    );
  }

  @override
  void dispose() {
    _cameraController!.dispose();
    super.dispose();
  }
}
