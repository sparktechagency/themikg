import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:themikg/app/routes/app_routes.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_text.dart';
import 'package:themikg/view/widgets/custom_text_field.dart';
import 'package:themikg/view/widgets/title_with_subtitle_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 71.h),
                  Assets.images.appLogo.image(height: 98.h, width: 98.w),
                  TitleWithSubTItleWidget(
                    title: "Return to Your Universe",
                    subTitle: 'Welcome back, explorer. Your journey continues.',
                  ),
                  SizedBox(height: 80.h),
                  CustomTextField(
                    controller: _emailTEController,
                    filColor: AppColors.secondaryColor,
                    hintText: 'E-mail',
                    isEmail: true,
                    prefixIcon: Assets.icons.emailIcon.svg(),
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    controller: _passwordTEController,
                    filColor: AppColors.secondaryColor,
                    hintText: 'Boarding code',
                    isPassword: true,
                    isObscureText: true,
                    prefixIcon: Assets.icons.passwordIcon.svg(),
                  ),
                  // SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.forgetPasswordEmailScreen);
                        },
                        child: CustomText(text: 'Forgot Password',
                          color: AppColors.greyColor,
                          textAlign: TextAlign.end,),

                      ),
                    ],
                  ),
                  SizedBox(height: 148.h),
                  CustomButton(
                    onPressed: _onTapSignInButton,
                    label: 'Sign Up',
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                  ),
                  SizedBox(height: 24.h),
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account?  ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Helvetica',
                      ),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                            fontFamily: 'Helvetica',
                          ),
                          recognizer:
                              TapGestureRecognizer()..onTap = _onTapSignUpButton,
                        ),
                      ],
                    ),
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
    if (_formKey.currentState!.validate()) {}
  }

  void _onTapSignUpButton() {
    Get.offNamed(AppRoutes.signUpScreen);
  }
}
