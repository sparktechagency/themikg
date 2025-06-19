import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_network_image.dart';
import 'package:themikg/view/widgets/custom_text.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<String> _notificationDate = ["Today", "Yesterday", "10 Days Ago"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(title: 'Communications'),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 16.h) ,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: _notificationDate[index],
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: CustomNetworkImage(
                        imageUrl: "https://i.pravatar.cc/150?img=21",
                        height: 41.h,
                        width: 41.w,
                        boxShape: BoxShape.circle,
                      ),
                      title: CustomText(
                        text: 'Jane_Co100',
                        textAlign: TextAlign.start,
                      ),
                      subtitle: Row(
                        spacing: 4,
                        children: [
                          CustomText(
                            text: "Started following you.",
                            textAlign: TextAlign.start,
                            fontSize: 12.sp,
                            color: AppColors.greyColor,
                          ),
                          CustomText(
                            text: "4h",
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
              ],
            );
          },
        ),
      ),
    );
  }
}
