import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_network_image.dart';
import 'package:themikg/view/widgets/custom_text.dart';

class AudioCallScreen extends StatefulWidget {
  const AudioCallScreen({super.key});

  @override
  State<AudioCallScreen> createState() => _AudioCallScreenState();
}

class _AudioCallScreenState extends State<AudioCallScreen> {
  final List<IconData> audioCallIcons = [
    Icons.mic_none_rounded,
    Icons.videocam,
    Icons.volume_up,
    Icons.close,
  ];
  final List<IconData> audioCallCloseIcon = [
    Icons.mic_off_rounded,
    Icons.videocam_off,
    Icons.volume_off,
    Icons.close,
  ];
  final List<bool> isTapped = [false, false, false, false];
  bool showAudioControl = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // Background image
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Assets.icons.inboxMessageBackgroundImage.image(
                fit: BoxFit.cover,
              ),
            ),
            // Main content (top part)
            Padding(
              padding: EdgeInsets.all(24.r),
              child: Column(
                children: [
                  SizedBox(height: 120.h),
                  CustomContainer(
                    height: 108.h,
                    width: 108.w,
                    shape: BoxShape.circle,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1000.r),
                      child: CustomNetworkImage(
                        imageUrl: "https://i.pravatar.cc/150?img=12",
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  CustomText(
                    text: 'John Smith',
                    fontSize: 20.sp,
                    fontName: FontFamily.trajanPro,
                  ),
                  CustomText(text: 'Connecting...', fontSize: 16.sp),
                ],
              ),
            ),
            showAudioControl
                ?Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomContainer(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(audioCallIcons.length, (index) {
                      return CustomContainer(
                        onTap: () {
                          setState(() {
                            isTapped[index] = !isTapped[index];
                          });
                          if (index == 3) {
                            Get.back();
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
            ): Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomContainer(
                                onTap: () {
                                  Get.back();
                                },
                                alignment: Alignment.center,
                                height: 74.h,
                                width: 74.w,
                                shape: BoxShape.circle,
                                color: AppColors.greyColor,
                                child: Icon(
                                  Icons.call_end,
                                  size: 40.h,
                                  color: Colors.white,
                                ),
                              ),
                              CustomContainer(
                                onTap: () {
                                  setState(() {
                                    showAudioControl=true;
                                  });
                                },
                                alignment: Alignment.center,
                                height: 74.h,
                                width: 74.w,
                                shape: BoxShape.circle,
                                color: AppColors.primaryColor,
                                child: Icon(
                                  Icons.call,
                                  size: 40.h,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.h),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
