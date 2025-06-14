import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/view/widgets/ProductImageCarouselSlider.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_network_image.dart';
import 'package:themikg/view/widgets/custom_text.dart';

class CardForPost extends StatelessWidget {
  const CardForPost({
    super.key,
    required this.profileImage,
    required this.name,
    required this.userName,
    required this.postTitle,
    required this.postImage,
    required this.likeCount,
    required this.commentCount,
  });

  final String profileImage;
  final String name;
  final String userName;
  final String postTitle;
  final String postImage;
  final String likeCount;
  final String commentCount;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      // paddingBottom: 16.h,
      color: AppColors.postCardColor,
      topRightRadius: 16.r,
      topLeftRadius: 16.r,
      bottomLeft: 16.r,
      bottomRight: 16.r,
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 1),
          color: AppColors.primaryColor.withOpacity(.3),
          spreadRadius: .5,
          blurRadius: 6,
        ),
      ],
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CustomNetworkImage(
                imageUrl: profileImage,
                height: 41.h,
                width: 41.w,
                boxShape: BoxShape.circle,
              ),
              title: CustomText(text: userName, textAlign: TextAlign.start),
              subtitle: CustomText(
                text: name,
                textAlign: TextAlign.start,
                fontSize: 12.sp,
                color: AppColors.greyColor,
              ),
              trailing: Assets.icons.moreCircleIcon.svg(),
            ),
            CustomText(
              text: postTitle,
              textAlign: TextAlign.start,
              fontSize: 12.sp,
            ),
            SizedBox(height: 16.h),
            // CustomContainer(
            //   height: 327.h,
            //   width: 327.w,
            //   topLeftRadius: 16.r,
            //   topRightRadius: 16.r,
            //   bottomLeft: 16.r,
            //   bottomRight: 16.r,
            //   child: CustomNetworkImage(
            //     imageUrl: 'https://i.pravatar.cc/150?img=48',
            //     borderRadius: BorderRadius.circular(16.r),
            //   ),
            // ),
            ProductImageCarouselSlider(imageUrl: postImage),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 8.r,
                  children: [
                    Assets.icons.reactIcon1.svg(),
                    Assets.icons.reactIcon2.svg(),
                    Assets.icons.reactIcon3.svg(),
                    CustomText(text: likeCount),
                    SizedBox(width: 8.w),
                    Assets.icons.commentIcon.svg(),
                    CustomText(text: commentCount),
                  ],
                ),
                Assets.icons.saveIcon.svg(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}