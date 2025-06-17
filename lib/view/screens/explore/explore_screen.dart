import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/view/screens/explore/interest_people/interest_people_screen.dart';
import 'package:themikg/view/screens/explore/people_by_location/people_by_location_screen.dart';
import 'package:themikg/view/screens/explore/profile_content/profile_content_screen.dart';
import 'package:themikg/view/screens/explore/universe_content/universe_content_screen.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_text.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> exploreIconList = [
    Assets.icons.universeExploreIcon.path,
    Assets.icons.myProfileIconActive.path,
    Assets.icons.exploreInterestIcon.path,
    Assets.icons.searchPeopleIcon.path,
  ];

  final List<String> tabTitles = ['Universe', 'Profile', 'Interests', 'People'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: exploreIconList.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Explore',
          fontSize: 24.sp,
          fontName: FontFamily.trajanPro,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          children: [
            _buildSearchRow(),
            SizedBox(height: 16.h),
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // _buildTabContent('Universe Content'),
                  UniverseContentScreen(),
                  ProfileContentScreen(),
                  InterestPeopleScreen(),
                  // _buildTabContent('People Content'),
                  PeopleByLocationScreen()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchRow() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            style: TextStyle(color: AppColors.greyColor),
            decoration: InputDecoration(
              prefixIcon: SvgPicture.asset(
                Assets.icons.searchIcon.path,
                color: AppColors.greyColor,
                height: 24.h,
                width: 24.w,
              ),
              hintText: "Search",
              hintStyle: TextStyle(color: AppColors.greyColor),
              filled: true,
              fillColor: AppColors.borderColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(color: AppColors.greyColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(color: AppColors.greyColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(color: AppColors.greyColor),
              ),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        CustomContainer(
          height: 60.h,
          width: 58.w,
          color: AppColors.borderColor,
          border: Border.all(color: AppColors.greyColor),
          // borderRadius: BorderRadius.circular(16.r),
          child: Icon(Icons.sort, color: AppColors.greyColor),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      onTap: (index) {
        setState(() {
          _tabController.index = index;
        });
      },

      controller: _tabController,
      labelColor: AppColors.primaryColor,
      unselectedLabelColor: AppColors.greyColor,
      indicatorColor: AppColors.primaryColor,
      indicatorWeight: 5,
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: List.generate(exploreIconList.length, (index) {
        return Tab(
          icon: SvgPicture.asset(
            exploreIconList[index],
            height: 24.h,
            width: 24.w,
            color: _tabController.index == index
                ? AppColors.primaryColor
                : AppColors.greyColor,
          ),
          // text: tabTitles[index],
        );
      }),
    );
  }

  Widget _buildTabContent(String text) {
    return Center(child: CustomText(text: text ));
  }

  final List<Widget> _screens = [
    Center(child: Text('Screen1')),
    Center(child: Text('Screen2')),
    Center(child: Text('Screen3')),
    Center(child: Text('Screen4')),
  ];
}
