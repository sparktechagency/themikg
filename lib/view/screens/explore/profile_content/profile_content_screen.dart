import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_network_image.dart';
import 'package:themikg/view/widgets/custom_text.dart';

class ProfileContentScreen extends StatefulWidget {
  const ProfileContentScreen({super.key});

  @override
  State<ProfileContentScreen> createState() => _ProfileContentScreenState();
}

class _ProfileContentScreenState extends State<ProfileContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: CustomNetworkImage(
              imageUrl: "https://i.pravatar.cc/150?img=21",
              height: 41.h,
              width: 41.w,
              boxShape: BoxShape.circle,
            ),
            title: CustomText(text: 'Jane_Co100', textAlign: TextAlign.start),
            subtitle: Row(
              spacing: 4,
              children: [
                CustomText(
                  text: "Wade Warren",
                  textAlign: TextAlign.start,
                  fontSize: 12.sp,
                  color: AppColors.greyColor,
                ),
              ],
            ),
            trailing: CustomButton(
              onPressed: () {},
              label: 'Link',
              height: 30.h,
              width: 92.w,
            ),
          );
        },
      ),
    );
  }
}
