import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_text.dart';
import 'package:themikg/view/widgets/title_with_subtitle_widget.dart';

class YourCuriosityScreen extends StatefulWidget {
  const YourCuriosityScreen({super.key});

  @override
  State<YourCuriosityScreen> createState() => _YourCuriosityScreenState();
}

class _YourCuriosityScreenState extends State<YourCuriosityScreen> {
  final List<String> listOfCuriosity = [
    'Traveling',
    'Movie',
    "Sports",
    "Fishing",
    'Cycling',
    'Reading',
    "Yoga",
    "Dancing",
    "Singing",
    "Reading",
    'Driving',
    "Golf",
    "Drinks",
    "Hockey",
    "Chess",
    "Boxing",
    "Tennis",
    'Drawing',
    "Karaoke",
    "Circus",
    'Boat',
    'Cats',
    "Climbing",
    "Cars"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(
        title: 'Mission Brief',
        titleStyle: TextStyle(
          fontSize: 18.sp,
          fontFamily: FontFamily.helvetica,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWithSubTItleWidget(
              title: " What Sparks Your Curiosity?",
              subTitle:
                  "Pick up to 5 interests to personalize your feed and discover content you love.",
            ),
            SizedBox(height: 24.h,),
            CustomText(text: 'You might like...', fontSize: 12.sp),
            SizedBox(height: 24.h,),
            CustomContainer(
              alignment: Alignment.center,
              height: 36.h,
              width: 104.w,
              color: AppColors.filledColor,
              bordersColor: AppColors.borderColor,
              radiusAll: 16.r,
              child: CustomText(text: 'Movie'),
            )
          ],
        ),
      ),
    );
  }
}
