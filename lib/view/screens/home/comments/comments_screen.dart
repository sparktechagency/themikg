import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/models/comment_model/comment_model.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_network_image.dart';
import 'package:themikg/view/widgets/custom_text.dart';

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
    ),
    CommentModel(
      profileImage: "https://i.pravatar.cc/150?img=21",
      name: 'Lina Suarez',
      userName: 'lina_s',
      comment:
          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      likeCount: 453,
    ),
    CommentModel(
      profileImage: "https://i.pravatar.cc/150?img=22",
      name: 'Lina Suarez',
      userName: 'lina_s',
      comment:
          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      likeCount: 453,
    ),
  ];
  List<String> bottomSheetButton = ['Edit', 'Delete'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(title: 'Comments'),
      body: ListView.builder(
        itemCount: commentData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(16.r),
            child: CommentWidget(
              profileImage: commentData[index].profileImage,
              userName: commentData[index].userName,
              name: commentData[index].name,
              commentText: commentData[index].comment,
              commentLikesCount: commentData[index].likeCount ,
            ),
          );
        },
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
  });

  final String profileImage;
  final String userName;
  final String name;
  final String commentText;
  final int commentLikesCount;

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> bottomSheetButton = ['Edit', 'Delete'];
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
              showModalBottomSheet(
                context: context,
                scrollControlDisabledMaxHeightRatio: .15,
                builder: (context) {
                  return CustomContainer(
                    width: double.infinity,
                    topLeftRadius: 24.r,
                    topRightRadius: 24.r,
                    color: AppColors.bgColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(bottomSheetButton.length, (
                        index,
                      ) {
                        return TextButton(
                          // autofocus: true,
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            overlayColor: AppColors.primaryColor.withOpacity(
                              0.2,
                            ),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          onPressed: () {},
                          child: CustomText(
                            text: bottomSheetButton[index],
                            fontSize: 18.sp,
                            // fontName: FontFamily.trajanPro,
                            fontWeight: FontWeight.w700,
                            color: index == 2 ? AppColors.errorColor : null,
                          ),
                        );
                      }),
                    ),
                  );
                },
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
            TextButton(
              onPressed: () {},
              child: CustomText(text: 'Replay', fontSize: 12.sp),
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
