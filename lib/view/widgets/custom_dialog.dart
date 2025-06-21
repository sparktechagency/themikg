import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_text.dart';

Future<bool?> customPopUpWidget({
  required BuildContext context,
  required String title,
  required String subtitle,
  Color? titleColor,
  String? firstButton,
  String? lastButton,
  void Function()? onPressedFirstButton,
  void Function()? onPressedLastButton,
}) async {
  return showDialog(
    context: context,
    // barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        alignment: Alignment.center,
        backgroundColor: AppColors.bgColor,
        title: CustomText(
          text: title,
          fontSize: 24.sp,
          fontName: FontFamily.trajanPro,
          textAlign: TextAlign.start,
        ),
        content: CustomText(
          text: subtitle,
          fontSize: 16.sp,
          textAlign: TextAlign.start,
        ),
        actions: [
          CustomButton(
            onPressed: () {
              onPressedFirstButton;
              Get.back();
            },
            label: firstButton,
            height: 40.h,
            width: 100.w,
            radius: 8.r,
          ),
          CustomButton(
            onPressed: () {
              onPressedLastButton;
              Get.back();
            },
            label: lastButton,
            height: 40.h,
            width: 100.w,
            backgroundColor: AppColors.errorColor,
            radius: 8.r,
          ),
        ],
      );
    },
  );
}
