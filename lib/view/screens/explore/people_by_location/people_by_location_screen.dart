import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/view/widgets/title_with_subtitle_widget.dart';

class PeopleByLocationScreen extends StatefulWidget {
  const PeopleByLocationScreen({super.key});

  @override
  State<PeopleByLocationScreen> createState() => _PeopleByLocationScreenState();
}

class _PeopleByLocationScreenState extends State<PeopleByLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Assets.images.searchByLocationImage.image(height: 250.h,width: 250.w,color: AppColors.greyColor,fit: BoxFit.cover),
            SizedBox(height: 16.h),
            TitleWithSubTItleWidget(
              title: 'Explore the universe and find other explorers',
              subTitle:
                  "Connect to GPS satellites GALILEO, NAVSTAR, GLONASS, BeiDou, IRNSS and QZSS, but without revealing your exact location",
            ),
          ],
        ),
      ),
    );
  }
}
