import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_network_image.dart';
import 'package:themikg/view/widgets/custom_text.dart';

class ProfileDetailsWidget extends StatelessWidget {
  const ProfileDetailsWidget({
    super.key,
    required this.interestList,
    required this.profileImage,
    required this.name,
    required this.userName,
    this.location,
    this.size,
    this.bio,
    this.isEditIconShowing = false,
  });

  final String profileImage;
  final String name;
  final String userName;
  final String? location;
  final String? size;
  final List<String> interestList;
  final bool isEditIconShowing;
  final String? bio;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CustomNetworkImage(
                  imageUrl: profileImage,
                  height: 120.h,
                  width: 120.w,
                  borderRadius: BorderRadius.circular(1000.r),
                  border: Border.all(color: AppColors.primaryColor, width: 2),
                ),
                isEditIconShowing
                    ? CustomContainer(
                  alignment: Alignment.center,
                  height: 30.h,
                  width: 30.w,
                  color: AppColors.primaryColor,
                  radiusAll: 8.r,
                  child: Icon(
                    Icons.edit,
                    color: AppColors.bgColor,
                    weight: 100,
                  ),
                )
                    : SizedBox.shrink(),
              ],
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: userName,
                  fontName: FontFamily.trajanPro,
                  fontSize: 20.sp,
                ),
                SizedBox(height: 8.h),
                CustomText(text: name, fontSize: 16.sp),
                SizedBox(height: 4.h),
                CustomText(text: location??'', fontSize: 12.sp),
                SizedBox(height: 4.h),
                CustomText(text:"Size: $size", fontSize: 12.sp),
                // SizedBox(height: 4.h,),
                Row(
                  children: List.generate(interestList.length, (index) {
                    return Container(
                      alignment: Alignment.center,
                      height: 25.h,
                      width: 60.w,
                      // padding: EdgeInsets.only(left:6.h,right: 6.w,top: 4.h,bottom: 4.h),
                      margin: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        color: AppColors.postCardColor,
                        border: Border.all(color: AppColors.borderColor),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: CustomText(
                        text: interestList[index],
                        fontSize: 10.sp,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 16.h),
        CustomText(
          text:
          bio??'',
          fontSize: 12.sp,
          color: AppColors.greyColor,
        ),
      ],
    );
  }
}