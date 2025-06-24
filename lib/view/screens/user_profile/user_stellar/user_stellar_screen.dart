import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/view/screens/explore/universe_content/blink/blink_video/blink_video_screen.dart';
import 'package:themikg/view/widgets/blink_post_widget.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_container.dart';

class UserStellarScreen extends StatefulWidget {
  const UserStellarScreen({super.key});

  @override
  State<UserStellarScreen> createState() => _UserStellarScreenState();
}

class _UserStellarScreenState extends State<UserStellarScreen> {
  final List<String> dummyImageUrl = List.generate(
    10,
    (index) => "https://picsum.photos/200/300?random=$index",
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GridView.builder(
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
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0), // Adjust blur level here
            child: Container(
              color: Colors.black.withOpacity(0.5), // Optional: Overlay for darkening
            ),
          ),
        ),
        CustomContainer(
          // color: Color(0xFF00BFFF),
          child: CustomButton(
            onPressed: () {},
            label: 'Unlock to View',
            width: 266.w,
            height: 50.h,
            prefixIcon: Icon(Icons.lock, color: Colors.white,),
          ),
        ),
      ],
    );
  }
}
