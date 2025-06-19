import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:themikg/app/routes/app_routes.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/models/reel_model/reel_model.dart';
import 'package:themikg/view/screens/explore/universe_content/blink/blink_video/blink_video_screen.dart';
import 'package:themikg/view/screens/home/comments/comments_screen.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_network_image.dart';
import 'package:themikg/view/widgets/custom_text.dart';
import 'package:video_player/video_player.dart';

class BlinkScreen extends StatefulWidget {
  const BlinkScreen({super.key});

  @override
  State<BlinkScreen> createState() => _BlinkScreenState();
}

class _BlinkScreenState extends State<BlinkScreen> {
  final List<String> dummyImageUrl = List.generate(
    10,
    (index) => "https://picsum.photos/200/300?random=$index",
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
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
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                CustomContainer(
                  height: 202.h,
                  width: 100.w,
                  // color: Colors.white,
                  radiusAll: 8.r,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: CustomNetworkImage(imageUrl: dummyImageUrl[index]),
                  ),
                ),
                Icon(
                  Icons.play_circle_fill_outlined,
                  color: Colors.white,
                  shadows: [Shadow(color: AppColors.greyColor)],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


