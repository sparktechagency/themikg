import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/view/screens/explore/universe_content/blink/blink_screen.dart';
import 'package:themikg/view/screens/explore/universe_content/orbit/orbit_screen.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_text.dart';

class UniverseContentScreen extends StatefulWidget {
  const UniverseContentScreen({super.key});

  @override
  State<UniverseContentScreen> createState() => _UniverseContentScreenState();
}

class _UniverseContentScreenState extends State<UniverseContentScreen> {
  final List<Map<String, dynamic>> button = [
    {'buttonName': 'Orbit', 'Icon': Assets.icons.orbitIcon.path},
    {'buttonName': 'Blink', 'Icon': Assets.icons.blinkIcon.path},
  ];

  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(2, (index) {
              return CustomButton(
                onPressed: () {
                  setState(() {
                    isSelected = isSelected == index ? -1 : index;
                  });
                },
                backgroundColor: isSelected == index
                    ? AppColors.primaryColor
                    : Colors.transparent,
                bordersColor: isSelected == index
                    ? null
                    : AppColors.primaryColor,
                prefixIcon: SvgPicture.asset(
                  button[index]['Icon'],
                  color: isSelected == index
                      ? Colors.white
                      : AppColors.primaryColor,
                ),
                label: button[index]['buttonName'],
                foregroundColor: isSelected == index
                    ? Colors.white
                    : AppColors.primaryColor,
                height: 40.h,
                radius: 10.r,
                width: 169.w,
              );
            }),
          ),
          SizedBox(height: 16.h,),
          isSelected==0?OrbitScreen():BlinkScreen()
        ],
      ),
    );
  }
}
