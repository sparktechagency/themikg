import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_network_image.dart';
import 'package:themikg/view/widgets/custom_text.dart';

class CircleProfileForStory extends StatelessWidget {
  const CircleProfileForStory({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CustomContainer(
              height: 70.h,
              width: 70.w,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryColor,width: 2.w),
            ),
            CustomContainer(
              alignment: Alignment.center,
              height: 55.h,
              width: 55.w,
              shape: BoxShape.circle,
              child: ClipOval(child: CustomNetworkImage(imageUrl: imageUrl)),
            ),
          ],
        ),
        CustomText(text: name),
      ],
    );
  }
}