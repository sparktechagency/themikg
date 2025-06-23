import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_network_image.dart';
import 'package:themikg/view/widgets/custom_pop_up_menu.dart';
import 'package:themikg/view/widgets/custom_text.dart';
import 'package:themikg/view/widgets/custom_text_field.dart';
import 'package:themikg/view/widgets/text_field_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _dateOfBirthTEController =
      TextEditingController();
  final TextEditingController _sizeTEController = TextEditingController();
  final TextEditingController _heightTEController = TextEditingController();
  final TextEditingController _weightTEController = TextEditingController();
  final TextEditingController _locationTEController = TextEditingController();
  final TextEditingController _ethnicityTEController = TextEditingController();
  final TextEditingController _situationTEController = TextEditingController();
  final TextEditingController _roleTEController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final List<Map<String, dynamic>> whoCanSeeButtons = [
    {'name': 'Everyone', 'icon': CupertinoIcons.globe},
    {'name': 'Co-linked', 'icon': CupertinoIcons.person_2_fill},
    {'name': 'Only Me', 'icon': Icons.lock},
  ];
  String title1 = 'Everyone';
  IconData icon1 = CupertinoIcons.globe;
  String title2 = 'Everyone';
  IconData icon2 = CupertinoIcons.globe;
  String title3 = 'Everyone';
  IconData icon3 = CupertinoIcons.globe;
  String title4 = 'Everyone';
  IconData icon4 = CupertinoIcons.globe;
  String title5 = 'Everyone';
  IconData icon5 = CupertinoIcons.globe;
  int selectedIndex = 0;
  final List<String> sizeList = [
    '-36',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '+46',
  ];
  final List<String> ethnicityList = [
    'Asian',
    'Arabic',
    'Oceanic',
    'American',
    'European',
    'Antarctic',
  ];
  final List<String> situation = [
    'Single',
    'Married',
    'Open',
    'Open relationship',
    'Dating',
  ];
  final List<String> roleList = ['Active', 'Versatile', 'Passive'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(
        title: 'Personal Information',
        centerTitle: false,
        titleStyle: TextStyle(
          fontSize: 18.sp,
          fontFamily: FontFamily.helvetica,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.r),
            child: Center(
              child: Column(
                children: [
                  _addProfileImage(),
                  SizedBox(height: 40.h),
                  CustomTextField(
                    controller: _nameTEController,
                    title: 'Full Name',
                    hintText: 'Enter your full name',
                  ),
                  SizedBox(height: 18.h),
                  CustomTextField(
                    controller: _dateOfBirthTEController,
                    title: 'Date of Birth',
                    hintText: 'Date of birth',
                    readOnly: true,
                    suffixIcon: Icon(Icons.calendar_month, color: Colors.white),
                    onTap: () async {
                      final DateTime? dateTime = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(3000),
                        initialDate: selectedDate,
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.dark().copyWith(
                              dialogBackgroundColor: Colors.black,
                              primaryColor: Colors.white,
                              hintColor: Colors.blue,
                              indicatorColor: AppColors.primaryColor,
                              buttonTheme: ButtonThemeData(
                                textTheme: ButtonTextTheme.primary,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );

                      if (dateTime != null) {
                        setState(() {
                          _dateOfBirthTEController.text =
                              "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
                        });
                      }
                    },
                  ),
                  SizedBox(height: 8.h),
                  _whoCanSeeWidget(
                    onSelected: (newValue) {
                      setState(() {
                        title1 =
                            newValue; // Separate variable for first instance
                        icon1 = whoCanSeeButtons.firstWhere(
                          (e) => e['name'] == newValue,
                        )['icon'];
                      });
                    },
                    currentTitle: title1,
                    currentIcon: icon1,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    controller: _sizeTEController,
                    title: 'Size',
                    hintText: 'Select number',
                    suffixIcon: CustomPopupMenuButton(
                      items: sizeList,
                      controller: _sizeTEController,
                      menuColor: AppColors.borderColor,
                    ),
                    // suffixIcon: PopupMenuButton<String>(
                    //   icon: Icon(
                    //     Icons.arrow_drop_down_sharp,
                    //     size: 30.h,
                    //     color: Colors.white,
                    //   ),
                    //   color: AppColors.borderColor,
                    //   itemBuilder: (BuildContext context) =>
                    //       List.generate(sizeList.length, (index) {
                    //         return PopupMenuItem<String>(
                    //           value: sizeList[index],
                    //           child: CustomText(text: sizeList[index]),
                    //         );
                    //       }),
                    //   onSelected: (String size) {
                    //     setState(() {
                    //       _sizeTEController.text = size;
                    //     });
                    //   },
                    //
                    //   // icon: Icon(Icons.public,color: Colors.white,),
                    // ),
                  ),
                  SizedBox(height: 16.h),
                  _heightWeightTextField(
                    title: 'Height',
                    hintText: "Select Height",
                    controller: _heightTEController,
                    unit: 'Cm',
                  ),
                  SizedBox(height: 16.h),
                  _heightWeightTextField(
                    title: 'Weight',
                    hintText: "Select Weight",
                    controller: _weightTEController,
                    unit: 'Kg',
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    controller: _locationTEController,
                    hintText: 'Miami, usa',
                    title: 'Location',
                    suffixIcon: Icon(
                      Icons.location_on_sharp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: 'Phone Number(optional)'),
                      SizedBox(height: 8.h),
                      Theme(
                        data: Theme.of(context).copyWith(
                          textSelectionTheme: TextSelectionThemeData(
                            cursorColor: AppColors.greyColor, // Cursor color
                            selectionColor:
                                AppColors.greyColor, // Text selection highlight
                          ),
                        ),
                        child: IntlPhoneField(
                          style: TextStyle(color: AppColors.greyColor),
                          decoration: InputDecoration(
                            // labelText: 'Phone Number',
                            counterText: '',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                color: AppColors.borderColor.withOpacity(.5),
                              ),
                            ),
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                              color: AppColors.greyColor,
                              fontFamily: FontFamily.helvetica,
                              fontSize: 14.sp,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                color: AppColors.borderColor.withOpacity(.5),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                color: AppColors.borderColor.withOpacity(.5),
                              ),
                            ),
                            filled: true,
                            fillColor: AppColors.secondaryColor,
                          ),
                          initialCountryCode: 'US',
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                        ),
                      ),
                      SizedBox(height: 8.h),
                      _whoCanSeeWidget(
                        onSelected: (newValue) {
                          setState(() {
                            title2 = newValue;
                            icon2 = whoCanSeeButtons.firstWhere(
                              (e) => e['name'] == newValue,
                            )['icon'];
                          });
                        },
                        currentTitle: title2,
                        currentIcon: icon2,
                      ),
                      SizedBox(height: 16.h),
                      CustomTextField(
                        controller: _ethnicityTEController,
                        title: 'Ethnicity',
                        hintText: 'Select One',
                        readOnly: true,
                        suffixIcon: CustomPopupMenuButton(
                          menuColor: AppColors.borderColor,
                          items: ethnicityList,
                          controller: _ethnicityTEController,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      _whoCanSeeWidget(
                        onSelected: (newValue) {
                          setState(() {
                            title3 =
                                newValue; // Separate variable for first instance
                            icon3 = whoCanSeeButtons.firstWhere(
                              (e) => e['name'] == newValue,
                            )['icon'];
                          });
                        },
                        currentTitle: title3,
                        currentIcon: icon3,
                      ),
                      SizedBox(height: 16.h),
                      CustomTextField(
                        controller: _situationTEController,
                        title: 'Situation',
                        hintText: 'Select One',
                        readOnly: true,
                        suffixIcon: CustomPopupMenuButton(
                          menuColor: AppColors.borderColor,
                          items: situation,
                          controller: _situationTEController,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      _whoCanSeeWidget(
                        onSelected: (newValue) {
                          setState(() {
                            title4 =
                                newValue; // Separate variable for first instance
                            icon4 = whoCanSeeButtons.firstWhere(
                              (e) => e['name'] == newValue,
                            )['icon'];
                          });
                        },
                        currentTitle: title4,
                        currentIcon: icon4,
                      ),
                      SizedBox(height: 16.h),
                      CustomTextField(
                        controller: _roleTEController,
                        title: 'Role',
                        hintText: 'Select One',
                        readOnly: true,
                        suffixIcon: CustomPopupMenuButton(
                          menuColor: AppColors.borderColor,
                          items: roleList,
                          controller: _roleTEController,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      _whoCanSeeWidget(
                        onSelected: (newValue) {
                          setState(() {
                            title5 =
                                newValue; // Separate variable for first instance
                            icon5 = whoCanSeeButtons.firstWhere(
                              (e) => e['name'] == newValue,
                            )['icon'];
                          });
                        },
                        currentTitle: title5,
                        currentIcon: icon5,
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  CustomButton(onPressed: () {}, label: 'Continue',fontSize: 20.sp,fontWeight: FontWeight.w700,),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _whoCanSeeWidget({
    required Function(String) onSelected,
    required String currentTitle,
    required IconData currentIcon,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: 'Who can see this?'),
        PopupMenuButton<String>(
          color: AppColors.borderColor,
          itemBuilder: (BuildContext context) =>
              List.generate(whoCanSeeButtons.length, (index) {
                final values = whoCanSeeButtons[index];
                return PopupMenuItem<String>(
                  value: values['name'],
                  child: Row(
                    children: [
                      Icon(values['icon'], color: Colors.white, size: 20.h),
                      CustomText(text: values['name']),
                    ],
                  ),
                );
              }),
          onSelected: onSelected,
          // icon: Icon(Icons.public,color: Colors.white,),
          child: Row(
            spacing: 2,
            children: [
              Icon(currentIcon, color: Colors.white, size: 18.h),
              CustomText(text: currentTitle),
              Icon(Icons.arrow_drop_down, color: Colors.white),
            ],
          ),
        ),
      ],
    );
  }

  Widget _heightWeightTextField({
    String? title,
    String? hintText,
    required TextEditingController controller,
    String? unit,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: title ?? ''),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: controller,
                hintText: hintText,
              ),
            ),
            SizedBox(width: 4.w),
            CustomContainer(
              alignment: Alignment.center,
              height: 50.h,
              width: 105.w,
              radiusAll: 16.r,
              color: AppColors.secondaryColor,
              border: Border.all(color: AppColors.borderColor.withOpacity(.5)),
              // borderRadius: BorderRadius.circular(16.r),
              child: CustomText(text: unit ?? '', color: AppColors.greyColor),
            ),
          ],
        ),
      ],
    );
  }

  Widget _addProfileImage() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CustomNetworkImage(
          imageUrl: "https://i.pravatar.cc/150?img=31",
          height: 120.h,
          width: 120.w,
          borderRadius: BorderRadius.circular(1000.r),
        ),
        GestureDetector(
          onTap: () {},
          child: CustomContainer(
            alignment: Alignment.center,
            height: 30.h,
            width: 30.w,
            color: AppColors.primaryColor,
            radiusAll: 8.r,
            shape: BoxShape.circle,
            child: Icon(
              CupertinoIcons.photo_camera_solid,
              color: Colors.white,
              size: 14.h,
            ),
          ),
        ),
      ],
    );
  }
}
