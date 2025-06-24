import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:themikg/app/routes/app_routes.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/view/screens/my_profile/my_blink/my_blink_screen.dart';
import 'package:themikg/view/screens/my_profile/my_orbit/my_orbit_screen.dart';
import 'package:themikg/view/screens/my_profile/my_profile_screen.dart';
import 'package:themikg/view/screens/my_profile/my_stellar/my_stellar_screen.dart';
import 'package:themikg/view/screens/user_profile/user_stellar/user_stellar_screen.dart';
import 'package:themikg/view/widgets/custom_bottom_sheet.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_dialog.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_text.dart';
import 'package:themikg/view/widgets/profile_details_widget.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final List<String> interestList = ['Sleeping', 'Cycling', 'Reading'];
  bool isLinked = false;
  final List<Map<String, dynamic>> profileIconList = [
    {'icon': Assets.icons.orbitIcon.path, 'name': "Orbit"},
    {'icon': Assets.icons.blinkIcon.path, 'name': 'Blink'},
    {'icon': Assets.icons.stellaIcon.path, 'name': 'Stellar'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: profileIconList.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(
        title: 'julila_ad23',
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: () {
              customBottomSheet(
                context: context,
                buttons: [
                  "Copy Profile URL",
                  "Share this Profile",
                  "Block",
                  'Report',
                ],
                prefixIcons: [
                  Icon(Icons.copy, color: Colors.white),
                  Icon(Icons.rocket, color: Colors.white),
                  Icon(Icons.block, color: AppColors.errorColor),
                  Icon(
                    Icons.warning_amber_outlined,
                    color: AppColors.errorColor,
                  ),
                ],
                onPressedCallbacks: [
                  () {},
                  () {},
                  () {
                    customPopUpWidget(
                      context: context,
                      title: 'Block',
                      subtitle: "Are you sure you want to block this user?",
                      firstButton: 'Cancel',
                      lastButton: 'Block',
                    );
                  },
                  () {
                    Get.toNamed(AppRoutes.reportScreen);
                  },
                ],
                // buttonColor: Colors.white,
                buttonColors: [
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  AppColors.errorColor,
                ],
              );
            },
            child: Assets.icons.moreCircleIcon.svg(height: 30.h, width: 30.w),
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          children: [
            ProfileDetailsWidget(
              interestList: interestList,
              isEditIconShowing: true,
              onTapEdit: () {
                Get.toNamed(AppRoutes.editProfileScreen);
              },
              profileImage: 'https://i.pravatar.cc/150?img=29',
              name: 'Julian Marker',
              userName: 'julila_ad23',
              location: 'New jersey, New York, USA',
              size: '40',
              bio:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
            ),
            SizedBox(height: 18.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileFollowerCount(count: 432, countName: 'Likes'),
                DividerWidget(),
                ProfileFollowerCount(count: 1002, countName: 'Linked by'),
                DividerWidget(),
                ProfileFollowerCount(count: 3438, countName: 'Linked'),
              ],
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  onPressed: () {
                    setState(() {
                      isLinked = !isLinked;
                    });
                  },
                  label: isLinked ? "Linked" : 'Link',
                  height: 38.h,
                  width: 132.w,
                  radius: 16.r,
                  prefixIcon: Icon(
                    Icons.person_add_alt_1_rounded,
                    color: Colors.white,
                    size: 20.h,
                  ),
                  fontSize: 16.sp,
                ),
                CustomButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.inboxMessageScreen);
                  },
                  label: 'Message',
                  height: 38.h,
                  width: 132.w,
                  foregroundColor: AppColors.primaryColor,
                  radius: 16.r,

                  backgroundColor: Colors.transparent,
                  bordersColor: AppColors.primaryColor,
                  prefixIcon: Icon(
                    CupertinoIcons.chat_bubble_text,
                    color: AppColors.primaryColor,
                    size: 20.h,
                  ),
                  fontSize: 16.sp,
                ),
              ],
            ),

            TabBar(
              // enableFeedback: false,
              // physics: NeverScrollableScrollPhysics(),
              // isScrollable: false,
              onTap: (index) {
                setState(() {
                  _tabController?.index = index;
                });
              },

              controller: _tabController,
              labelColor: AppColors.primaryColor,
              unselectedLabelColor: AppColors.greyColor,
              indicatorColor: AppColors.primaryColor,
              indicatorWeight: 5,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: List.generate(profileIconList.length, (index) {
                return Tab(
                  icon: Row(
                    children: [
                      SvgPicture.asset(
                        profileIconList[index]['icon'],
                        height: 24.h,
                        width: 24.w,
                        color: _tabController?.index == index
                            ? AppColors.primaryColor
                            : AppColors.greyColor,
                      ),
                      SizedBox(width: 8.w),
                      CustomText(
                        text: profileIconList[index]['name'],
                        color: _tabController?.index == index
                            ? AppColors.primaryColor
                            : AppColors.greyColor,
                      ),
                    ],
                  ),
                );
              }),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  MyOrbitScreen(),
                  MyBlinkScreen(),
                  UserStellarScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
