import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:themikg/app/routes/app_routes.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:video_player/video_player.dart';

class VideoRecordingScreen extends StatefulWidget {
  final File videoFile;

  const VideoRecordingScreen({Key? key, required this.videoFile})
    : super(key: key);

  @override
  _VideoRecordingScreenState createState() => _VideoRecordingScreenState();
}

class _VideoRecordingScreenState extends State<VideoRecordingScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the VideoPlayerController with the captured video file
    _controller = VideoPlayerController.file(widget.videoFile)
      ..initialize().then((_) {
        setState(() {});
        _controller
            .play(); // Start playing the video immediately after initialization
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose(); // Don't forget to dispose the controller
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(
        actions: [
          CustomButton(
            onPressed: () {
              Get.offAllNamed(AppRoutes.bottomNavBarScreen);
            },
            label: 'Upload',
            prefixIcon: Icon(Icons.upload, color: Colors.white, size: 20.h),
            width: 100.w,
            height: 36.h,
            backgroundColor: Colors.blue,
          ),
          SizedBox(width: 16.w,)
        ],
      ),
      body: SafeArea(
        child: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : CircularProgressIndicator(), // Display a loading indicator while the video is loading
        ),
      ),
    );
  }
}
