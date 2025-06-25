import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/story_view.dart';
import 'package:themikg/app/routes/app_routes.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/helper/image_picker_helper.dart';
import 'package:themikg/models/home_post/home_post_model.dart';
import 'package:themikg/models/story_model/story_model.dart';
import 'package:themikg/view/screens/add_content/nebulox/nebulox_screen.dart';
import 'package:themikg/view/screens/story_screen/story_screen.dart';
import 'package:themikg/view/widgets/ProductImageCarouselSlider.dart';
import 'package:themikg/view/widgets/card_for_post.dart';
import 'package:themikg/view/widgets/circle_profile_for_story.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_dialog.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_network_image.dart';
import 'package:themikg/view/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePickerHelper _imagePickerHelper = ImagePickerHelper();
  File? _profileImage;
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

  Future<void> _getPhotoFromCamera() async {
    final image = await _imagePickerHelper.pickFromCamera();
    if (image != null) {
      setState(() {
        _profileImage = image;
      });
      Get.to(() => NebuloxScreen(image: _profileImage!));
    }
  }

  // final List<StoryModel> userStory=[
  //   StoryModel(profileImage: _postList, userName: userName, storyUrl: storyUrl)
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(
        showLeading: false,
        title: 'ThemIKG',
        titleSize: 20.sp,
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.notificationsScreen);
              },
              child: Assets.icons.notificationIcon.svg(),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _postList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
            child: CardForPost(
              profileImage: _postList[index].profilePicture,
              name: _postList[index].name,
              userName: _postList[index].userName,
              postImage: _postList[index].postImage,
              postTitle: _postList[index].postTitle ?? '',
              likeCount: _postList[index].likeCount,
              commentCount: _postList[index].commentCount,
              bottomSheetButtonAction: [
                () {
                  Get.toNamed(AppRoutes.userProfileScreen);
                },
                () {
                  customPopUpWidget(
                    context: context,
                    title: 'Block',
                    subtitle: "Are you sure you want to block this user?",
                    firstButton: 'Cancel',
                    lastButton: 'Block',
                  );
                },
                () {
                  Get.toNamed(AppRoutes.reportScreen);
                },
              ],
              bottomSheetButton: ['View Profile', 'Block Profile', 'Report...'],
            ),
          );
        },
      ),
      bottomNavigationBar: CustomContainer(
        alignment: Alignment.center,
        height: 102.h,
        color: AppColors.bgColor,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 8.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _getPhotoFromCamera,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CustomContainer(
                          alignment: Alignment.center,
                          height: 65.h,
                          width: 65.w,
                          shape: BoxShape.circle,
                          child: ClipOval(
                            child: CustomNetworkImage(
                              imageUrl: 'https://i.pravatar.cc/150?img=40',
                            ),
                          ),
                        ),
                        CustomContainer(
                          alignment: Alignment.center,
                          height: 25.h,
                          width: 25.w,
                          color: Colors.white,
                          shape: BoxShape.circle,
                          bordersColor: Colors.white,
                          child: Icon(
                            Icons.add_circle,
                            color: AppColors.primaryColor,
                            size: 20.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomText(text: "My Nebulox"),
                ],
              ),
              SizedBox(width: 16.w),
              ListView.builder(
                itemCount: _postList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
            ],
          ),
        ),
      ),
    );
  }
}
