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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _reTypePasswordTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _agreeButton = false;

  @override
  void dispose() {
    _nameTEController.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _reTypePasswordTEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.r),
            child: Center(
              child: Form(
                key: _formKey,
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
                      textInputAction: TextInputAction.next,
                      prefixIcon: Assets.icons.nameFieldIcon.svg(),
                    ),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      controller: _emailTEController,
                      filColor: AppColors.secondaryColor,
                      hintText: 'E-mail',
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      isEmail: true,
                      prefixIcon: Assets.icons.emailIcon.svg(),
                    ),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      controller: _passwordTEController,
                      filColor: AppColors.secondaryColor,
                      hintText: 'Boarding code',
                      textInputAction: TextInputAction.next,
                      isPassword: true,
                      isObscureText: true,
                      prefixIcon: Assets.icons.passwordIcon.svg(),
                    ),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      controller: _reTypePasswordTEController,
                      filColor: AppColors.secondaryColor,
                      isPassword: true,
                      isObscureText: true,
                      hintText: 'Confirm boarding code',
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value != _passwordTEController.text) {
                          return "Password do not match";
                        }
                        return null;
                      },
                      prefixIcon: Assets.icons.passwordIcon.svg(),
                    ),
                    SizedBox(height: 24.h),
                    _checkBoxForTermsAndConditions(),
                    SizedBox(height: 85.h),
                    CustomButton(
                      onPressed: _onTapSignUpButton,
                      label: 'Sign Up',
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                    ),
                    SizedBox(height: 24.h),
                    RichText(
                      text: TextSpan(
                        text: "Already have an account?  ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Helvetica',
                        ),
                        children: [
                          TextSpan(
                            text: "Sign In",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                              fontFamily: 'Helvetica',
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = _onTapSignInButton,
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
      ),
    );
  }

  void _onTapSignInButton() {
    Get.toNamed(AppRoutes.signInScreen);
  }

  Widget _checkBoxForTermsAndConditions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _agreeButton = !_agreeButton;
            });
          },
          child:
              _agreeButton
                  ? Icon(Icons.check_box, color: AppColors.borderColor)
                  : Icon(
                    Icons.check_box_outline_blank_outlined,
                    color: AppColors.borderColor,
                  ),
        ),
        SizedBox(width: 16.h),
        CustomText(
          text: 'I accept the',
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
          color: Colors.grey,
        ),
        SizedBox(width: 8.h),
        GestureDetector(
          onTap: () {
            // Get.toNamed(AppRoutes.termsOfServiceScreen);
          },
          child: CustomText(
            text: 'Terms & Condition',
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
            decoration: TextDecoration.underline,
          ),
        ),
        CustomText(
          text: ' & ',
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
          color: Colors.grey,
        ),

        GestureDetector(
          onTap: () {
            // Get.toNamed(AppRoutes.termsOfServiceScreen);
          },
          child: CustomText(
            text: 'Privacy Policy',
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }

  void _onTapSignUpButton() {
    if (_formKey.currentState!.validate()) {
      if (_agreeButton == true) {
        Get.offAllNamed(AppRoutes.editProfileScreen);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please agree to the Terms & Condition to continue'),
            backgroundColor: Colors.red,
          ),
        );
      }

    }
  }
}
