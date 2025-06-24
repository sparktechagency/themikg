import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_text.dart';

void customBottomSheet({
  required BuildContext context,
  required List<String> buttons,
  required List<VoidCallback> onPressedCallbacks,
  Color buttonColor = AppColors.primaryColor,
  List<Widget>? prefixIcons,
  List<Color>? buttonColors, // New parameter for custom button colors
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return SafeArea(
        child: CustomContainer(
          width: double.infinity,
          topLeftRadius: 24.r,
          topRightRadius: 24.r,
          color: AppColors.bgColor,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: CustomContainer(
                    height: 3.h,
                    width: 38.w,
                    color: AppColors.borderColor,
                    radiusAll: 16.r,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(buttons.length, (index) {
                    // Determine the button color
                    Color currentButtonColor =
                        buttonColors?[index] ??
                        (index == 2 ? AppColors.errorColor : buttonColor);

                    return Padding(
                      padding: EdgeInsets.only(left: 16.w, bottom: 4.h),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          overlayColor: currentButtonColor.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        onPressed: onPressedCallbacks[index],
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          child: Row(
                            children: [
                              prefixIcons?.isNotEmpty == true
                                  ? prefixIcons![index]
                                  : SizedBox.shrink(),
                              prefixIcons?.isNotEmpty == true
                                  ? SizedBox(width: 16.w)
                                  : SizedBox.shrink(),
                              CustomText(
                                text: buttons[index],
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: index == 2 ||index ==3 ? AppColors.errorColor : null,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
