import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:themikg/app/routes/app_routes.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/view/widgets/custom_bottom_sheet.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_text.dart';
import 'package:themikg/view/widgets/profile_details_widget.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen>
    with SingleTickerProviderStateMixin {
  final List<String> interestList = ['Travelling', 'Movie', 'Game'];
  TabController? _tabController;
  final List<Map<String, dynamic>> profileIconList = [
    {'icon': Assets.icons.orbitIcon.path, 'name': "Orbit"},
    {'icon': Assets.icons.blinkIcon.path, 'name': 'Blink'},
    {'icon': Assets.icons.stellaIcon.path, 'name': 'Stellar'},
  ];
  final List<Map<String, dynamic>> bottomSheetButton = [
    {'icon': Icon(Icons.settings), 'name': 'Settings'},
    {'icon': Assets.icons.saveIcon.svg(), 'name': 'Vault'},
    {'icon': Icon(Icons.logout_rounded), 'name': 'Log Out'},
  ];

  @override
  void initState() {
    super.initState();
    // Initialize the TabController with the length of your tab list
    _tabController = TabController(length: profileIconList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'shofiq_190', fontSize: 20.sp),
        actions: [
          Icon(Icons.wallet_outlined, color: Colors.white, size: 35.h),
          SizedBox(width: 40.w),
          GestureDetector(
            onTap: () {
              customBottomSheet(
                context: context,
                buttons: ['Settings', 'Vault', 'Log Out'],
                onPressedCallbacks: [
                  () {
                    Get.toNamed(AppRoutes.settingsScreen);
                  },
                  () {},
                  () {},
                ],
                prefixIcons: [
                  Icon(Icons.settings, color: Colors.white),
                  Assets.icons.saveIcon.svg(),
                  Icon(Icons.logout_rounded, color: Colors.white),
                ],
              );
            },
            child: Assets.icons.moreCircleIcon.svg(height: 30.h, width: 30.w),
          ),
          SizedBox(width: 16.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          children: [
            ProfileDetailsWidget(
              interestList: interestList,
              isEditIconShowing: true,
              profileImage: 'https://i.pravatar.cc/150?img=31',
              name: 'Rakibul Islam Khan',
              userName: 'rk_190',
              location: 'Banasree, Dhaka, Bangladesh',
              size: '38',
              bio:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
            ),
            SizedBox(height: 18.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileFollowerCount(count: 134, countName: 'Likes'),
                DividerWidget(),
                ProfileFollowerCount(count: 435, countName: 'Linked by'),
                DividerWidget(),
                ProfileFollowerCount(count: 121, countName: 'Linked'),
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
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Center(child: CustomText(text: 'orbit')),
                  Center(child: CustomText(text: 'Blink')),
                  Center(child: CustomText(text: 'Stellar')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(height: 46.h, width: 2.w, color: Colors.white);
  }
}

class ProfileFollowerCount extends StatelessWidget {
  const ProfileFollowerCount({
    super.key,
    required this.count,
    required this.countName,
  });

  final int count;
  final String countName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: count.toString(),
          fontSize: 18.sp,
          fontName: FontFamily.trajanPro,
        ),
        CustomText(
          text: countName,
          color: AppColors.borderColor,
          fontSize: 16.sp,
        ),
      ],
    );
  }
}
