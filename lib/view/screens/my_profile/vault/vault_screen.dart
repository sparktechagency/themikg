import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/view/screens/explore/universe_content/blink/blink_video/blink_video_screen.dart';
import 'package:themikg/view/widgets/blink_post_widget.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_network_image.dart';
import 'package:themikg/view/widgets/custom_text.dart';

class VaultScreen extends StatefulWidget {
  const VaultScreen({super.key});

  @override
  State<VaultScreen> createState() => _VaultScreenState();
}

class _VaultScreenState extends State<VaultScreen> {
  final List<String> dummyImageUrl = List.generate(
    10,
    (index) => "https://picsum.photos/200/300?random=$index",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(
        title: 'Vault',
        titleStyle: TextStyle(
          fontFamily: FontFamily.helvetica,
          fontSize: 18.sp,
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              _buildTitle('Orbit', () {}),
              GridView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  return CustomContainer(
                    height: 124.h,
                    width: 112.w,
                    color: Colors.transparent,
                    radiusAll: 8.r,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: CustomNetworkImage(imageUrl: dummyImageUrl[index]),
                    ),
                  );
                },
              ),
              SizedBox(height: 24.h),
              _buildTitle('Blink', () {}),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  crossAxisCount: 3,
                  childAspectRatio: .55,
                ),
                itemCount: dummyImageUrl.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReelsScreen()),
                      );
                      // ReelsScreen(reelsList: reelsList);
                    },
                    child: BlinkPostWidget(imageUrl: dummyImageUrl[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildTitle(String title, void Function() onPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: title, fontSize: 16.sp),
        TextButton(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(EdgeInsets.all(0)),
          ),
          onPressed: onPressed,
          child: CustomText(
            text: 'See All',
            color: AppColors.primaryColor,
            decoration: TextDecoration.underline,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
