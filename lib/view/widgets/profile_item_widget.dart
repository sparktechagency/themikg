import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_network_image.dart';
import 'package:themikg/view/widgets/custom_text.dart';

class ProfileItem extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final String fullName;
  final bool isSelected;
  final VoidCallback onTap;

  const ProfileItem({
    required this.imageUrl,
    required this.userName,
    required this.fullName,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: CustomNetworkImage(
        imageUrl: imageUrl,
        height: 41.h,
        width: 41.w,
        boxShape: BoxShape.circle,
      ),
      title: CustomText(text: userName, textAlign: TextAlign.start),
      subtitle: Row(
        spacing: 4,
        children: [
          CustomText(
            text: fullName,
            textAlign: TextAlign.start,
            fontSize: 12.sp,
            color: AppColors.greyColor,
          ),
        ],
      ),
      trailing: CustomButton(
        onPressed: onTap,
        label: isSelected ? 'Linked' : 'Link',
        backgroundColor: isSelected ? Colors.transparent : null,
        bordersColor: isSelected ? AppColors.primaryColor : null,
        height: 30.h,
        width: 92.w,
      ),
    );
  }
}
