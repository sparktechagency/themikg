import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:themikg/app/routes/app_routes.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/helper/image_picker_helper.dart';
import 'package:themikg/view/screens/add_content/nebulox/nebulox_screen.dart';
import 'package:themikg/view/screens/add_content/video_recording/video_recording_screen.dart';
import 'package:themikg/view/screens/explore/explore_screen.dart';
import 'package:themikg/view/screens/home/home_screen.dart';
import 'package:themikg/view/screens/message/message_screen.dart';
import 'package:themikg/view/screens/my_profile/my_profile_screen.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_text.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  final ImagePickerHelper _imagePickerHelper = ImagePickerHelper();
  File? _profileImage;
  File? _videoFile;
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    ExploreScreen(),
    Container(),
    MessageScreen(),
    MyProfileScreen(),
  ];

  Future<void> _getPhotoFromCamera() async {
    final image = await _imagePickerHelper.pickFromCamera();
    if (image != null) {
      setState(() {
        _profileImage = image;
      });
      Get.to(() => NebuloxScreen(image: _profileImage!));
    }
  }

  Future<void> _pickVideo() async {
    File? video = await _imagePickerHelper.pickVideoFromCamera();
    if (video != null) {
      setState(() {
        _videoFile = video;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoRecordingScreen(videoFile: _videoFile!),
        ),
      );
    }
  }

  Widget menuItem(String title, String icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: title, fontWeight: FontWeight.w600),
          SizedBox(width: 16.w),
          SvgPicture.asset(
            icon,
            color: Colors.white,
            height: 24.h,
            width: 24.w,
          ),
        ],
      ),
    );
  }

  void _handleAddButtonTap() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          alignment: Alignment(-1, .9),
          title: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Main Container
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.uploadOrbitScreen);
                      },
                      child: menuItem("Orbit", Assets.icons.orbitIcon.path),
                    ),
                    GestureDetector(
                      onTap: () {
                        _pickVideo();
                      },
                      child: menuItem("Blink", Assets.icons.blinkIcon.path),
                    ),
                    GestureDetector(
                      onTap: () {
                        _pickVideo();
                      },
                      child: menuItem("Staller", Assets.icons.stellaIcon.path),
                    ),
                    GestureDetector(
                      onTap: () {
                        _getPhotoFromCamera();
                      },
                      child: menuItem("Nebulox", Assets.icons.nebuloxIcon.path),
                    ),
                  ],
                ),
              ),
              // Arrow Indicator
              Positioned(
                bottom: 0,
                child: Transform.rotate(
                  angle: 45 * 3.1416 / 180,
                  child: Container(width: 20, height: 20, color: Colors.black),
                ),
              ),
              // Positioned(
              //   bottom: -1,
              //     child: Assets.icons.addIconActive.svg()),
            ],
          ),
        );
      },
    );
  }

  void _handleNavigationTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: SafeArea(
        child: CustomContainer(
          height: 99.h,
          color: AppColors.borderColor,
          topLeftRadius: 20.sp,
          topRightRadius: 20.sp,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(_navItems.length, (index) {
              bool isSelected = _selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  if (index == 2) {
                    // Handle the special "Add" button case
                    _handleAddButtonTap();
                  } else {
                    // Normal navigation case
                    _handleNavigationTap(index);
                  }
                },
                child: SvgPicture.asset(
                  isSelected
                      ? _navItems[index]['activeIcon']
                      : _navItems[index]['icon'],
                  height: 30.h,
                  width: 30.w,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> _navItems = [
    {
      'icon': Assets.icons.homeIcon.path,
      'activeIcon': Assets.icons.homeIconActive.path,
    },
    {
      'icon': Assets.icons.exploreIcon.path,
      'activeIcon': Assets.icons.exploreIconActive.path,
    },
    {
      'icon': Assets.icons.addIcon.path,
      'activeIcon': Assets.icons.addIconActive.path,
    },
    {
      'icon': Assets.icons.inboxMessageIcon.path,
      'activeIcon': Assets.icons.messageIconActive.path,
    },
    {
      'icon': Assets.icons.myProfileIcon.path,
      'activeIcon': Assets.icons.myProfileIconActive.path,
    },
  ];
}
