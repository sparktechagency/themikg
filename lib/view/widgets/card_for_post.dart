import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:themikg/app/routes/app_routes.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/view/widgets/ProductImageCarouselSlider.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_network_image.dart';
import 'package:themikg/view/widgets/custom_text.dart';

class CardForPost extends StatefulWidget {
  CardForPost({
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
  final int likeCount;
  final int commentCount;

  @override
  State<CardForPost> createState() => _CardForPostState();
}

class _CardForPostState extends State<CardForPost> {
  int selectedIndex = -1;
  int selectedSaveButton = 0;
  final List<String> reactIcon = [
    Assets.icons.reactIcon1.path,
    Assets.icons.reactIcon2.path,
    Assets.icons.reactIcon3.path,
  ];
  final List<String> bottomSheetButton = [
    'View Profile',
    'Block Profile',
    'Report...',
  ];

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
            ///<<<<<========Post header (name, userName,Profile pic)==========>>>>
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CustomNetworkImage(
                imageUrl: widget.profileImage,
                height: 41.h,
                width: 41.w,
                boxShape: BoxShape.circle,
              ),
              title: CustomText(
                text: widget.userName,
                textAlign: TextAlign.start,
              ),
              subtitle: CustomText(
                text: widget.name,
                textAlign: TextAlign.start,
                fontSize: 12.sp,
                color: AppColors.greyColor,
              ),
              trailing: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    scrollControlDisabledMaxHeightRatio: .20,
                    builder: (context) {
                      return CustomContainer(
                        width: double.infinity,
                        topLeftRadius: 24.r,
                        topRightRadius: 24.r,
                        color: AppColors.bgColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(bottomSheetButton.length, (
                            index,
                          ) {
                            return TextButton(
                              // autofocus: true,
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                overlayColor: AppColors.primaryColor
                                    .withOpacity(0.2),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              onPressed: () {},
                              child: CustomText(
                                text: bottomSheetButton[index],
                                fontSize: 18.sp,
                                // fontName: FontFamily.trajanPro,
                                fontWeight: FontWeight.w700,
                                color: index == 2 ? AppColors.errorColor : null,
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  );
                },
                child: Assets.icons.moreCircleIcon.svg(),
              ),
            ),
            ///<<<<<=====================Post section=====================>>>>

            CustomText(
              text: widget.postTitle,
              textAlign: TextAlign.start,
              fontSize: 12.sp,
            ),
            SizedBox(height: 16.h),
            ///<<<<<===================Post Image=====================>>>>

            ProductImageCarouselSlider(imageUrl: widget.postImage),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///<<<<<================Post React Comment and Save button========================>>>>
                Row(
                  spacing: 8.r,
                  children: [
                    Row(
                      children: List.generate(reactIcon.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: SvgPicture.asset(
                              // height: 20.h,
                              // width: 20.w,
                              reactIcon[index],
                              color: selectedIndex == index
                                  ? AppColors.primaryColor
                                  : null,
                            ),
                          ),
                        );
                      }),
                    ),

                    CustomText(text: widget.likeCount.toString()),
                    SizedBox(width: 8.w),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoutes.commentScreen);
                      },
                        child: Assets.icons.commentIcon.svg()),
                    CustomText(text: widget.commentCount.toString()),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSaveButton = selectedSaveButton == 0 ? 1 : 0;
                    });
                  },
                  child: Assets.icons.saveIcon.svg(
                    color: selectedSaveButton == 1
                        ? AppColors.primaryColor
                        : null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
