import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_text.dart';
import 'package:themikg/view/widgets/text_field_widget.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(
        title: 'Wallet',
        titleStyle: TextStyle(
          fontSize: 18.sp,
          fontFamily: FontFamily.helvetica,
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                height: 180.h,
                width: 345.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.images.walletBgPage.path),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "\$340.00",
                      fontSize: 24.sp,
                      fontName: FontFamily.trajanPro,
                    ),
                    SizedBox(height: 8.h),
                    CustomText(
                      text: 'Your balance',
                      fontSize: 18.sp,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      hintText: 'Enter withdraw amount here...',
                      keyboardType: TextInputType.number,
                      hintFontSize: 12.sp,
                      isPrefixShowing: false,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  CustomButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.transparent,
                            title: CustomContainer(
                              height: 245.h,
                              width: 335.w,
                              linearColors: [
                                Color(0xFF282828),
                                Color(0xFF0E0E0E),
                              ],
                              color: Colors.white,
                              radiusAll: 16.r,
                              child: Stack(
                                children: [
                                  // The main content of the dialog
                                  Padding(
                                    padding: EdgeInsets.all(16.r),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 16.h),

                                        // Just some space to push content down a bit
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(text: 'Amount'),
                                            CustomText(text: '\$150'),
                                          ],
                                        ),
                                        Divider(color: AppColors.borderColor),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(text: 'Service Fee 10%'),
                                            CustomText(text: '\$15'),
                                          ],
                                        ),
                                        Divider(color: AppColors.borderColor),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                              text: 'Withdraw-able amount',
                                              fontWeight: FontWeight.w600,
                                            ),
                                            CustomText(text: '\$135'),
                                          ],
                                        ),
                                        Divider(color: AppColors.borderColor),
                                        SizedBox(height: 16.h),
                                        CustomButton(
                                          onPressed: () {},
                                          label: 'Ok',
                                          height: 46.h,
                                          width: 132.w,
                                          radius: 16.r,
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Close icon in the top-right corner
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 20.h,
                                      ),
                                      onPressed: () {
                                        Navigator.of(
                                          context,
                                        ).pop(); // Close the dialog
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    label: 'Withdraw Now',
                    width: 132.w,
                    height: 53.h,
                    radius: 16.r,
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              CustomText(
                text: 'History',
                fontSize: 20.sp,
                fontName: FontFamily.trajanPro,
              ),
              SizedBox(height: 8.h),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    // leading: SizedBox.shrink(),
                    title: CustomText(
                      text: 'Withdraw',
                      fontSize: 16.sp,
                      textAlign: TextAlign.start,
                    ),
                    subtitle: CustomText(
                      text: '22-july-2024',
                      fontSize: 10.sp,
                      textAlign: TextAlign.start,
                    ),
                    trailing: CustomText(text: '\$100', fontSize: 16.sp),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
