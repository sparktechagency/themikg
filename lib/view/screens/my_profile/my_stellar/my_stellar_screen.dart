import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_text.dart';
import 'package:themikg/view/widgets/text_field_widget.dart';

class MyStellarScreen extends StatefulWidget {
  const MyStellarScreen({super.key});

  @override
  State<MyStellarScreen> createState() => _MyStellarScreenState();
}

class _MyStellarScreenState extends State<MyStellarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(height: 16.h),
                CustomText(
                  text: 'Welcome to Stellar',
                  fontSize: 18.sp,
                  fontName: FontFamily.trajanPro,
                ),
                SizedBox(height: 16.h),
                CustomText(
                  text:
                      "Start earning from your exclusive content.  Set a price for your Stellar posts so your top fans can unlock and support you.",
                  fontSize: 12.sp,
                ),
                SizedBox(height: 16.h),
                CustomContainer(
                  width: 253.w,
                  child: TextFieldWidget(
                    hintText: 'Set Unlock Price',
                    keyboardType: TextInputType.number,
                    isPrefixShowing: false,
                  ),
                ),
                SizedBox(height: 16.h),
                CustomButton(
                  onPressed: () {},
                  label: "Active Stellar",
                  fontSize: 20.sp,
                  fontName: FontFamily.helvetica,
                  fontWeight: FontWeight.w700,
                  width: 253.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
