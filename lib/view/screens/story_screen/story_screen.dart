import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';

class StoryScreen extends StatelessWidget {
  final List<String> stories;
  final String profileImage;
  final String userName;
  final StoryController controller = StoryController();

  StoryScreen({
    super.key,
    required this.stories,
    required this.profileImage,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          StoryView(
            storyItems: stories.map((url) {
              return StoryItem.pageImage(
                url: url,
                controller: controller,
                duration: const Duration(seconds: 5),
              );
            }).toList(),
            controller: controller,
            onComplete: () => Navigator.pop(context),
            onVerticalSwipeComplete: (direction) {
              if (direction == Direction.down) Navigator.pop(context);
            },
          ),

          // 🔼 Top Profile Row
          Positioned(
            top: 50.h,
            left: 16.w,
            right: 16.w,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: NetworkImage(profileImage),
                ),
                SizedBox(width: 10.w),
                Text(
                  userName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),

          // 🔽 Bottom Comment Input
          Positioned(
            bottom: 30.h,
            left: 16.w,
            right: 16.w,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Send message...",
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.black26,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Icon(Icons.send, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}