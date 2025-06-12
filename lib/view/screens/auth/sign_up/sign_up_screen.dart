import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_text.dart';
import 'package:themikg/view/widgets/custom_text_field.dart';
import 'package:themikg/view/widgets/title_with_subtitle_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 71.h),
                Assets.images.appLogo.image(height: 98.h, width: 98.w),
                TitleWithSubTItleWidget(
                  title: "Hey ! Explore New Galaxies",
                  subTitle: 'A whole universe awaits.',
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _nameTEController,
                  filColor: AppColors.secondaryColor,
                  hintText: 'Explorer name',
                  prefixIcon: Assets.icons.nameIcon.svg(),
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _nameTEController,
                  filColor: AppColors.secondaryColor,
                  hintText: 'E-mail',
                  prefixIcon: Assets.icons.emailIcon.svg(),
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _nameTEController,
                  filColor: AppColors.secondaryColor,
                  hintText: 'Boarding code',
                  prefixIcon: Assets.icons.passwordIcon.svg(),
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _nameTEController,
                  filColor: AppColors.secondaryColor,
                  hintText: 'Confirm boarding code',
                  prefixIcon: Assets.icons.passwordIcon.svg(),
                ),
                SizedBox(height: 85.h),
                CustomButton(onPressed: (){},label: 'Sign Up',fontWeight: FontWeight.w700,fontSize: 20.sp,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
