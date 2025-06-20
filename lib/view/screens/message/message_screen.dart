import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:themikg/app/routes/app_routes.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/models/home_post/home_post_model.dart';
import 'package:themikg/view/screens/story_screen/story_screen.dart';
import 'package:themikg/view/widgets/circle_profile_for_story.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_network_image.dart';
import 'package:themikg/view/widgets/custom_text.dart';
import 'package:themikg/view/widgets/text_field_widget.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final List<String> dummyImage = [
    'https://i.pravatar.cc/150?img=40',
    'https://i.pravatar.cc/150?img=41',
    'https://i.pravatar.cc/150?img=42',
    'https://i.pravatar.cc/150?img=43',
    'https://i.pravatar.cc/150?img=44',
  ];
  final List<HomePostModel> _postList = [
    HomePostModel(
      profilePicture: 'https://i.pravatar.cc/150?img=40',
      name: 'Anniya Willian',
      userName: 'anny_wilson',
      postTitle: 'Quel plaisir de retrouver mes étudiants de Web 2 !',
      postImage: 'https://picsum.photos/id/1011/400/300',
      // random image 1
      commentCount: 95,
      likeCount: 834,
    ),
    HomePostModel(
      profilePicture: 'https://i.pravatar.cc/150?img=41',
      name: 'James Hudson',
      userName: 'j_hudson',
      postTitle: 'Just finished my Flutter project!',
      postImage: 'https://picsum.photos/id/1025/400/300',
      // random image 2
      commentCount: 95,
      likeCount: 834,
    ),
    HomePostModel(
      profilePicture: 'https://i.pravatar.cc/150?img=42',
      name: 'Lina Suarez',
      userName: 'lina_s',
      postTitle: 'Weekend getaway 🌲🌊',
      postImage: 'https://picsum.photos/id/1043/400/300',
      // random image 3
      commentCount: 95,
      likeCount: 834,
    ),
    HomePostModel(
      profilePicture: 'https://i.pravatar.cc/150?img=43',
      name: 'Lina Suarez',
      userName: 'lina_s',
      postTitle: 'Weekend getaway 🌲🌊',
      postImage: 'https://picsum.photos/id/1045/400/300',
      // random image 3
      commentCount: 95,
      likeCount: 834,
    ),
    HomePostModel(
      profilePicture: 'https://i.pravatar.cc/150?img=44',
      name: 'Lina Suarez',
      userName: 'lina_s',
      postTitle: 'Weekend getaway 🌲🌊',
      postImage: 'https://picsum.photos/id/1017/400/300',
      // random image 3
      commentCount: 95,
      likeCount: 834,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(
        title: 'Comms Hub',
        titleSize: 20.sp,
        showLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldWidget(
                hintText: "Search",
                textInputAction: TextInputAction.search,
                maxLine: 1,
              ),
              SizedBox(height: 24.h),
              CustomText(text: 'Recently', fontSize: 18.sp),
              SizedBox(height: 16.h),
              CustomContainer(
                height: 104.h,
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: _postList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Open story screen
                              Get.to(
                                StoryScreen(
                                  stories: dummyImage,
                                  userName: _postList[index].userName,
                                  profileImage: _postList[index].profilePicture,
                                ),
                              );
                            },
                            child: CircleProfileForStory(
                              imageUrl: _postList[index].profilePicture,
                              name: _postList[index].userName,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),
              CustomText(text: 'Message', fontSize: 18.sp),
              ListView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(0),
                    onTap: () {
                      Get.toNamed(AppRoutes.inboxMessageScreen);
                    },
                    leading: Stack(
                      alignment: Alignment(1, .7),
                      children: [
                        CustomNetworkImage(
                          imageUrl: 'https://i.pravatar.cc/150?img=40',
                          height: 60.h,
                          width: 60.w,
                          boxShape: BoxShape.circle,
                        ),
                        CustomContainer(
                          height: 10.h,
                          width: 10.w,
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ],
                    ),
                    title: CustomText(
                      text: 'Annette Black',
                      fontSize: 16,
                      textAlign: TextAlign.start,
                    ),
                    subtitle: CustomText(
                      text: 'How are you?',
                      fontSize: 12.sp,
                      color: AppColors.greyColor,
                      textAlign: TextAlign.start,
                    ),
                    trailing: CustomText(
                      text: 'Today',
                      color: AppColors.greyColor,
                      fontSize: 12.sp,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
