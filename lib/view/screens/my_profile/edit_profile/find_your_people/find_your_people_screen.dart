import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:themikg/app/routes/app_routes.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_text.dart';
import 'package:themikg/view/widgets/profile_item_widget.dart';
import 'package:themikg/view/widgets/text_field_widget.dart';

class FindYourPeopleScreen extends StatefulWidget {
  const FindYourPeopleScreen({super.key});

  @override
  State<FindYourPeopleScreen> createState() => _FindYourPeopleScreenState();
}

class _FindYourPeopleScreenState extends State<FindYourPeopleScreen> {
  List<bool> isSelectedList = List.generate(10, (index) => false);
  List<Map<String, dynamic>> profiles = [
    {
      'imageUrl': 'https://i.pravatar.cc/150?img=1',
      'userName': 'Jane_Co100',
      'fullName': 'Wade Warren',
      'isSelected': false,
    },
    {
      'imageUrl': 'https://i.pravatar.cc/150?img=2',
      'userName': 'John_Doe123',
      'fullName': 'John Doe',
      'isSelected': false,
    },
    {
      'imageUrl': 'https://i.pravatar.cc/150?img=3',
      'userName': 'Sarah_Lee200',
      'fullName': 'Sarah Lee',
      'isSelected': false,
    },
    {
      'imageUrl': 'https://i.pravatar.cc/150?img=4',
      'userName': 'Mike_Johnson45',
      'fullName': 'Mike Johnson',
      'isSelected': false,
    },
    {
      'imageUrl': 'https://i.pravatar.cc/150?img=5',
      'userName': 'Anna_Smith88',
      'fullName': 'Anna Smith',
      'isSelected': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(
        title: 'Find Your People',
        titleStyle: TextStyle(
          fontSize: 18.sp,
          fontFamily: FontFamily.helvetica,
        ),
        centerTitle: false,
        actions: [
          CustomButton(
            onPressed: () {
              Get.offAllNamed(AppRoutes.bottomNavBarScreen);
            },
            label: 'Skip',
            backgroundColor: AppColors.filledColor,
            height: 23.h,
            width: 56.w,
          ),
          SizedBox(width:8,)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            children: [
              CustomText(
                text:
                    'Follow 3 or more creators to start exploring personalized content.',
                fontSize: 12.sp,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 16.h),
              TextFieldWidget(hintText: 'Search'),
              SizedBox(height: 16.h),
              ListView.builder(
                itemCount: profiles.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ProfileItem(
                    imageUrl: profiles[index]['imageUrl'],
                    userName: profiles[index]['userName'],
                    fullName: profiles[index]['fullName'],
                    isSelected: isSelectedList[index],
                    onTap: () {
                      setState(() {
                        isSelectedList[index] = !isSelectedList[index];
                      });
                    },
                  );
                },
              ),
              SizedBox(height: 32.h,),
              CustomButton(
                onPressed: () {
                  Get.offAllNamed(AppRoutes.bottomNavBarScreen);
                },
                label: 'Continue',
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
