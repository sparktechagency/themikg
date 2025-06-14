import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/view/screens/home/home_screen.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_text.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    Center(child: CustomText(text: 'Explore Page')),
    Center(child: CustomText(text: 'Add Page')),
    Center(child: CustomText(text: 'Message Page')),
    Center(child: CustomText(text: 'Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: SafeArea(
        child: CustomContainer(
          height: 99.h,
          color: AppColors.greyColor,
          topLeftRadius: 20.sp,
          topRightRadius: 20.sp,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(_navItems.length, (index) {
              bool isSelected = _selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: SvgPicture.asset(
                  isSelected
                      ? _navItems[index]['activeIcon']
                      : _navItems[index]['icon'],
                  height: 30.h,
                  width: 30.w,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> _navItems = [
    {
      'icon': Assets.icons.homeIcon.path,
      'activeIcon': Assets.icons.homeIconActive.path,
    },
    {
      'icon': Assets.icons.exploreIcon.path,
      'activeIcon': Assets.icons.exploreIconActive.path,
    },
    {
      'icon': Assets.icons.addIcon.path,
      'activeIcon': Assets.icons.addIcon.path,
    },
    {
      'icon': Assets.icons.inboxMessageIcon.path,
      'activeIcon': Assets.icons.messageIconActive.path,
    },
    {
      'icon': Assets.icons.myProfileIcon.path,
      'activeIcon': Assets.icons.myProfileIconActive.path,
    },
  ];
}
