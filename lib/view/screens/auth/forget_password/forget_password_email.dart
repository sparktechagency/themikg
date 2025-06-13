import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:themikg/app/routes/app_routes.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_text.dart';
import 'package:themikg/view/widgets/custom_text_field.dart';
import 'package:themikg/view/widgets/title_with_subtitle_widget.dart';

class ForgetPasswordEmail extends StatefulWidget {
  const ForgetPasswordEmail({super.key});

  @override
  State<ForgetPasswordEmail> createState() => _ForgetPasswordEmailState();
}

class _ForgetPasswordEmailState extends State<ForgetPasswordEmail> {
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // SizedBox(height: 71.h),
                  Assets.images.appLogo.image(height: 98.h, width: 98.w),
                  TitleWithSubTItleWidget(
                    title: "Are you lost boarding code?",
                    subTitle: 'Don’t worry, we’ll guide you back. Enter your email to reset your password and return to your universe.',
                  ),
                  SizedBox(height: 80.h),
                  CustomTextField(
                    controller: _emailTEController,
                    filColor: AppColors.secondaryColor,
                    hintText: 'E-mail',
                    keyboardType: TextInputType.emailAddress,
                    isEmail: true,
                    prefixIcon: Assets.icons.emailIcon.svg(),
                  ),
                  SizedBox(height: 148.h),
                  CustomButton(
                    onPressed: _onTapSignInButton,
                    label: 'Get Verification Code',
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    if (_formKey.currentState!.validate()) {
      Get.toNamed(AppRoutes.forgetPasswordOtpScreen);
    }
  }

  void _onTapSignUpButton() {
    Get.offNamed(AppRoutes.signUpScreen);
  }
}
