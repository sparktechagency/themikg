import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/models/comment_model/comment_model.dart';
import 'package:themikg/view/widgets/custom_bottom_sheet.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_network_image.dart';
import 'package:themikg/view/widgets/custom_text.dart';
import 'package:themikg/view/widgets/text_field_widget.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final List<CommentModel> commentData = [
    CommentModel(
      profileImage: "https://i.pravatar.cc/150?img=20",
      name: 'James Hudson',
      userName: 'j_hudson',
      comment:
      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      likeCount: 453,
      commentTime: DateTime.now(),
    ),
    CommentModel(
      profileImage: "https://i.pravatar.cc/150?img=20",
      name: 'James Hudson',
      userName: 'j_hudson',
      comment:
      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      likeCount: 453,
      commentTime: DateTime.now(),
    ),
    CommentModel(
      profileImage: "https://i.pravatar.cc/150?img=20",
      name: 'James Hudson',
      userName: 'hudso_134n',
      comment:
      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      likeCount: 453,
      commentTime: DateTime.now(),
    ),
    CommentModel(
      profileImage: "https://i.pravatar.cc/150?img=20",
      name: 'James Hudson',
      userName: 'dsfh15',
      comment:
      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      likeCount: 453,
      commentTime: DateTime.now(),
    ),
    CommentModel(
      profileImage: "https://i.pravatar.cc/150?img=20",
      name: 'James Hudson',
      userName: 'sdfj1234',
      comment:
      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      likeCount: 453,
      commentTime: DateTime.now(),
    ),
    // More comment models...
  ];

  String hintText = 'Your comment...';

  void onReplyTap(String userName) {
    setState(() {
      hintText = 'Replying to $userName';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(title: 'Comments'),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: commentData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(16.r),
                  child: CommentWidget(
                    profileImage: commentData[index].profileImage,
                    userName: commentData[index].userName,
                    name: commentData[index].name,
                    commentText: commentData[index].comment,
                    commentLikesCount: commentData[index].likeCount,
                    onTapReplay: () => onReplyTap(commentData[index].userName),
                  ),
                );
              },
            ),
          ),
          CustomContainer(
            alignment: Alignment.center,
            height: 154.h,
            linearColors: [Color(0xFF282828), Color(0xFF0E0E0E)],
            child: Padding(
              padding: EdgeInsets.all(24.r),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(1000.r),
                    child: CustomNetworkImage(
                      imageUrl: "https://i.pravatar.cc/150?img=21",
                      height: 40.h,
                      width: 40.w,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextFieldWidget(
                      hintText: hintText, // Default hint text
                      isPrefixShowing: false,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  CustomContainer(
                    alignment: Alignment.center,
                    height: 52.h,
                    width: 52.w,
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                    child: Assets.icons.sendMessageIcon.svg(
                      height: 20.h,
                      width: 20.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class CommentWidget extends StatefulWidget {
  const CommentWidget({
    super.key,
    required this.profileImage,
    required this.userName,
    required this.name,
    required this.commentText,
    required this.commentLikesCount,
    this.onTapReplay,
  });

  final String profileImage;
  final String userName;
  final String name;
  final String commentText;
  final int commentLikesCount;
  final void Function()? onTapReplay;

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  int selectedIndex = 0;
  List<String> bottomSheetButton = ['Edit', 'Delete'];
  final List<VoidCallback> bottomSheetButtonAction = [() {}, () {}];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: CustomNetworkImage(
            imageUrl: widget.profileImage,
            height: 41.h,
            width: 41.w,
            boxShape: BoxShape.circle,
          ),
          title: CustomText(text: widget.userName, textAlign: TextAlign.start),
          subtitle: CustomText(
            text: widget.name,
            textAlign: TextAlign.start,
            fontSize: 12.sp,
            color: AppColors.greyColor,
          ),
          trailing: GestureDetector(
            onTap: () {
              customBottomSheet(
                context: context,
                buttons: bottomSheetButton,
                onPressedCallbacks: bottomSheetButtonAction,
              );
            },
            child: Assets.icons.moreCircleIcon.svg(),
          ),
        ),
        SizedBox(height: 12.h),
        CustomText(text: widget.commentText, textAlign: TextAlign.start),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 8,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = selectedIndex == 0 ? 1 : 0;
                    });
                  },
                  child: Assets.icons.reactIcon1.svg(
                    color: selectedIndex == 1 ? AppColors.primaryColor : null,
                  ),
                ),
                CustomText(text: widget.commentLikesCount.toString()),
              ],
            ),
            // The "Reply" button
            TextButton(
              onPressed: widget.onTapReplay, // Change hint text when tapped
              child: CustomText(text: 'Reply', fontSize: 12.sp),
            ),
            SizedBox.shrink(),
            CustomText(
              text: '6 hours ago',
              fontSize: 10.sp,
              color: AppColors.greyColor,
            ),
          ],
        ),
      ],
    );
  }
}

