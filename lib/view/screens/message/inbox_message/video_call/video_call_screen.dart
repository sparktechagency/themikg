import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/view/widgets/custom_container.dart';
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
  bool _isCameraOn = true;

  final List<IconData> audioCallIcons = [
    Icons.mic_none_rounded,
    Icons.volume_up,
    Icons.videocam,
    Icons.close,
  ];
  final List<IconData> audioCallCloseIcon = [
    Icons.mic_off_rounded,
    Icons.volume_off,
    Icons.videocam_off,
    Icons.close,
  ];
  final List<bool> isTapped = [false, false, false, false];

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isEmpty) {
        setState(() {
          _isCameraInitialize = false;
        });
        return;
      }
      _cameraController = CameraController(
        _cameras[_selectedIndex],
        ResolutionPreset.high,
      );
      await _cameraController?.initialize();
      setState(() {
        _isCameraInitialize = true;
      });
    } catch (e) {
      setState(() {
        _isCameraInitialize = false;
      });
      debugPrint('Video camera error $e');
    }
  }

  void _switchCamera() {
    setState(() {
      _selectedIndex = (_selectedIndex + 1) % _cameras.length;
      _initializeCamera();
    });
  }

  void _toggleCameraOnOff() {
    setState(() {
      if (_isCameraOn) {
        _cameraController?.dispose();
        _cameraController = null;
        _isCameraInitialize = false;
      } else {
        _initializeCamera();
      }
      _isCameraOn = !_isCameraOn;
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // Only show CameraPreview if the camera is initialized and on
                // _isCameraOn && _cameraController != null
                if(_cameraController != null)
                  Positioned.fill(
                    child: CameraPreview(_cameraController!),
                  ),

                    // ?
                //     : Center(
                //   child: CustomText(text: 'Camera is off now'),
                // ),
                Positioned(
                  left: 20,
                  bottom: 10,
                  child: _isCameraOn?IconButton(
                    onPressed: _switchCamera,
                    icon: Icon(
                      Icons.switch_camera,
                      size: 30.h,
                      color: Colors.white,
                    ),
                  ):SizedBox.shrink(),
                ),
              ],
            ),
          ),
          CustomContainer(
            alignment: Alignment.topCenter,
            topRightRadius: 16.r,
            topLeftRadius: 16.r,
            height: 150.h,
            linearColors: [Color(0xff282828), Color(0xFF0E0E0E)],
            color: AppColors.borderColor,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.r,
                right: 16.r,
                top: 32.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(audioCallIcons.length, (index) {
                  return CustomContainer(
                    onTap: () {
                      setState(() {
                        isTapped[index] = !isTapped[index];
                      });
                      if (index == 3) {
                        Get.back();
                      }
                      if (index == 2) {
                        _toggleCameraOnOff(); // Toggle camera on/off
                      }
                    },
                    alignment: Alignment.center,
                    height: 57.h,
                    width: 57.w,
                    shape: BoxShape.circle,
                    color: index == 3
                        ? AppColors.greyColor
                        : AppColors.primaryColor,
                    child: Icon(
                      isTapped[index]
                          ? audioCallCloseIcon[index]
                          : audioCallIcons[index],
                      size: 30.h,
                      color: Colors.white,
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Safely dispose of the camera controller
    _cameraController?.dispose();
    super.dispose();
  }
}
