import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:themikg/app/routes/app_routes.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_dialog.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_text.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final List<Map<String, dynamic>> iconList = [
    {'icon': Assets.icons.changePasswordIcon.path, 'name': "Change Password"},
    {
      'icon': Assets.icons.termsAndConditionIcon.path,
      'name': 'Terms & Conditions',
    },
    {'icon': Assets.icons.privacyIcon.path, 'name': 'Privacy Policy'},
    {'icon': Assets.icons.aboutUsIcon.path, 'name': 'About Us'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(
        title: 'Settings',
        titleStyle: TextStyle(
          fontFamily: FontFamily.helvetica,
          fontSize: 18.sp,
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            children: [
              Column(
                children: List.generate(iconList.length, (index) {
                  return CustomContainer(
                    onTap: () {
                      if (index == 0) {
                        Get.toNamed(AppRoutes.changePasswordScreen);
                      } else if (index == 1) {
                        Get.toNamed(AppRoutes.termsConditionScreen);
                      } else if (index == 2) {
                        Get.toNamed(AppRoutes.privacyPolicyScreen);
                      } else if (index == 3) {
                        Get.toNamed(AppRoutes.aboutUsScreen);
                      }
                    },
                    marginBottom: 24.h,
                    paddingLeft: 8.w,
                    height: 55.h,
                    width: double.infinity,
                    color: AppColors.postCardColor,
                    radiusAll: 8.r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 16,
                          children: [
                            // SizedBox(width: 4.w,),
                            SvgPicture.asset(iconList[index]['icon']),
                            CustomText(
                              text: iconList[index]['name'],
                              fontSize: 16.sp,
                            ),
                          ],
                        ),
                        Icon(Icons.arrow_right, color: Colors.white),
                      ],
                    ),
                  );
                }),
              ),
              Spacer(),
              CustomButton(
                backgroundColor: Colors.transparent,
                onPressed: () {
                  customPopUpWidget(
                    context: context,
                    title: "Delete Account",
                    subtitle: "Do you want to delete your account?",
                    firstButton: "Cancel",
                    lastButton: 'Delete',
                    onPressedFirstButton: (){},
                    onPressedLastButton: (){
                      Get.offAllNamed(AppRoutes.signUpScreen);
                    },
                  );
                },
                prefixIcon: Icon(
                  CupertinoIcons.delete_solid,
                  color: AppColors.errorColor,
                ),
                label: 'Delete Account',
                fontSize: 16.sp,
                foregroundColor: AppColors.errorColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
