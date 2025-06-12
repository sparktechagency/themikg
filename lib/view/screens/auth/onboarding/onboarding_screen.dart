import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:themikg/app/routes/app_routes.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/view/screens/auth/onboarding/model/onboarding_model.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_text.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // late final OnBoardingModel onBoardingData;
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<OnBoardingModel> onboardingDataList = [
    OnBoardingModel(
      title: 'Welcome to the universe',
      subTitle:
          "Create your galaxy with your own orbit (photos and videos), blink (videos) and nebulox (disappearing content), in this universe, it can be you.",
      image: Assets.images.onboardingImage1.image(),
    ),
    OnBoardingModel(
      title: 'Link with other explorers',
      subTitle:
          "With the astro map (GPS) and interest filters you will connect with people like you, in addition to communicating through DM, calls and video calls",
      image: Assets.images.onboardingImage2.image(),
    ),
    OnBoardingModel(
      title: "Monetize Your Galaxy",
      subTitle:
          "Show exclusive content on (Stellar), a section created for space entrepreneurs",
      image: Assets.images.onboardingImage3.image(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingDataList.length,
            onPageChanged: (index){
              setState(() {
                _currentPage=index;
              });
            },
            itemBuilder: (context, index) {
              return Column(children: [onboardingDataList[index].image]);
            },
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: 336.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(offset: Offset(0, -1),color: Colors.grey.withOpacity(.5),spreadRadius: .5,blurRadius: 6)
                  ],
                  gradient: LinearGradient(
                    colors: [Color(0xff282828), Color(0xFF0E0E0E)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustomContainer(
                        height: 5.h,
                        width: 50.w,
                        color: Colors.black,
                        topLeftRadius: 8.r,
                        topRightRadius: 8.r,
                        bottomRight: 8.r,
                        bottomLeft: 8.r,
                      ),
                      SizedBox(height: 24.h),
                      GestureDetector(
                        onHorizontalDragEnd: (details) {
                          // Check swipe direction (negative velocity = left swipe)
                          if (details.primaryVelocity! < 0) {
                            // Swiped left - go to next page
                            if (_currentPage < onboardingDataList.length - 1) {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeOut,
                              );
                            }
                          } else if (details.primaryVelocity! > 0) {
                            // Swiped right - go to previous page
                            if (_currentPage > 0) {
                              _pageController.previousPage(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeOut,
                              );
                            }
                          }
                        },
                        child: Column(
                          children: [
                            CustomText(
                              text: onboardingDataList[_currentPage].title,
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              fontName: FontFamily.trajanPro,
                            ),
                            SizedBox(height: 10.h),
                            CustomText(text: onboardingDataList[_currentPage].subTitle),
                          ],
                        ),
                      ),
                      SizedBox(height: 24,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 4,
                        children:List.generate(onboardingDataList.length, (index)=>CustomContainer(

                          height: 6.h,
                          width:_currentPage==index?34.w: 8.w,
                          color:_currentPage==index? Colors.white:Colors.grey,
                          bottomLeft: 8.r,
                          bottomRight: 8.r,
                          topRightRadius: 8.r,
                          topLeftRadius: 8.r,
                        )),
                      ),
                      SizedBox(height: 22.h),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomContainer(
                            height: 70.h,
                            width: 70.w,
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(_currentPage<onboardingDataList.length-1){
                                _pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.easeIn);
                              }
                              else{
                                Get.offAllNamed(AppRoutes.signUpScreenScreen);
                              }
                            },
                            child: CustomContainer(
                              height: 46.h,
                              width: 46.w,
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor,
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
