import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_text.dart';
import 'package:themikg/view/widgets/custom_text_field.dart';
import 'package:themikg/view/widgets/title_with_subtitle_widget.dart';

class SubmitReportScreen extends StatefulWidget {
  const SubmitReportScreen({super.key});

  @override
  State<SubmitReportScreen> createState() => _SubmitReportScreenState();
}

class _SubmitReportScreenState extends State<SubmitReportScreen> {
  final TextEditingController _controller = TextEditingController();
  late List<String> listOfReport;
  int selectedIndex = 0;

  @override
  void initState() {
    final arguments = Get.arguments;
    listOfReport = arguments[0];
    selectedIndex = arguments[1] ?? 0;
    super.initState();
  }

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
      body: SafeArea(
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
              CustomContainer(
                marginBottom: 16.h,
                height: 55.h,
                color: AppColors.filledColor,
                bordersColor: AppColors.primaryColor,
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
                            bordersColor: AppColors.primaryColor,
                            width: 24.w,
                            shape: BoxShape.circle,
                          ),
                          CustomContainer(
                            height: 16.h,
                            color: AppColors.primaryColor,
                            // bordersColor: AppColors.primaryColor,
                            width: 16.w,
                            shape: BoxShape.circle,
                          ),
                        ],
                      ),
                      SizedBox(width: 16.w),
                      CustomText(
                        text: listOfReport[selectedIndex],
                        fontSize: 16.sp,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              CustomTextField(
                controller: _controller,
                title: 'Describe the issue',
                hintText: 'Type your message...',
                hintextColor: AppColors.greyColor,
                maxLine: 5,
              ),
              Spacer(),
              CustomButton(
                onPressed: () {},
                label: "Next",
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                backgroundColor: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
