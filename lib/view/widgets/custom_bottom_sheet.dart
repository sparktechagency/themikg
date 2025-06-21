import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_text.dart';

void customBottomSheet({
  required BuildContext context,
  required List<String> buttons,
  required List<VoidCallback> onPressedCallbacks,
  Color buttonColor = AppColors.primaryColor,
  List<Widget>? prefixIcons,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    // Allow the bottom sheet to adjust height based on its content
    builder: (context) {
      return SafeArea(
        child: CustomContainer(
          width: double.infinity,
          topLeftRadius: 24.r,
          topRightRadius: 24.r,
          color: AppColors.bgColor,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            // Add vertical padding for better spacing
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              // Let the column take the minimum height based on content
              children: List.generate(buttons.length, (index) {
                return Padding(
                  padding: EdgeInsets.only(left: 16.w, bottom: 4.h),
                  //Adjust bottom padding for space between buttons
                  child: TextButton(
                    // clipBehavior: Clip.,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      overlayColor: buttonColor.withOpacity(0.2),
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
                          prefixIcons?.isNotEmpty == true? SizedBox(width: 16.w,):SizedBox.shrink(),
                          CustomText(
                            text: buttons[index],
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: index == 2 ? AppColors.errorColor : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      );
    },
  );
}
