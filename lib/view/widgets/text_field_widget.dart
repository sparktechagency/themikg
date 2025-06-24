import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.isPrefixShowing = true,
    this.suffixIcon,
    this.maxLine,
    this.controller,
    this.textInputAction,
    this.hintFontSize,
    this.keyboardType,
  });

  final String hintText;
  final bool isPrefixShowing;
  final Widget? suffixIcon;
  final int? maxLine;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final double? hintFontSize;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: textInputAction,
      cursorColor: AppColors.primaryColor,
      keyboardType: keyboardType,
      minLines: 1,
      maxLines: maxLine,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
        decoration: TextDecoration.none,
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: isPrefixShowing
            ? Assets.images.piroscop.image(height: 10.h, width: 10.w)
            : null,

        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.greyColor,
          fontSize: hintFontSize,
        ),
        filled: true,
        fillColor: AppColors.filledColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: AppColors.greyColor.withOpacity(.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: AppColors.greyColor.withOpacity(.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: AppColors.greyColor.withOpacity(.5)),
        ),
      ),
    );
  }
}
