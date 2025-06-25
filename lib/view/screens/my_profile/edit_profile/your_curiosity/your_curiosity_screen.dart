import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:themikg/app/routes/app_routes.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_text.dart';
import 'package:themikg/view/widgets/show_confirmation_message.dart';
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
    "Cars",
  ];

  // List to keep track of selected items
  List<String> selectedItems = [];

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleWithSubTItleWidget(
                  title: " What Sparks Your Curiosity?",
                  subTitle:
                      "Pick up to 5 interests to personalize your feed and discover content you love.",
                ),
                SizedBox(height: 24.h),
                CustomText(text: 'You might like...', fontSize: 12.sp),
                SizedBox(height: 24.h),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(listOfCuriosity.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        if (!selectedItems.contains(listOfCuriosity[index]) &&
                            selectedItems.length < 5) {
                          setState(() {
                            selectedItems.add(listOfCuriosity[index]);
                          });
                        }
                        // If the item is already selected, allow deselection
                        else if (selectedItems.contains(
                          listOfCuriosity[index],
                        )) {
                          setState(() {
                            selectedItems.remove(listOfCuriosity[index]);
                          });
                        }
                        else {
                          showSentConfirmation(message: "You can't select more the 5 items", context: context);
                        }
                      },
                      child: CustomContainer(
                        alignment: Alignment.center,
                        height: 36.h,
                        width: 104.w,
                        color: AppColors.filledColor,
                        // Default color
                        bordersColor:
                            selectedItems.contains(listOfCuriosity[index])
                            ? AppColors
                                  .primaryColor // Selected color
                            : AppColors.borderColor,
                        radiusAll: 8.r,
                        child: CustomText(
                          text: listOfCuriosity[index],
                          color: selectedItems.contains(listOfCuriosity[index])
                              ? AppColors.primaryColor
                              : null,
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 32.h,),
                CustomButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.findYourPeopleScreen);
                  },
                  label: 'Continue',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
