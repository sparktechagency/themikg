import 'package:flutter/gestures.dart';
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
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_text.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double _sliderValue = 0.5;

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
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: 'Explore',
          fontSize: 24.sp,
          fontName: FontFamily.trajanPro,
        ),
        automaticallyImplyLeading: false,
        actions: [SizedBox.shrink()],
      ),
      endDrawer: Drawer(
        width: MediaQuery.of(context).size.width * .7,
        backgroundColor: AppColors.bgColor,
        shadowColor: AppColors.greyColor,
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              CustomGlobalAppBar(
                title: 'Filter',
                actions: [SizedBox.shrink()],
                centerTitle: false,
                titleStyle: TextStyle(fontFamily: FontFamily.helvetica),
              ),
              Row(
                children: [
                  SizedBox(width: 16.w),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomContainer(
                        height: 24.h,
                        // color: AppColors.primaryColor,
                        bordersColor: AppColors.primaryColor,
                        width: 24.w,
                        shape: BoxShape.circle,
                      ),
                      CustomContainer(
                        height: 16.h,
                        color: AppColors.primaryColor,
                        // bordersColor: AppColors.primaryColor,
                        width: 16.w,
                        shape: BoxShape.circle,
                      ),
                    ],
                  ),
                  SizedBox(width: 16.w),
                  CustomText(text: 'Age', fontSize: 16.sp),
                ],
              ),
              Semantics(
                value: _sliderValue.toString(),
                onIncrease: () {
                  setState(() {
                    if (_sliderValue < 1) {
                      _sliderValue += 0.1;
                    }
                  });
                },
                onDecrease: () {
                  setState(() {
                    if (_sliderValue > 0) {
                      _sliderValue -= 0.1;
                    }
                  });
                },
                child: Slider(
                  value: _sliderValue,
                  min: 0.0,
                  max: 1.0,
                  divisions: 100,
                  label: _sliderValue.toStringAsFixed(1),
                  onChanged: (double value) {
                    setState(() {
                      if (value <= 0.6) {
                        _sliderValue = value; // Allow values between 0.4 and 0.6
                      } else {
                        _sliderValue = value; // Allow values greater than 0.6 to increase
                      }
                    });
                  },
                ),
              ),
              Text(
                "Value: ${_sliderValue.toStringAsFixed(1)}",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
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
                physics: NeverScrollableScrollPhysics(),
                children: [
                  // _buildTabContent('Universe Content'),
                  UniverseContentScreen(),
                  ProfileContentScreen(),
                  InterestPeopleScreen(),
                  // _buildTabContent('People Content'),
                  PeopleByLocationScreen(),
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
            style: TextStyle(color: AppColors.greyColor, fontSize: 14.sp),
            decoration: InputDecoration(
              prefixIcon: Assets.images.piroscop.image(
                height: 10.h,
                width: 10.w,
              ),

              hintText: _tabController.index == 0
                  ? "Search"
                  : _tabController.index == 1
                  ? 'Search by  User name'
                  : _tabController.index == 2
                  ? "Search by interest"
                  : 'Search by location',
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
        GestureDetector(
          onTap: () {
            _scaffoldKey.currentState?.openEndDrawer();
          },
          child: CustomContainer(
            height: 56.h,
            width: 58.w,
            radiusAll: 16.r,
            color: AppColors.borderColor,
            border: Border.all(color: AppColors.greyColor),
            // borderRadius: BorderRadius.circular(16.r),
            child: Icon(Icons.sort, color: AppColors.greyColor),
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      // enableFeedback: false,
      // physics: NeverScrollableScrollPhysics(),
      // isScrollable: false,
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
    return Center(child: CustomText(text: text));
  }

  final List<Widget> _screens = [
    Center(child: Text('Screen1')),
    Center(child: Text('Screen2')),
    Center(child: Text('Screen3')),
    Center(child: Text('Screen4')),
  ];
}
