import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_network_image.dart';

class BlinkPostWidget extends StatelessWidget {
  const BlinkPostWidget({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        CustomContainer(
          height: 202.h,
          width: 100.w,
          // color: Colors.white,
          radiusAll: 8.r,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CustomNetworkImage(imageUrl: imageUrl),
          ),
        ),
        Icon(
          Icons.play_circle_fill_outlined,
          color: Colors.white,
          shadows: [Shadow(color: AppColors.greyColor)],
        ),
      ],
    );
  }
}
