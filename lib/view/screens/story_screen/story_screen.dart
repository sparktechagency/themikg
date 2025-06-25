import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/view/widgets/text_field_widget.dart';

class StoryScreen extends StatefulWidget {
  final List<String> stories;
  final String profileImage;
  final String userName;

  const StoryScreen({
    super.key,
    required this.stories,
    required this.profileImage,
    required this.userName,
  });

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  final StoryController controller = StoryController();
  final TextEditingController _messageController = TextEditingController();
  bool reactButton = false;

  @override
  void initState() {
    super.initState();
    _messageController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // StoryView remains unaffected by text field changes
            StoryView(
              storyItems: widget.stories.map((url) {
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
                    backgroundImage: NetworkImage(widget.profileImage),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    widget.userName,
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
              child: CommentInputField(
                messageController: _messageController,
                reactButton: reactButton,
                onReactButtonPressed: () {
                  setState(() {
                    reactButton = !reactButton;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommentInputField extends StatelessWidget {
  final TextEditingController messageController;
  final bool reactButton;
  final VoidCallback onReactButtonPressed;

  const CommentInputField({
    super.key,
    required this.messageController,
    required this.reactButton,
    required this.onReactButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFieldWidget(
            controller: messageController,
            hintText: 'Send Message',
            isPrefixShowing: false,
            suffixIcon: messageController.text.isNotEmpty
                ? Icon(
              Icons.rocket_launch,
              color: Colors.white,
              size: 35.h,
            )
                : null,
          ),
        ),
        SizedBox(width: 8.w),
        GestureDetector(
          onTap: onReactButtonPressed,
          child: Assets.icons.reactIcon1.svg(
            height: 35.h,
            width: 35.w,
            color: reactButton ? AppColors.primaryColor : null,
          ),
        ),
      ],
    );
  }
}

