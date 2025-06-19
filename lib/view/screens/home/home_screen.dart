import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/story_view.dart';
import 'package:themikg/app/routes/app_routes.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/models/home_post/home_post_model.dart';
import 'package:themikg/models/story_model/story_model.dart';
import 'package:themikg/view/widgets/ProductImageCarouselSlider.dart';
import 'package:themikg/view/widgets/card_for_post.dart';
import 'package:themikg/view/widgets/circle_profile_for_story.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_network_image.dart';
import 'package:themikg/view/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              onTap: (){
                Get.toNamed(AppRoutes.notificationsScreen);
              },
                child: Assets.icons.notificationIcon.svg()),
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
            ),
          );
        },
      ),
      bottomNavigationBar: CustomContainer(
        alignment: Alignment.center,
        height: 102.h,
        color: AppColors.bgColor,
        child: ListView.builder(
          itemCount: _postList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Open story screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => StoryScreen(
                            stories: dummyImage,
                            userName: _postList[index].userName,
                            profileImage: _postList[index].profilePicture,
                          ),
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
    );
  }
}

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
