import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/view/widgets/custom_text.dart';

class TitleWithSubTItleWidget extends StatelessWidget {
  const TitleWithSubTItleWidget({
    super.key, required this.title, required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 36.h),
        CustomText(
          text: title,
          fontSize: 20,
          fontName: FontFamily.trajanPro,
        ),
        SizedBox(height: 8.h,),
        CustomText(
          text: subTitle,
          color: Color(0xffBABABA),
        ),
      ],
    );
  }
}