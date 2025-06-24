import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:themikg/app/routes/app_routes.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_text.dart';
import 'package:themikg/view/widgets/show_confirmation_message.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  // final List<bool> isTapped = [false, false, false, false, false, false];
  final List<String> listOfContent = [
    "Inappropriate content",
    "Harassment or bullying",
    "Spam or fake account",
    "Impersonation",
    "Spam or fake account",
    "Something else",
  ];
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(
        title: 'Report',
        centerTitle: false,
        titleStyle: TextStyle(
          fontSize: 18.sp,
          fontFamily: FontFamily.helvetica,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            children: [
              CustomText(
                text: "Why are you reporting this user?",
                fontSize: 18.sp,
                fontName: FontFamily.trajanPro,
                textAlign: TextAlign.start,
              ),
              CustomText(
                text:
                    "Help us keep the community safe by telling us what happened.",
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 32.h),
              Column(
                children: List.generate(listOfContent.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: CustomContainer(
                      marginBottom: 16.h,
                      height: 55.h,
                      color: AppColors.filledColor,
                      bordersColor: selectedIndex == index
                          ? AppColors.primaryColor
                          : null,
                      radiusAll: 16.r,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                CustomContainer(
                                  height: 24.h,
                                  // color: AppColors.primaryColor,
                                  bordersColor: selectedIndex == index
                                      ? AppColors.primaryColor
                                      : AppColors.borderColor,
                                  width: 24.w,
                                  shape: BoxShape.circle,
                                ),
                                CustomContainer(
                                  height: 16.h,
                                  color: selectedIndex == index
                                      ? AppColors.primaryColor
                                      : AppColors.borderColor,
                                  // bordersColor: AppColors.primaryColor,
                                  width: 16.w,
                                  shape: BoxShape.circle,
                                ),
                              ],
                            ),
                            SizedBox(width: 16.w),
                            CustomText(
                              text: listOfContent[index],
                              fontSize: 16.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 50.h),
              CustomButton(
                onPressed: () {
                  // if(selectedIndex==index)
                  if (selectedIndex == null) {
                    showSentConfirmation(message: 'Please select one', context: context);
                  } else {
                    Get.toNamed(
                      AppRoutes.reportSubmitScreen,
                      arguments: [listOfContent,selectedIndex],
                    );
                  }
                },
                label: "Next",
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                backgroundColor: selectedIndex !=null?AppColors.primaryColor:AppColors.borderColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
