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
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_text.dart';
import 'package:themikg/view/widgets/text_field_widget.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  RangeValues _ageRangeValue = RangeValues(18, 70);
  RangeValues _sizeRangeValue = RangeValues(36, 50);
  RangeValues _heightRangeValue = RangeValues(155, 175);
  RangeValues _weightRangeValue = RangeValues(50, 80);

  List<bool> isTapped = [false, false, false, false, false, false];

  final List<String> exploreIconList = [
    Assets.icons.universeExploreIcon.path,
    Assets.icons.myProfileIconActive.path,
    Assets.icons.exploreInterestIcon.path,
    Assets.icons.searchPeopleIcon.path,
  ];

  final List<String> tabTitles = ['Universe', 'Profile', 'Interests', 'People'];
  final List<String> situation = [
    'Single',
    'Married',
    'Open',
    'Open relationship',
    'Dating',
  ];
  List<bool> selectedSituation = [false, false, false, false, false];
  final List<String> ethnicityList = [
    'Asiatic',
    'Oceanic',
    'American',
    'European',
    'African',
    'Antarctic',
  ];
  List<bool> selectedEthnicity = [false, false, false, false, false, false];

  void toggleSituation(int index) {
    setState(() {
      selectedSituation[index] = !selectedSituation[index];
    });
  }

  void toggleEthnicity(int index) {
    setState(() {
      selectedEthnicity[index] = !selectedEthnicity[index];
    });
  }

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
                  UniverseContentScreen(),
                  ProfileContentScreen(),
                  InterestPeopleScreen(),
                  PeopleByLocationScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        width: MediaQuery.of(context).size.width * .7,
        backgroundColor: AppColors.bgColor,
        shadowColor: AppColors.greyColor,
        child: SingleChildScrollView(
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

                ///<<<<<<<<<<<<<<==============Age ============================>>>>>>>>>>>>>>>>>>>>>>>>>
                _filtersTitle(0, 'Age'),
                RangeSlider(
                  values: _ageRangeValue,
                  min: 18,
                  max: 70,
                  activeColor: AppColors.primaryColor,
                  inactiveColor: AppColors.borderColor,
                  divisions: 100,
                  onChanged: (RangeValues values) {
                    setState(() {
                      _ageRangeValue = values;
                    });
                  },
                ),
                CustomText(
                  text: _ageRangeValue.end > 69
                      ? 'Between ${_ageRangeValue.start.toStringAsFixed(0)} to 70+ years'
                      : 'Between ${_ageRangeValue.start.toStringAsFixed(0)} to ${_ageRangeValue.end.toStringAsFixed(0)} years',
                  fontSize: 12.sp,
                ),
                SizedBox(height: 8.h),

                ///<<<<<<<<<<<<<<==============Size ============================>>>>>>>>>>>>>>>>>>>>>>>>>
                _filtersTitle(1, 'Size'),
                RangeSlider(
                  values: _sizeRangeValue,
                  min: 36,
                  max: 50,
                  activeColor: AppColors.primaryColor,
                  inactiveColor: AppColors.borderColor,
                  divisions: 100,
                  onChanged: (RangeValues values) {
                    setState(() {
                      _sizeRangeValue = values;
                    });
                  },
                ),
                CustomText(
                  text: _sizeRangeValue.end > 49
                      ? 'Between ${_sizeRangeValue.start.toStringAsFixed(0)} to 50+ '
                      : (_sizeRangeValue.start < 37
                      ? 'Between -36 to ${_sizeRangeValue.end.toStringAsFixed(0)}'
                      : 'Between ${_sizeRangeValue.start.toStringAsFixed(0)} to ${_sizeRangeValue.end.toStringAsFixed(0)}'),
                  fontSize: 12.sp,
                ),
                SizedBox(height: 8.h),

                ///<<<<<<<<<<<<<<==============Height ============================>>>>>>>>>>>>>>>>>>>>>>>>>
                _filtersTitle(2, 'Height'),
                RangeSlider(
                  values: _heightRangeValue,
                  min: 155,
                  max: 175,
                  activeColor: AppColors.primaryColor,
                  inactiveColor: AppColors.borderColor,
                  divisions: 100,
                  onChanged: (RangeValues values) {
                    setState(() {
                      _heightRangeValue = values;
                    });
                  },
                ),
                CustomText(
                  text: _heightRangeValue.end > 174
                      ? 'Between ${_heightRangeValue.start.toStringAsFixed(0)} cm to 175+ cm'
                      : (_heightRangeValue.start < 156
                      ? 'Between -155 cm to ${_heightRangeValue.end.toStringAsFixed(0)} cm'
                      : 'Between ${_heightRangeValue.start.toStringAsFixed(0)} cm to ${_heightRangeValue.end.toStringAsFixed(0)} cm'),
                  fontSize: 12.sp,
                ),
                SizedBox(height: 8.h),

                ///<<<<<<<<<<<<<<==============Weight ============================>>>>>>>>>>>>>>>>>>>>>>>>>
                _filtersTitle(3, 'Weight'),
                RangeSlider(
                  values: _weightRangeValue,
                  min: 50,
                  max: 80,
                  activeColor: AppColors.primaryColor,
                  inactiveColor: AppColors.borderColor,
                  divisions: 100,
                  onChanged: (RangeValues values) {
                    setState(() {
                      _weightRangeValue = values;
                    });
                  },
                ),
                CustomText(
                  text: _weightRangeValue.end > 79
                      ? 'Between ${_weightRangeValue.start.toStringAsFixed(0)}kg to 80 kg '
                      : (_weightRangeValue.start < 51
                      ? 'Between -50 kg to ${_weightRangeValue.end.toStringAsFixed(0)} kg'
                      : 'Between ${_weightRangeValue.start.toStringAsFixed(0)} kg to ${_weightRangeValue.end.toStringAsFixed(0)} kg'),
                  fontSize: 12.sp,
                ),

                ///<<<<<<<<<<<<<<==============Situation ============================>>>>>>>>>>>>>>>>>>>>>>>>>
                SizedBox(height: 8.h),
                _filtersTitle(4, 'Situation'),
                Padding(
                  padding: EdgeInsets.only(left: 40.w),
                  child: ListView.builder(
                    padding: EdgeInsets.all(8),
                    itemCount: situation.length,
                    shrinkWrap: true,
                    // This is important for preventing infinite scrolling in nested ListViews
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => toggleSituation(index),
                        // Toggle the selection state when tapped
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 4.h),
                          child: Row(
                            children: [
                              Icon(
                                selectedSituation[index]
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank_outlined,
                                color: selectedSituation[index]
                                    ? AppColors.primaryColor
                                    : AppColors.borderColor,
                              ),
                              SizedBox(width: 8.w),
                              // Added some space between the icon and text
                              CustomText(
                                text: situation[index],
                                fontSize: 14.sp,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                ///<<<<<<<<<<<<<<==============Ethnicity ============================>>>>>>>>>>>>>>>>>>>>>>>>>
                SizedBox(height: 8.h),
                _filtersTitle(5, 'Ethnicity   '),
                Padding(
                  padding: EdgeInsets.only(left: 40.w),
                  child: ListView.builder(
                    padding: EdgeInsets.all(8),
                    itemCount: ethnicityList.length,
                    shrinkWrap: true,
                    // This is important for preventing infinite scrolling in nested ListViews
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => toggleEthnicity(index),
                        // Toggle the selection state when tapped
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 4.h),
                          child: Row(
                            children: [
                              Icon(
                                selectedEthnicity[index]
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank_outlined,
                                color: selectedEthnicity[index]
                                    ? AppColors.primaryColor
                                    : AppColors.borderColor,
                              ),
                              SizedBox(width: 8.w),
                              // Added some space between the icon and text
                              CustomText(
                                text: ethnicityList[index],
                                fontSize: 14.sp,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 8.h),
                CustomButton(
                  onPressed: () {},
                  label: 'Apply',
                  width: 144.w,
                  height: 33.h,
                  radius: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

  Row _filtersTitle(int index, String title) {
    return Row(
      children: [
        SizedBox(width: 16.w),
        GestureDetector(
          onTap: () {
            setState(() {
              isTapped[index] = !isTapped[index];
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomContainer(
                height: 24.h,
                // color: AppColors.primaryColor,
                bordersColor: isTapped[index]
                    ? AppColors.primaryColor
                    : AppColors.borderColor,
                width: 24.w,
                shape: BoxShape.circle,
              ),
              CustomContainer(
                height: 16.h,
                color: isTapped[index]
                    ? AppColors.primaryColor
                    : AppColors.borderColor,
                // bordersColor: AppColors.primaryColor,
                width: 16.w,
                shape: BoxShape.circle,
              ),
            ],
          ),
        ),
        SizedBox(width: 16.w),
        CustomText(text: title, fontSize: 16.sp),
      ],
    );
  }

  Widget _buildSearchRow() {
    return Row(
      children: [
        Expanded(
          child: TextFieldWidget(
            hintText: _tabController.index == 0
                ? "Search"
                : _tabController.index == 1
                ? 'Search by  User name'
                : _tabController.index == 2
                ? "Search by interest"
                : 'Search by location',
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
            color: AppColors.filledColor,
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
}
